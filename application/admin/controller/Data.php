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
                    	->field('id,airesult,extparam,mimetype')
                    	->select();
                	$params['file_id'] = $attachmentList[0]->id;
                //	$params['data_status'] = 1;//上传成功
                    $result = $row->allowField(true)->save($params);
                    
                    if(empty($attachmentList[0]->airesult))
                    {
	                    $tmp_type = explode('/',$attachmentList[0]->mimetype);
	                    $tmp_ret = $this->aliyun_green_create($params['file'],$tmp_type[0]);
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
	                    $this->model->where('id', $ids)->update($update_status);
	                    
	                   // file_put_contents(CACHE_PATH . 'ggg3',var_export($tmp_ret,1));
	                   
	                   	if(in_array($tmp_type[0],['image','text']))//同步会直接有结果
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => json_encode($tmp_ret),'is_aisuccess'=>1]);
						}
						else
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => json_encode($tmp_ret)]);
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
                    $params['data_status'] = 1;//上传成功
                    $result = $this->model->allowField(true)->save($params);
                    //file_put_contents(CACHE_PATH . 'ggg5',var_export($this->model->id,1));
          
                    $attachmentList = Attachment::where('url', $params['file'])
                    	->field('id,airesult,extparam,mimetype')
                    	->select();
                    	
                    	
                    if(empty($attachmentList[0]->airesult))
                    {
                    	$tmp_type = explode('/',$attachmentList[0]->mimetype);
	                    $tmp_ret = $this->aliyun_green_create($params['file'],$tmp_type[0]);
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
	                  //  file_put_contents(CACHE_PATH . 'ggg3',var_export($tmp_ret,1));

	                    if(in_array($tmp_type[0],['image','text']))//同步会直接有结果
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => json_encode($tmp_ret),'is_aisuccess'=>1]);
						}
						else
						{
							Attachment::update(['id' => $attachmentList[0]->id, 'airesult' => json_encode($tmp_ret)]);
						}
                    }
					
                    
                     $this->error(__('Parameter %s can not be empty', ''));
                    
                    
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
           
                
            }
            
        }
        return $this->view->fetch();
     }
     
     private function aliyun_green_create($file,$type = 'image')
     {
     		$tmp = explode('/' , $file);
	     	$filename = $tmp[count($tmp)-1];
			//$filePath = "/Users/repheal/Downloads/timg-1.jpeg";
			$filePath = ROOT_PATH . 'public' . $file;
/*
			file_put_contents(CACHE_PATH . 'ggg',var_export($filePath,1));
			file_put_contents(CACHE_PATH . 'ggg1',var_export($filename,1));
*/
			$config_aliyun = config('aliyun');
			$ossClient = new OssClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'], $config_aliyun['endpoint']);
			$ret = $ossClient->uploadFile($config_aliyun['bucket'], $filename, $filePath);
			/*
			$options = array(
			OssClient::OSS_PROCESS => "image/resize,m_lfit,h_100,w_100",
			);
			*/
			$signedUrl = $ossClient->signUrl($config_aliyun['bucket'], $filename, 3600, 'GET');
			/* file_put_contents(CACHE_PATH . 'sss1',$signedUrl); */

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
			    
			    //file_put_contents(CACHE_PATH . 'ggg2',var_export($tmp_ret,1));
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
        file_put_contents(CACHE_PATH . 'ggg1',var_export($tmp_result,1));
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
        }    
    
        $this->view->assign("row", $tmp_result);
        /*

        if (!$row)
            $this->error(__('No Results were found'));
        
        */
        return $this->view->fetch();

    }
    

}
