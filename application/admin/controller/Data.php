<?php

namespace app\admin\controller;

use app\common\controller\Backend;


use app\common\model\Attachment;
use OSS\OssClient;
//use OSS\Core\OssException;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
/**
 * 数据管理
 *
 * @icon fa fa-circle-o
 */
class Data extends Backend
{
    
    /**
     * Data模型对象
     * @var \app\admin\model\Data
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Data;
        $this->view->assign("typeList", $this->model->getTypeList());
        $this->view->assign("sourceList", $this->model->getSourceList());
        $this->view->assign("dataStatusList", $this->model->getDataStatusList());
        $this->view->assign("aiStatusList", $this->model->getAiStatusList());
        $this->view->assign("arStatusList", $this->model->getArStatusList());
    }

    public function import()
    {
        parent::import();
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
     
     public function edit($ids = null)
     {
     	 $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $row->validateFailException(true)->validate($validate);
                    }
                    
                    $attachmentList = Attachment::where('url', $params['file'])
                    	->field('id,airesult,extparam,mimetype,is_aisuccess')
                    	->select();
                	$params['file_id'] = $attachmentList[0]->id;
                //	$params['data_status'] = 1;//上传成功
                    $result = $row->allowField(true)->save($params);
                    
                    if(empty($attachmentList[0]->airesult) || empty($attachmentList[0]->is_aisuccess))//说明当前的file里面没有ai结果
                    {
	                    $tmp_type = explode('/',$attachmentList[0]->mimetype);
	                    $tmp_ret = $this->aliyun_green_create($params['file'],$tmp_type[0]);
	                    $update_status = [];
	                    if($tmp_ret['code'] == 200)
	                    {
		                    if(!isset($tmp_ret['data'][0]['results']) && empty($attachmentList[0]->is_aisuccess))//不存在，基本是异步
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
	                    $this->model->where('id', $ids)->update($update_status);
	                    
	                   // file_put_contents(CACHE_PATH . 'ggg3',var_export($tmp_ret,1));
	                   
	                   	if(in_array($tmp_type[0],['image','text']) && $update_status['ai_status'] !=4)//同步会直接有结果
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : '','is_aisuccess'=>1]);
						}
						else
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : '']);
						}
                    }
                    else//有ai结果
                    {
                    	$update_status = array(
                    		'data_status' 		=> 5,
                    		'ai_status' 		=> 0,
                    		'ai_result' 		=> '',
                    		'ai_result_detail' 	=> '',
                    	);
	                    $this->model->where('id', $ids)->update($update_status);
                    }
                    
                    
                } catch (ValidateException $e) {
                    
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    
                    $this->error($e->getMessage());
                }
                
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
	     
     }
     
     public function add()
     {
	      if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            
            
            if ($params) {
                $params = $this->preExcludeFields($params);

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }
                    $attachmentList = Attachment::where('url', $params['file'])
                    	->field('id,airesult,extparam,mimetype,is_aisuccess')
                    	->select();
                    	
                    $params['file_id'] = $attachmentList[0]->id;
                    $params['data_status'] = 1;//上传成功
                    $result = $this->model->allowField(true)->save($params);
                    
                    if(empty($attachmentList[0]->airesult) || empty($attachmentList[0]->is_aisuccess))
                    {
                    	$tmp_type = explode('/',$attachmentList[0]->mimetype);
	                    $tmp_ret = $this->aliyun_green_create($params['file'],$tmp_type[0]);
	                 //   $this->error(__('Parameter %s can not be empty', ''));
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
	                    $this->model->where('id', $this->model->id)->update($update_status);
	                    if(in_array($tmp_type[0],['image','text']) && $update_status['ai_status'] !=4)//同步会直接有结果
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : '','is_aisuccess'=>1]);
						}
						else
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => $tmp_ret ? json_encode($tmp_ret) : '']);
						}
                    } 
                } catch (ValidateException $e) {
                    
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    
                    $this->error($e->getMessage());
                }
                
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
                $this->error(__('Parameter %s can not be empty', ''));
            }
            
        }
        return $this->view->fetch();
     }
     
     private function aliyun_green_create($file,$type = 'image')
     {
     		$tmp 		= explode('/' , $file);
	     	$filename 	= $tmp[count($tmp)-1];
			$filePath 	= ROOT_PATH . 'public' . $file;
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
//			file_put_contents(CACHE_PATH . 'sss1',$signedUrl);
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
     
     /**
     * 详情
     */
    public function aiResultDetail($ids)
    {
        $row = $this->model->get(['id' => $ids]);
        if(empty($row->ai_result_detail))
        {
	         $this->error(__('No Results were found'));
        }
        $tmp_result = json_decode($row->ai_result_detail,1);
        //file_put_contents(CACHE_PATH . 'ggg1',var_export($tmp_result,1));
        $sface_id = 0;
        foreach($tmp_result as $k => $v)
        {
        	if($v['suggestion'] == 'pass')
        	{
	        	$tmp_result[$k]['style'] = ' style="background-color: rgb(25, 187, 107);color: rgb(255, 255, 255);padding: 1px;" ';
        	}
        	if($v['suggestion'] == 'review')
        	{
	        	$tmp_result[$k]['style'] = ' style="background-color: rgb(255, 167, 37);color: rgb(255, 255, 255);padding: 1px;" ';
        	}
        	if($v['suggestion'] == 'block')
        	{
	        	$tmp_result[$k]['style'] = ' style="background-color: rgb(241, 85, 51);color: rgb(255, 255, 255);padding: 1px;" ';
        	}
        	$tmp_result[$k]['extra'] = '无';
        	if($v['label']	== 'sface')
        	{
	        	$sface_id = $row['file_id'];
        	}
        }
        if($sface_id)//针对图片，视频的再考虑
        { 
       		$attachmentList = Attachment::where('id', $sface_id)
                    	->field('id,airesult,extparam,mimetype,is_aisuccess')
                    	->select();

	        if($attachmentList && $attachmentList[0]->airesult)
	        {
	        	$tmp_airesult = json_decode($attachmentList[0]->airesult,1);
	        	$tmp_airesult = $tmp_airesult['data'][0]['results'];
	        	foreach($tmp_airesult as $k => $v)
	        	{
		        	if($v['label'] == 'sface')
		        	{
		        		if(isset($v['sfaceData']) && !empty($v['sfaceData']) && isset($v['sfaceData'][0]['faces']))//此处针对图片
		        		{
		        			$tmp_result[$k]['extra'] = $space = '';
			        		foreach($v['sfaceData'][0]['faces'] as $kk => $vv)
			        		{
				        		$tmp_result[$k]['extra'] .= $space . $vv['name'] . '-' . __('Similarity', '') . '：'  . $vv['rate'] . '%';
				        		$space = "\\r";
			        		}
		        		}
		        		// !isset($v['frames']) 多个视频face
		        	}
	        	}
		        //file_put_contents(CACHE_PATH . 'ggg1',var_export($tmp_result,1));
	        }
        }
        $this->view->assign("row", $tmp_result);
        return $this->view->fetch();

    }
    

}
