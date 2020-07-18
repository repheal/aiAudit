<?php
namespace app\admin\behavior;

use think\db;
//use app\common\model\Attachment;
use OSS\OssClient;
//use OSS\Core\OssException;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;

class AliCloud
{
    public function run(&$params)
    {
    	return true;//测试上传阿里云
	    $ret = json_decode($params,1);

		$db_prefix = Config('database.prefix');
		$sql = "select * from `" . $db_prefix . "attachment` where id IN(1,2,3,4)";
		$tmp = $sql =Db::query($sql);



		file_put_contents(CACHE_PATH . 'ggg',var_export($ret,1));
		file_put_contents(CACHE_PATH . 'ggg2',var_export($tmp,1));
	    if(empty($ret))
	    {
		    return true;
	    }
    	$extparam = json_decode($ret['extparam'],1);
		//$filePath = "/Users/repheal/Downloads/timg-1.jpeg";
		$filePath = ROOT_PATH . 'public' . $ret['url'];
		//file_put_contents(CACHE_PATH . 'ggg',var_export(config('aliyun'),1));
		$config_aliyun = config('aliyun');
		$ossClient = new OssClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'], $config_aliyun['endpoint']);
		$ret = $ossClient->uploadFile($config_aliyun['bucket'], $extparam['name'], $filePath);
		/*
		$options = array(
	    	OssClient::OSS_PROCESS => "image/resize,m_lfit,h_100,w_100",
	    );
		*/
		$signedUrl = $ossClient->signUrl($config_aliyun['bucket'], $extparam['name'], 3600, 'GET');
		file_put_contents(CACHE_PATH . 'sss1',$signedUrl);
		
		try {
		    $task1  = [
		        'dataId' => uniqid('', true),
		        'url'    => $signedUrl,
		    ];
		    AlibabaCloud::accessKeyClient($config_aliyun['accessKeyId'], $config_aliyun['accessKeySecret'])->regionId('cn-shanghai')->asDefaultClient();
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
		    file_put_contents(CACHE_PATH . 'ggg1',var_export($tmp_ret,1));
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
