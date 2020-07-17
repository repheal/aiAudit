<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Data extends Model
{

    use SoftDelete;

    

    // 表名
    protected $name = 'data';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';
    protected $selectpageFields = '*';

    // 追加属性
    protected $append = [
        'type_text',
        'source_text',
        'data_status_text',
        'ai_status_text',
        'ar_status_text'
    ];
    

    
    public function getTypeList()
    {
        return ['pic' => __('Type pic'), 'video' => __('Type video'), 'audio' => __('Type audio'), 'txt' => __('Type txt')];
    }

    public function getSourceList()
    {
        return ['ar' => __('Source ar'), 'ai' => __('Source ai')];
    }

    public function getDataStatusList()
    {
        return ['0' => __('Data_status 0'), '1' => __('Data_status 1'), '2' => __('Data_status 2'), '3' => __('Data_status 3'), '4' => __('Data_status 4'), '5' => __('Data_status 5')];
    }

    public function getAiStatusList()
    {
        return ['0' => __('Ai_status 0'), '1' => __('Ai_status 1'), '2' => __('Ai_status 2'), '3' => __('Ai_status 3'), '4' => __('Ai_status 4')];
    }

    public function getArStatusList()
    {
        return ['1' => __('Ar_status 1'), '2' => __('Ar_status 2')];
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type']) ? $data['type'] : '');
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getSourceTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['source']) ? $data['source'] : '');
        $list = $this->getSourceList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getDataStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['data_status']) ? $data['data_status'] : '');
        $list = $this->getDataStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getAiStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['ai_status']) ? $data['ai_status'] : '');
        $list = $this->getAiStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getArStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['ar_status']) ? $data['ar_status'] : '');
        $list = $this->getArStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
