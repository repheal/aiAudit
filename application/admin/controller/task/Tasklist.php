<?php

namespace app\admin\controller\task;

use app\common\controller\Backend;

/**
 * 数据管理
 *
 * @icon fa fa-circle-o
 */
class Tasklist extends Backend
{
    
    /**
     * Tasklist模型对象
     * @var \app\admin\model\task\Tasklist
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\task\Tasklist;
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
     
     
     public function index()
     {
	     //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
          
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
        //      file_put_contents(CACHE_PATH . 'sss1',var_export($where,1));
            $total = $this->model
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();
            $file_array = [];
            $space = '';
            foreach($list as $k => $v)
            {
	            $file_array[] = $v['file'];
	            
            }
            
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
     }
    

}
