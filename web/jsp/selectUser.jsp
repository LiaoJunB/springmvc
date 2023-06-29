<%--
  Created by IntelliJ IDEA.
  User: LJB
  Date: 2023/4/19
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="../layui/css/layui.css" rel="stylesheet">
    <script src="../layui/layui.js"></script>

</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="cityTpl">
    <select id="demoCity1" class="layui-border" lay-ignore>
        <option value="浙江杭州">浙江杭州</option>
        <option value="江西南昌">江西南昌</option>
        <option value="湖北武汉">湖北武汉</option>
    </select>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>



<script>
    layui.use(['table', 'dropdown'], function(){
        var table = layui.table;
        var dropdown = layui.dropdown;

        // 创建渲染实例
        table.render({
            elem: '#test'
            ,url:'../data.json' // 此处为静态模拟数据，实际使用时需换成真实接口
            ,toolbar: '#toolbarDemo'
            ,defaultToolbar: ['filter', 'exports', 'print', {
                title: '帮助'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,height: 'full-200' // 最大高度减去其他容器已占有的高度差
            ,cellMinWidth: 80
            ,totalRow: true // 开启合计行
            ,page: true
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', fixed: 'left', width:80, title: 'ID', sort: true, totalRowText: '合计：'}
                ,{field:'username', width:80, title: '用户'}
                ,{field:'email', title:'邮箱 <i class="layui-icon layui-icon-email"></i>', hide: 0, width:150, edit: 'text'}
                ,{field:'sex', width:80, title: '性别', sort: true}
                ,{field:'city', width:115, title: '城市', minWidth:115, templet: '#cityTpl', exportTemplet: function(d, obj){
                        //console.log(obj)
                        // 处理该字段的导出数据
                        var td = obj.td(this.field); //获取当前 td
                        return td.find('select').val();
                    }}
                ,{field:'sign', title: '签名', edit: 'textarea', minWidth: 260, style: '-moz-box-align: start;'}
                ,{field:'experience', width: 100, title: '积分', sort: true, totalRow: '{{= d.TOTAL_NUMS }} 😊'}
                ,{field:'checkin', title:'打卡', width: 100, sort: true, totalRow: '{{= parseInt(d.TOTAL_NUMS) }} 次'}
                ,{field:'ip', title:'IP', width: 120}
                ,{field:'joinTime', title:'加入时间', width: 120}
                ,{fixed: 'right', title:'操作', width: 125, minWidth: 125, toolbar: '#barDemo'}
            ]]
            ,done: function(){
                var id = this.id;

            }
            ,error: function(res, msg){
                console.log(res, msg)
            }
        });


        //触发单元格工具事件
        table.on('tool(test)', function(obj){ // 双击 toolDouble
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    title: '编辑',
                    type: 1,
                    area: ['80%','80%'],
                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                });
            }
        });

        //触发表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        //触发表格单选框选择
        table.on('radio(test)', function(obj){
            console.log(obj)
        });

        // 行单击事件
        table.on('row(test)', function(obj){
            //console.log(obj);
            //layer.closeAll('tips');
        });
        // 行双击事件
        table.on('rowDouble(test)', function(obj){
            console.log(obj);
        });

        // 单元格编辑事件
        table.on('edit(test)', function(obj){
            var field = obj.field //得到字段
                ,value = obj.value //得到修改后的值
                ,data = obj.data; //得到所在行所有键值

            var update = {};
            update[field] = value;
            obj.update(update);
        });
    });
</script>


</html>
