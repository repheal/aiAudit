<?php
namespace app\admin\command;

use think\Config;
use think\db;
use fast\Random;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Exception;
use app\common\model\Attachment;
use app\common\model\AttachmentAiRelation;
use app\common\model\AttachmentAiSface;
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
       	$this->aliyun_green_async();//1-针对未提交的素材进行提交
        $this->aliyun_green_callback();//2-针对视频，音频的数据,回调查询
        $this->attachment_ai_relation_sync();//3-数据同步至AI结果关系表
        $this->data_ai_result_sync();//4-数据中心同步ai审核的结果
        $this->attachment_ai_sface_local();//5-视频敏感人物图本地化
//$this->test();
        
		
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
			    echo "4-完成数据中心同步ai审核结果\n";	    
		    }
		   
		    //print_r($dataAiResultKey);
		    //print_r($dataAiResult);		    
	    }
	     
    }
    
    private function attachment_ai_relation_sync()
    {
    	$attachmentList = Attachment::field('id,mimetype,airesult,is_aisyncrelation')->where('need_ai=1 and is_aisuccess=1 and is_aisyncrelation=0')->select();
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
    		
    		if($tmp_data)
    		{
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
		    	Db::query($sql . $sql_suffix);
		    	$aids = array_unique($aids);
		    	
				Attachment::where('id' , 'in', $aids)->update(['is_aisyncrelation'=>1]);//同步完成后，更新素材表
		    	echo ("3-已经执行同步AI结果关系\n");
    		}	
    	}
    }
    
    private function aliyun_green_async()//异步执行，未提交的素材
    {
	    $attachmentList = Attachment::where("need_ai=1 and airesult='[]' and is_aisuccess=0")->select();
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
				if(in_array($tmp_type[0],['image','text']) && !$update_status['ai_status'] != 4)//同步会直接有结果
				{
					Attachment::update(['id' => $value->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : json_encode(array()),'is_aisuccess'=>1]);
				}
				else
				{
					Attachment::update(['id' => $value->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : json_encode(array())]);
				}

		      	
		        
			}
			echo ("2-已经执行同步素材\n");
		}
		
    }
    
    private function aliyun_green_callback()
    {
	 		$attachmentList = Attachment::where('need_ai=1 and mimetype in ("video/mp4","audio/mpeg")')->select();

			$config_aliyun = Config::get('aliyun');

			/* file_put_contents(CACHE_PATH . 'sss1',$signedUrl); */

			try {
			    $task1  = [];
			    AlibabaCloud::accessKeyClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'])->regionId('cn-shanghai')->asDefaultClient();

			    foreach($attachmentList as $key => $value)
			    {
			    	$tmp_result = json_decode($value->airesult,1);
					if($tmp_result)
					{
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
							        if($value['type'] === 'video')
							        {
								        $this->attachment_ai_sface_sync($tmp_ret,$value['id']);
							        }
							        Attachment::update(['id' => $value['id'], 'airesult' => json_encode($tmp_ret),'is_aisuccess'=>1]);
							        echo ("1-已经执行回调同步\n");
							    }
							    
							    
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
			
			if($type == 'text')
			{
				//  可能的编码格式
			    $encoding_type_list = array('GBK', 'UTF-8', 'UTF-16LE', 'UTF-16BE', 'ISO-8859-1', 'GB2312');
			    //  根据文件地址获取内容
			    $file_contents = file_get_contents($filePath);
			   // file_put_contents(CACHE_PATH . 'ggg1',$file_contents);
			    //  遍历编码格式
				$txt_encoding_type = '';
			    foreach ($encoding_type_list as $encoding_type) 
			    {
			        $file_contents_encoded = mb_convert_encoding($file_contents, $encoding_type, $encoding_type);
			        if (md5($file_contents) == md5($file_contents_encoded)) 
			        {
			            $txt_encoding_type = $encoding_type;
			        }
			    }
			    //file_put_contents(CACHE_PATH . 'ggg',$txt_encoding_type);
				$task1  = [
			        'dataId' => uniqid('', true),
			        'content'    => $file_contents,
			    ];
			}
			else
			{
				$ossClient = new OssClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'], $config_aliyun['endpoint']);
				$ret = $ossClient->uploadFile($config_aliyun['bucket'], $filename, $filePath);
				$signedUrl = $ossClient->signUrl($config_aliyun['bucket'], $filename, 3600, 'GET');
				$task1  = [
			        'dataId' => uniqid('', true),
			        'url'    => $signedUrl,
			    ];
			}
			
			/*
			$options = array(
			OssClient::OSS_PROCESS => "image/resize,m_lfit,h_100,w_100",
			);
			*/
	        try {
			    
			    AlibabaCloud::accessKeyClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'])->regionId('cn-shanghai')->asDefaultClient();
			    
			    switch($type)
			    {
				    case 'image':
				    	$result = AlibabaCloud::green()
			                          ->v20180509()
			                          ->imageSyncScan()
			                          ->jsonBody([
			                                         'tasks'  => [$task1],
			                                         'scenes' => ['porn', 'terrorism','sface'],
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
			                                         'scenes' => ['porn', 'terrorism','live','logo','ad','sface'],
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
				    default:
			             $tmp_ret = [];
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
     
     private function attachment_ai_sface_sync($data = array(),$aid = 46)
     {
//file_put_contents(CACHE_PATH . 'ggg1',var_export($data,1));
/*
	     $data = file_get_contents(CACHE_PATH . 'gggs');
	     $data = json_decode($data,1);
*/
	     $tmp_data = [];
	     if(!empty($data))
	     {
		     if(isset($data['data'][0]['results']) && !empty($data['data'][0]['results']))
		     {
			     $tmp_results = $data['data'][0]['results'];
			     
			     foreach($tmp_results as $key => $value)
			     {
				     if(($value['label'] === 'sface' || $value['label'] === 'terrorism') && isset($value['frames']))
				     {
					     foreach($value['frames'] as $k => $v)
					     {
						     if(isset($v['sfaceData']) && $v['sfaceData'] && $v['rate'] > 0)
						     {
							     foreach($v['sfaceData'] as $ks => $vs)
							     {
							     	if(isset($vs['faces']) && $vs['faces'])
							     	{
								     	$tmp_data[$value['label']][$vs['faces'][0]['id']][$vs['faces'][0]['rate']] = array(
									     	'name'		=> $vs['faces'][0]['name'],
									     	'rate'		=> $vs['faces'][0]['rate'],
									     	'url'		=> $v['url'],
									     	'scene'		=> $value['scene'],
									     	'label'		=> $value['label'],
									     	'face_id'	=> $vs['faces'][0]['id'],
								     	);
							     	}								     
							     }
						     }
					     }
				     }
			     }
		     }
	     }
	     else
	     {
		     return true;
	     }
	     /**
	     rate 定义阈值，超出阈值的，ai_sface标记，同时不会对图片进行本地化操作；
	     */
	     $default_rate = 80.00;
	     
	     if($tmp_data)
	     {
		     $tmp_results 	= array();
		     $sql_params		= array();
		     foreach($tmp_data as $key => $value)
		     {
		     	foreach($value as $k => $v)
		     	{
			     	$tmp_results[] = $tmp = max($value[$k]);
			     	
			     	foreach($v as $kk => $vv)
			     	{
			     		$tmp_sql_data = array();
			     		$tmp_sql_data['main'] = 0;
			     		if($tmp['rate'] === $vv['rate'])
			     		{
				     		$tmp_sql_data['main'] = 1;
			     		}
			     		$tmp_sql_data['rate']		= $vv['rate'];
			     		$tmp_sql_data['is_used']	= 0;
			     		if($vv['rate'] >= $default_rate)
			     		{
				     		$tmp_sql_data['is_used']= 1;
			     		}
			     		$tmp_sql_data['aid'] 		= $aid;
			     		$tmp_sql_data['skey'] 		= md5($vv['url']);
			     		$tmp_sql_data['surl'] 		= $vv['url'];
			     		$tmp_sql_data['scene'] 		= $vv['scene'];
			     		$tmp_sql_data['label'] 		= $vv['label'];
			     		$tmp_sql_data['ext'] 		= addslashes(json_encode($vv));
			     		$tmp_sql_data['createtime'] = time();
			     		$tmp_sql_data['updatetime'] = time();
			     		$sql_params[] = $tmp_sql_data;
			     	}
		     	}
		     }
		     //print_r($sql_params);exit;
		     if($sql_params)
		     {
				    $db_prefix = Config('database.prefix');
		    		$sql = "replace into `" . $db_prefix . "attachment_ai_sface`(aid,skey,surl,scene,label,ext,rate,is_used,main,createtime,updatetime) values";
		    		$space = $sql_suffix = '';
		    		//$tmp = $sql =Db::query($sql);
		    		$aids = [];
			    	foreach($sql_params as $k => $v)
			    	{
				    	$sql_suffix .= $space . "(" .  $v['aid'] . ",'" . $v['skey'] . "','" . $v['surl'] . "','" . $v['scene'] . "','" . $v['label'] . "','" . $v['ext'] . "','" . $v['rate'] . "','" . $v['is_used'] . "','" . $v['main'] . "'," . $v['createtime'] . "," . $v['updatetime'] . ")";
				    	$space = ',';
				    	$aids[] = $v['aid'];
			    	}
			    	Db::query($sql . $sql_suffix);
		     }
	     }
     }
     
     private function attachment_ai_sface_local()
     {
		$attachmentAiSfaceList = AttachmentAiSface::where("url=''")->select();
		/*
		图片本地化的规则为is_used=1 并且url=''
		*/
		$list = array();
		if($attachmentAiSfaceList)
		{
			foreach($attachmentAiSfaceList as $key => $value)
			{
				$list[] = array(
					'aid' 	=> $value->aid,
					'skey' 	=> $value->skey,
					'scene' => $value->scene,
					'surl' => $value->surl,
				);
			} 
		}
		if($list)
		{
			foreach($list as $key => $value)
			{
				//$surl = 'https://aligreen-shanghai.oss-cn-shanghai.aliyuncs.com/prod/hammal/20565a39/13553814_2472f175792c45fcecec53f3fa45f7d8.mp4-frames/f00029.jpg?Expires=1595260763&OSSAccessKeyId=H4sp5QfNbuDghquU&Signature=Z72zM6r8ehml09VFJx4HT6vDOQw%3D';
				$surl = $value['surl'];
				$tmp_filecontent = file_get_contents($surl);
				$tmp_fileinfo = pathinfo($surl);
				$extparam = array(
					'name'	=> Random::alnum(4) . $tmp_fileinfo['filename'] . '.jpg',
				);
				$filePath = CACHE_PATH . $extparam['name'];
				@file_put_contents($filePath,$tmp_filecontent);
		
		        $upload = Config::get('upload');
		        $suffix = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
		
		        $replaceArr = [
		            '{year}'     => date("Y"),
		            '{mon}'      => date("m"),
		            '{day}'      => date("d"),
		            '{suffix}'   => $suffix,
		            '{.suffix}'  => $suffix ? '.' . $suffix : '',
		            '{filemd5}'  => md5_file($filePath),
		        ];
		        @unlink($filePath);
		        $savekey = $upload['savekey'];
		  
		        $savekey = str_replace(array_keys($replaceArr), array_values($replaceArr), $savekey);
		     
		        $uploadDir = substr($savekey, 0, strripos($savekey, '/') + 1);
		        $fileName = substr($savekey, strripos($savekey, '/') + 1);
		        //error_reporting(0);
				$file_path = ROOT_PATH . 'public' . $uploadDir . $fileName;
				if(!file_exists($file_path))
				{
					
					@file_put_contents(ROOT_PATH . 'public' . $uploadDir . $fileName,$tmp_filecontent);
				}
				
				$img_info 	= getimagesize($file_path);
				$img_size 	= filesize($file_path);
		        $sha1		= hash_file('sha1',$file_path);
		
		        $params = array(
		            'admin_id'    => 1,
		            'user_id'     => 0,
		            'filesize'    => $img_size,
		            'imagewidth'  => $img_info[0],
		            'imageheight' => $img_info[1],
		            'imagetype'   => $suffix,
		            'imageframes' => 0,
		            'mimetype'    => $img_info['mime'],
		            'url'         => $uploadDir . $fileName,
		            'uploadtime'  => time(),
		            'airesult'	  => json_encode(array()),
		            'storage'     => 'local',
		            'sha1'        => $sha1,
		            'extparam'    => json_encode($extparam),
		            'need_ai'	  => 0,
		        );
		       Attachment::create($params);

		       AttachmentAiSface::where("aid=" . $value['aid'] . " and skey='" . $value['skey'] . "' and scene='" . $value['scene'] . "'") ->update(['url' => $params['url']]);
			}
			echo "5-视频敏感人物图本地化\n";
		}
     }
}


