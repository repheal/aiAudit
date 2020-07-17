define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'task/tasklist/index' + location.search,
                    add_url: 'task/tasklist/add',
                    edit_url: 'task/tasklist/edit',
                    del_url: 'task/tasklist/del',
                    multi_url: 'task/tasklist/multi',
                    import_url: 'task/tasklist/import',
                    table: 'data',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'index_pic', title: __('Index_pic')},
                        {field: 'type', title: __('Type'), searchList: {"pic":__('Type pic'),"video":__('Type video'),"audio":__('Type audio'),"txt":__('Type txt')}, formatter: Table.api.formatter.normal},
                        {field: 'file', title: __('File')},
                        {field: 'auditor_id', title: __('Auditor_id')},
                        {field: 'title', title: __('Title')},
                        {field: 'filesize', title: __('Filesize')},
                        {field: 'author', title: __('Author')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'source', title: __('Source'), searchList: {"ar":__('Source ar'),"ai":__('Source ai')}, formatter: Table.api.formatter.normal},
                        {field: 'data_status', title: __('Data_status'), searchList: {"0":__('Data_status 0'),"1":__('Data_status 1'),"2":__('Data_status 2'),"3":__('Data_status 3'),"4":__('Data_status 4'),"5":__('Data_status 5')}, formatter: Table.api.formatter.status},
                        {field: 'ai_status', title: __('Ai_status'), searchList: {"0":__('Ai_status 0'),"1":__('Ai_status 1'),"2":__('Ai_status 2'),"3":__('Ai_status 3'),"4":__('Ai_status 4')}, formatter: Table.api.formatter.status},
                        {field: 'ar_status', title: __('Ar_status'), searchList: {"1":__('Ar_status 1'),"2":__('Ar_status 2')}, formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'task/tasklist/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'title', title: __('Title'), align: 'left'},
                        {
                            field: 'deletetime',
                            title: __('Deletetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            width: '130px',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'Restore',
                                    text: __('Restore'),
                                    classname: 'btn btn-xs btn-info btn-ajax btn-restoreit',
                                    icon: 'fa fa-rotate-left',
                                    url: 'task/tasklist/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'task/tasklist/destroy',
                                    refresh: true
                                }
                            ],
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});