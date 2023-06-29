<%--
  Created by IntelliJ IDEA.
  User: LJB
  Date: 2023/4/16
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/logincss/css/supersized.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/logincss/js/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/logincss/js/supersized.3.2.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/logincss/js/supersized-init.js"></script>

    <style>
        .box{
            width: 400px;
            height: 400px;
            margin: 0px auto;
            top: 150px;
            left: 550px;
            background: rgba(255,255,255,0.8);
            border-radius: 15px;
            position: absolute;
        }
        p{
            margin-bottom: 50px;
        }
    </style>

</head>
<body>
<div class="box">
    <h1 style="text-align: center;font-weight: bold;color: #1e9fff;padding-top: 40px">广科HR人事系统</h1>
    <form class="layui-form layui-form-pane" action=""style="margin-left: 20px;margin-top: 30px">

        <div class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1e9fff;"></i> </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username"  lay-verify="required" placeholder="请输入账号|手机号" autocomplete="off" class="layui-input" style="background-color: lavender;width: 250px">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 20px">
            <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1e9fff;"></i></label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="background-color: lavender;width: 250px">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 20px">
            <label class="layui-form-label" style="height: 39px"><i class="layui-icon layui-icon-vercode" style="font-size: 30px; color: #1e9fff;"></i></label>
            <div class="layui-input-inline">
                <input type="text" id="checkcode1" name="checkcode1" lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input" style="width: 120px;height: 39px">
                <a href="javascript:;"><img id="checkcode" src="http://localhost:8080/HrmProjectGK/CheckCodeUtil" style="width: 125px;height: 38.5px;position: relative;bottom: 39px;left: 125px"></a>
            </div>
            <div id="suss"></div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn layui-btn layui-btn-normal" lay-submit="demo1" lay-filter="demo1" id="submit1" style="margin-left: 110px;margin-top: -20px">提交</button>
        </div>

    </form>

    <a href="javascript:;" id="register" data-method="setTop"><button class="layui-btn layui-btn layui-btn-normal" lay-submit="" style="position: relative; bottom: 53px;right: -210px">注册</button></a>

    <p style="color: #1e9fff;text-align: center;position: relative; bottom: 30px;right: -10px">未来的你一定会感谢现在努力的自己！！</p>

</div>

</body>


<script>

    //img点击事件
    $("#checkcode").click(function () {

      //修改src属性
        $("#checkcode").attr("src","http://localhost:8080/HrmProjectGK/CheckCodeUtil?"+ new Date().getTime())
    });

    // $("#submit1").click(function (){
    //     //修改src属性
    //     var json = {username:$("#username").val(),password:$("#password").val(),checkcode:$("#checkcode1").val()};
    //     $.ajax({
    //         type: 'post',
    //         url:'http://localhost:8080/HrmProjectGK/user/login.do',
    //         data:json,
    //         success(res){
    //             if (res==="1"){
    //
    //             }
    //         }
    //     })
    // })

    layui.use(['layer','form',], function(){ //独立版的layer无需执行这一句

        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        var form = layui.form;

        //提交事件
        form.on('submit(demo1)', function(data){
            //用ajax去和后台交互数据
            var json = {"username":$("#username").val(),"password":$("#password").val(),"checkcode1":$("#checkcode1").val()}

            $.post("http://localhost:8080/HrmProjectGK/UserController/login.do",json,function (data) {

                if(data==-3){
                    layer.msg('验证码出错', {icon: 5});
                }else if(data==2){
                    layer.msg('用户名或密码错误!',{icon:5});
                }else if(data==1){
                    window.location.href="jsp/index.jsp";
                }
            })

            return false;
        });


        //触发事件
        var active = {
            setTop: function(){
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2
                    ,title: '注册用户'
                    ,area: ['500px', '500px']
                    ,shade: 0.4
                    ,maxmin: false
                    ,offset:'auto'
                    ,content: 'register.jsp'
                    ,resize:false
                    ,zIndex: layer.zIndex //重点1
                });
            }
        };

        $('#register').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });


        //多窗口模式 - esc 键
        $(document).on('keyup', function(e){
            if(e.keyCode === 27){
                layer.close(layer.escIndex ? layer.escIndex[0] : 0);
            }
        });
    });
</script>
</html>
