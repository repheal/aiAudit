<?php
namespace app\admin\command;

use think\Config;
use think\db;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Exception;
use app\common\model\Attachment;
use app\common\model\AttachmentAiRelation;
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
       	$this->aliyun_green_async();//针对未提交的素材进行提交
        $this->aliyun_green_callback();//针对视频，音频的数据,回调查询
        $this->attachment_ai_relation_sync();//数据同步至AI结果关系表
        $this->data_ai_result_sync();//数据中心同步ai审核的结果
        
		
    }
    
    private function data_ai_result_sync()
    {
	    $dataList = Data::field('*')->where("ai_status='0' and data_status='5'")->select();
	    $aids = [];
	    if($dataList)
	    {
	    	foreach($dataList as $key => $value )
		    {
			    $aids[] = $value->file_id;
		    }
	    }
	    if($aids)
	    {
	    	$attachmentAiRelationList = AttachmentAiRelation::where('aid' , 'in', $aids)->select();
	    	$dataAiResult = $dataAiResultKey = [];
	    	foreach($attachmentAiRelationList as $key => $value)
	    	{
		    	$dataAiResult[$value->aid][] = array(
		    			'aid' 			=> $value->aid,
		    			'label' 		=> $value->label,
		    			'rate' 			=> $value->rate,
		    			'scene' 		=> $value->scene,
		    			'suggestion'	=> $value->suggestion,
		    			'result_type' 	=> $value->result_type,
		    	);
		    	
		    	if(isset($dataAiResultKey[$value->aid]) && $dataAiResultKey[$value->aid])
		    	{
		    		if($dataAiResultKey[$value->aid] === 'pass')
		    		{
		    		
			    		if($value->suggestion === 'review')
			    		{
				    		$dataAiResultKey[$value->aid] = $value->suggestion;
			    		}
			    		if($value->suggestion === 'block')
			    		{
				    		$dataAiResultKey[$value->aid] = $value->suggestion;
			    		}
		    		}
		    		if($dataAiResultKey[$value->aid] === 'review')
		    		{
			    		if($value->suggestion === 'block')
			    		{
				    		$dataAiResultKey[$value->aid] = $value->suggestion;
			    		}
		    		}
		    		if($dataAiResultKey[$value->aid] === 'block')
		    		{
			    		$dataAiResultKey[$value->aid] = 'block';//原本这里是可以什么都不用
		    		}
		    	}
		    	else
		    	{
			    	$dataAiResultKey[$value->aid] = $value->suggestion;//不存在，就直接匹配上
		    	}
		    	
		    	if($value->suggestion === 'block')//违规
		    	{
			    	$dataAiResultKey[$value->aid] = $value->suggestion;
		    	}		    	
	    	}		    
	    }
	    $ai_dict = array(
	    	'pass' 		=> 1,
	    	'review' 	=> 2,
	    	'block' 	=> 3,
	    );
	    if($dataAiResultKey)
	    {
		    foreach($dataAiResultKey as $key => $value)
		    {
			    Data::where('file_id' , $key)->update(['ai_result'=>$value,'ai_result_detail'=>json_encode($dataAiResult[$key]),'ai_status' => $ai_dict[$value]]);//同步完成后，更新素材表
		    }		    
	    }
	    
	    echo "完成数据中心同步ai审核结果\n";
	    print_r($dataAiResultKey);
	    //print_r($dataAiResult);

	    
    }
    
    private function attachment_ai_relation_sync()
    {
    	$attachmentList = Attachment::field('id,mimetype,airesult,is_aisyncrelation')->where('airesult!="" and is_aisyncrelation=0')->select();
    	if($attachmentList)
    	{
    		$tmp_data 	= array();
    		$this_time	= time();
    		foreach($attachmentList as $key => $value)
    		{
	    		$tmp_type 		= explode('/',$value->mimetype);
	    		$tmp_airesult	= json_decode($value->airesult,1);
	    		
	    		if($tmp_airesult['data'] && $tmp_airesult['data'][0]['code'] === 200 && isset($tmp_airesult['data'][0]['results']))
	    		{
		    		if($tmp_airesult['data'][0]['results'])
		    		{
			    		foreach($tmp_airesult['data'][0]['results'] as $kk => $vv)
			    		{
				    		$tmp_data[]		= array(
				    			'aid' 			=> $value->id,
				    			'label' 		=> $vv['label'],
				    			'rate' 			=> $vv['rate'],
				    			'scene' 		=> $vv['scene'],
				    			'suggestion'	=> $vv['suggestion'],
				    			'result_type' 	=> 'default',
				    			'createtime'	=> $this_time,
				    			'updatetime'	=> $this_time,
				    		);
			    		}
		    		}
	    		}
	    		
	    		if($tmp_airesult['data'] && $tmp_airesult['data'][0]['code'] === 200 && isset($tmp_airesult['data'][0]['audioScanResults']))
	    		{
		    		if($tmp_airesult['data'][0]['audioScanResults'])
		    		{
			    		foreach($tmp_airesult['data'][0]['audioScanResults'] as $kk => $vv)
			    		{
				    		$tmp_data[]		= array(
				    			'aid' 			=> $value->id,
				    			'label' 		=> $vv['label'],
				    			'rate' 			=> $vv['rate'],
				    			'scene' 		=> $vv['scene'],
				    			'suggestion'	=> $vv['suggestion'],
				    			'result_type' 	=> 'video_audio',
				    			'createtime'	=> $this_time,
				    			'updatetime'	=> $this_time,
				    		);
			    		}
		    		}
	    		}
    		}
    		
    		$db_prefix = Config('database.prefix');
    		$sql = "replace into `" . $db_prefix . "attachment_ai_relation`(aid,label,rate,scene,suggestion,result_type,createtime,updatetime) values";
    		$space = $sql_suffix = '';
    		//$tmp = $sql =Db::query($sql);
    		$aids = [];
	    	foreach($tmp_data as $k => $v)
	    	{
		    	$sql_suffix .= $space . "(" .  $v['aid'] . ",'" . $v['label'] . "','" . $v['rate'] . "','" . $v['scene'] . "','" . $v['suggestion'] . "','" . $v['result_type'] . "'," . $v['createtime'] . "," . $v['updatetime'] . ")";
		    	$space = ',';
		    	$aids[] = $v['aid'];
	    	}
	    	$aids = array_unique($aids);
			Attachment::where('id' , 'in', $aids)->update(['is_aisyncrelation'=>1]);//同步完成后，更新素材表
	    	echo ("已经执行同步AI结果关系\n");
    	}
    	
    	
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
//		      	if(in_array($tmp_type[0],['image','audio','video','text']))
				if(in_array($tmp_type[0],['image','text']))//同步会直接有结果
				{
					Attachment::update(['id' => $value->id, 'airesult' => json_encode($tmp_ret),'is_aisuccess'=>1]);
				}
				else
				{
					Attachment::update(['id' => $value->id, 'airesult' => json_encode($tmp_ret)]);
				}

		      	
		        
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
							        Attachment::update(['id' => $value['id'], 'airesult' => json_encode($tmp_ret),'is_aisuccess'=>1]);
							    }
							    echo ("已经执行回调同步\n");
							    
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
			                                         'scenes' => ['porn', 'terrorism', 'ad', 'qrcode', 'live', 'logo'],
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
			                                         'scenes' => ['antispam'],
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
