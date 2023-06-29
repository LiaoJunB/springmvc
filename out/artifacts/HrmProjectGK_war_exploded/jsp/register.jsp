<%--
  Created by IntelliJ IDEA.
  User: LJB
  Date: 2023/4/16
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>

    <link href="../layui/css/layui.css" rel="stylesheet">

    <script src="../layui/layui.js"></script>
    <script src="../logincss/js/jquery-1.8.2.min.js"></script>



</head>
<body>
<div class="box">
    <h1 style="text-align: center;font-weight: bold;color: #1e9fff;padding-top: 40px">注册页面</h1>
    <form class="layui-form layui-form-pane" action="" style="margin-left: 20px;margin-top: 30px">

        <div class="layui-form-item" style="margin-left: 50px">
            <label class="layui-form-label"><i class="layui-icon layui-icon-username"
                                               style="font-size: 30px; color: #1e9fff;"></i> </label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号|手机号" autocomplete="off"
                       class="layui-input" style="background-color: #eeeeee;width: 250px">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 20px;margin-left: 50px">
            <label class="layui-form-label"><i class="layui-icon layui-icon-password"
                                               style="font-size: 30px; color: #1e9fff;"></i></label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input" style="background-color: #eeeeee;width: 250px">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 20px;margin-left: 50px">
            <label class="layui-form-label"><i class="layui-icon layui-icon-key"
                                               style="font-size: 30px; color: #1e9fff;"></i></label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="确认密码" autocomplete="off"
                       class="layui-input" style="background-color: #eeeeee;width: 250px">
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 20px;margin-left: 50px">
            <label class="layui-form-label" style="height: 39px"><i class="layui-icon layui-icon-vercode"
                                                                    style="font-size: 30px; color: #1e9fff;"></i></label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="验证码" autocomplete="off"
                       class="layui-input" style="width: 120px;height: 39px;">
                <a href="javascript:;"><img id="checkcode2" src="http://localhost:8080/HrmProjectGK/CheckCodeUtil"
                                style="width: 125px;height: 38.5px;position: relative;bottom: 39px;left: 125px"></a>
            </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn layui-btn layui-btn-normal" lay-submit=""
                    style="margin-left: 200px;margin-top: -20px">注册
            </button>
        </div>

    </form>


</div>
</body>

<script>

    $("#checkcode2").click(function () {

        //修改src属性
        $("#checkcode2").attr("src", "http://localhost:8080/HrmProjectGK/CheckCodeUtil?" + new Date().getTime())
    });



</script>
</html>
