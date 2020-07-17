<?php
namespace app\admin\command;

use think\Config;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Exception;
use app\common\model\Attachment;
use app\admin\model\Data;
use OSS\OssClient;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;

class Crond extends Command
{
    protected function configure()
    {
        $this->setName('Cron')->setDescription('计划任务');
    }

    protected function execute(Input $input, Output $output)
    {
        $this->doCron();
        $output->writeln("已经执行计划任务");//此代码主要是输出到命令行
    }

    public function doCron()
    {
        //在这个里做自己的计划任务工作等等,建议自己创建一个model业务类专门管理你的业务逻辑,最好通过静态方法调用
       // echo 123;
       	$this->aliyun_green_async();
        $this->aliyun_green_callback();//针对视频，音频的数据
		
    }
    
    private function aliyun_green_async()//异步执行，未提交的素材
    {
	    $attachmentList = Attachment::where('airesult=""')->select();
		//print_r($attachmentList);
		if($attachmentList)
		{
			foreach($attachmentList as $key => $value)
			{
				$tmp_type = explode('/',$value->mimetype);
		        $tmp_ret = $this->aliyun_green_create($value->url,$tmp_type[0]);
		        $update_status = [];
		        if($tmp_ret['code'] == 200)
		        {
		            if(!isset($tmp_ret['data'][0]['results']))//不存在，基本是异步
		            {
		                $update_status['data_status'] = 4;
		                $update_status['ai_status'] = 0;
		            }
		            else//同步这边需要处理一下
		            {
		                $update_status['data_status'] = 5;
		                $update_status['ai_status'] = 0;
		            }
		        }
		        else//失败
		        {
		            $update_status['data_status'] = 5;
		            $update_status['ai_status'] = 4;
		        }
		        Data::where('file_id', $value->id)->update($update_status);
		      //  file_put_contents(CACHE_PATH . 'ggg3',var_export($tmp_ret,1));
		
		        Attachment::update(['id' => $value->id, 'airesult' => json_encode($tmp_ret)]);
			}
			echo ("已经执行同步素材\n");
		}
		
    }
    
    
    
    
    private function aliyun_green_callback()
    {
	 		$attachmentList = Attachment::where('mimetype in ("video/mp4","audio/mpeg")')->select();

			$config_aliyun = Config::get('aliyun');

			/* file_put_contents(CACHE_PATH . 'sss1',$signedUrl); */

			try {
			    $task1  = [];
			    AlibabaCloud::accessKeyClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'])->regionId('cn-shanghai')->asDefaultClient();

			    foreach($attachmentList as $key => $value)
			    {
					if($value->airesult)
					{
						$tmp_result = json_decode($value->airesult,1);
						if(!isset($tmp_result['data'][0]['results']))//不存在，异步未回调
						{
							$tmp_type = explode('/',$value->mimetype);
							$task1[] = array(
								'type' 		=> $tmp_type[0],
								'taskId' 	=> $tmp_result['data'][0]['taskId'],
								'id'		=> $value->id,
								'url'		=> $value->url,
							);
						}
					}
			    }
	//		    print_r($task1);exit;
			    if($task1)
			    {
			    	foreach($task1 as $key => $value)
			    	{
				    	switch($value['type'])
				    	{
					    	case 'video':
					    		 $result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->VideoAsyncScanResults()
			                          ->jsonBody([
			                                         $value['taskId'],
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			                      $tmp_ret = $result->toArray();
					    	break;
					    	case 'audio':
					    	$result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->VoiceAsyncScanResults()
			                          ->jsonBody([
			                                         $value['taskId'],
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			                      $tmp_ret = $result->toArray();
			                       
					    	break;
					    	default:
					    	break;
				    	}
				    	if($tmp_ret)
				    	{
					    	$update_status = [];
							if($tmp_ret['code'] == 200)
							{
							    if(!isset($tmp_ret['data'][0]['results']))//不存在，基本是异步
							    {
							        $update_status['data_status'] = 4;
							        $update_status['ai_status'] = 0;
							    }
							    else//同步这边需要处理一下
							    {
							        $update_status['data_status'] = 5;
							        $update_status['ai_status'] = 0;
							    }
							    echo ("已经执行回调同步\n");
							    Attachment::update(['id' => $value['id'], 'airesult' => json_encode($tmp_ret)]);
							}
							else//失败
							{
							    $update_status['data_status'] = 5;
							    $update_status['ai_status'] = 4;
							}
							Data::where('file_id', $value['id'])->update($update_status);
				    	}
			    	}   
			    }
			} catch (ClientException $e) {
			    // Print the error message
			    echo $e->getErrorMessage() . PHP_EOL;
			} catch (ServerException $e) {
			    // Print the error message
			    echo $e->getErrorMessage() . PHP_EOL;
			    print_r($e->getResult()->toArray());
			}

     }
     
     private function aliyun_green_create($file,$type = 'image')
     {
     		$tmp = explode('/' , $file);
	     	$filename = $tmp[count($tmp)-1];
			$filePath = ROOT_PATH . 'public' . $file;
			$config_aliyun = config('aliyun');
			$ossClient = new OssClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'], $config_aliyun['endpoint']);
			$ret = $ossClient->uploadFile($config_aliyun['bucket'], $filename, $filePath);
			/*
			$options = array(
			OssClient::OSS_PROCESS => "image/resize,m_lfit,h_100,w_100",
			);
			*/
			$signedUrl = $ossClient->signUrl($config_aliyun['bucket'], $filename, 3600, 'GET');

	        try {
			    $task1  = [
			        'dataId' => uniqid('', true),
			        'url'    => $signedUrl,
			    ];
			    AlibabaCloud::accessKeyClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'])->regionId('cn-shanghai')->asDefaultClient();
			    
			    switch($type)
			    {
				    case 'image':
				    	$result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->imageSyncScan()
			                          ->jsonBody([
			                                         'tasks'  => [$task1],
			                                         'scenes' => ['porn', 'terrorism'],
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			             $tmp_ret = $result->toArray();
				    break;
				    case 'video':
				    	$result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->VideoAsyncScan()
			                          ->jsonBody([
			                                         'tasks'  => [$task1],
			                                         'scenes' => ['porn', 'terrorism','live','logo','ad'],
			                                         'audioScenes' => 'antispam',
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			             $tmp_ret = $result->toArray();
				    break;
				    case 'audio':
				    $result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->VoiceAsyncScan()
			                          ->jsonBody([
			                                         'tasks'  => [$task1],
			                                         'scenes' => ['antispam'],
			                                         'live' => false,
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			             $tmp_ret = $result->toArray();
				    
				    break;
				    case 'text':
				    break;
				    default:
				    unset($task1['url']);
				    $task1['content'] = '测试';
				    	$result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->TextScan()
			                          ->jsonBody([
			                                         'tasks'  => [$task1],
			                                         'scenes' => ['porn', 'terrorism'],
			                                     ])
			                          ->host($config_aliyun['greenPoint'])
			                          ->connectTimeout(20)
			                          ->timeout(25)
			                          ->request();
			             $tmp_ret = $result->toArray();
				    break;
			    }
			    return $tmp_ret;
			} catch (ClientException $e) {
			    // Print the error message
			    echo $e->getErrorMessage() . PHP_EOL;
			} catch (ServerException $e) {
			    // Print the error message
			    echo $e->getErrorMessage() . PHP_EOL;
			    print_r($e->getResult()->toArray());
			}
     }
}
