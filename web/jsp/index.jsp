<%--
  Created by IntelliJ IDEA.
  User: LJB
  Date: 2023/4/14
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HR-主界面</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black"><span
                style="font-weight: bold;font-style: italic;font-size: larger">HR人事管理系统</span></div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="https://www.gkd.edu.cn" target="_blank"><img
                    src="../images/logo.png" style="width: 45px;height: 45px;padding-right: 10px">广州科技职业技术大学</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="javascript:;" id="sljj" data-method="setTop"><i
                    class="layui-icon layui-icon-home" style="font-size: 18px;color:#009688;padding-right: 5px"></i>学校简介</a>
            </li>
            <li class="layui-nav-item layui-hide-xs"><a href="https://news.gkd.edu.cn/channels/2390.html"
                                                        target="_blank"><i class="layui-icon layui-icon-notice"
                                                                           style="font-size: 18px;color:#009688;padding-right: 5px"></i>最新公告<span
                    class="layui-badge layui-bg-green">5</span></a></li>
            <li class="layui-nav-item layui-hide-xs"><a href=""><i class="layui-icon layui-icon-service"
                                                                   style="font-size: 18px;color:#009688;padding-right: 5px"></i>待审核<span
                    class="layui-badge layui-bg-green">3</span></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide-xs"><a href=""></a><i class="layui-icon layui-icon-time"
                                                                       style="font-size: 18px;color: #1e9fff;padding-left: 15px"></i>&nbsp;&nbsp;<span
                    id="timespan">2023年04月15日 11:35:10</span></li>
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="../images/tx.jpg" class="layui-nav-img">
                    <span style="font-size: 15px">${user.username}</span>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">工号:${user.loginname}</a></dd>
                    <dd><a href="">名字:${user.username}</a></dd>
                    <dd><a href="">手机:${user.phone}</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-hide-xs"><a href="javascript:;" id="logout" data-method="notice"><i class="layui-icon layui-icon-logout"
                                                                       style="font-size: 18px;color: #1e9fff;padding-left: 15px"></i>&nbsp;&nbsp;安全退出</a>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block"
                style="padding: 10px 0px 5px 0px;text-align:center;width: 100%">
                <a href="javascript:;">
                    <img src="../images/tx.jpg" class="layui-nav-img"
                         style="width: 130px;height: 130px;padding-bottom: 10px;padding-right: 20px">
                    <p style="color: #FFF;padding-right: 20px">欢迎${user.username}登录</p>
                </a>
            </li>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username"
                                                       style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"

                               data-url="useradd.jsp"
                               data-id="useradd"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;用户添加"
                               class="site-demo-active"
                               data-type="tabAdd"

                               style="margin-left: 10px"><i class="layui-icon layui-icon-add-1" style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;用户添加</a>
                        </dd>
                        <dd><a href="javascript:;"

                               data-url="selectUser.jsp"
                               data-id="selectUser"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;用户查询"
                               class="site-demo-active"
                               data-type="tabAdd"


                               style="margin-left: 10px"><i class="layui-icon layui-icon-search"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;用户查询</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-cols"
                                              style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"style="margin-left: 10px"><i class="layui-icon layui-icon-add-1"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;部门添加</a>
                        </dd>
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-search"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;部门查询</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-tabs"
                                              style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;职位管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-add-1"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;职位添加</a>
                        </dd>
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-search"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;职位查询</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-user"
                                              style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-add-1"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;员工添加</a>
                        </dd>
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-search"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;员工查询</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-read"
                                              style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-search"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;公告查询</a>
                        </dd>
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-email"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;公告管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-upload-drag"
                                              style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;下载中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="margin-left: 10px"><i class="layui-icon layui-icon-upload"
                                                                                style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;文件上传</a>
                        </dd>
                        <dd><a href="javascript:;" style="margin-left: 10px"><i
                                class="layui-icon layui-icon-download-circle" style="font-size: 18px; color: #FFF;"></i>&nbsp;&nbsp;文件下载</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this"><i class="layui-icon layui-icon-website"
                                              style="font-size: 18px; color:#009688;"></i>&nbsp;&nbsp;主页
                    </li>

                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-bg-gray" style="padding: 10px;">
                            <div class="layui-row layui-col-space15">
                                <div class="layui-col-md8">
                                    <div class="layui-panel">
                                        <div style="padding:10px 30px;">
                                            <iframe src="./indexlunbo.html" width="100%" height="500px"></iframe>
                                        </div>
                                        <div class="layui-col-md4">
                                            <div class="layui-panel">
                                                <div style="padding:10px 20px;">
                                                    <a href=""><img src="../images/xm1.jpg"
                                                                    style="width: 100%;height: 100px"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-md4">
                                            <div class="layui-panel">
                                                <div style="padding:10px 20px;">
                                                    <a href=""><img src="../images/xm2.jpg"
                                                                    style="width: 100%;height: 100px"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-md4">
                                            <div class="layui-panel">
                                                <div style="padding:10px 20px;">
                                                    <a href=""><img src="../images/xm3.png"
                                                                    style="width: 100%;height: 100px"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <div class="layui-panel">
                                        <div style="padding:10px;">一个面板</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                    <div class="layui-tab-item">--%>
<%--                        <iframe width="100%" height="700px"></iframe>--%>
<%--                    </div>--%>
<%--                    <div class="layui-tab-item">内容3</div>--%>
<%--                    <div class="layui-tab-item">内容4</div>--%>
<%--                    <div class="layui-tab-item">内容5</div>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        &copy;广州科技职业技术大学 计算机应用实训
    </div>
</div>

<script>

    //设计一个函数返回时间的指定格式
    function getTime() {
        let time = new Date();
        let timeString = "";
        let year = time.getFullYear();
        let month = (time.getMonth() + 1 < 10) ? '0' + (time.getMonth() + 1) : time.getMonth() + 1;
        var date = time.getDate() < 10 ? '0' + time.getDate() : time.getDate();
        var hour = time.getHours() < 10 ? '0' + time.getHours() : time.getHours();
        var minutes = time.getMinutes() < 10 ? '0' + time.getMinutes() : time.getMinutes();
        var seconds = time.getSeconds() < 10 ? '0' + time.getSeconds() : time.getSeconds();
        timeString = year + "年" + month + "月" + date + "日 " + hour + ":" + minutes + ":" + seconds;
        return timeString;
    }

    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //创建定时器
        setInterval(function () {
            var time = getTime();
            $("#timespan").text(time);
        })


        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 2
                    , title: '<img src="../images/GK-bg4.png" style="width: 150px;height: 40px;margin-top: 5px" alt="">'
                    , content: 'schoolpage.html'
                    , area: ['400px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

        //触发事件
        var active = {

                //在这里给active绑定几项事件，后面可通过active调用这些事件
                tabAdd: function (url, id, title) {
                    //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                    //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                    element.tabAdd('demo', {
                        title: title,
                        content: '<iframe data-frameid="' + id
                            + '" scrolling="auto" frameborder="0" src="'
                            + url + '" style="width:100%;height: 730px"></iframe>',
                        id: id
                        //规定好的id
                    })
                    element.render('tab');

                },
                tabChange: function (id) {
                    //切换到指定Tab项
                    element.tabChange('demo', id); //根据传入的id传入到指定的tab项
                },
                tabDelete: function (id) {
                    element.tabDelete("demo", id);//删除
                },
                tabDeleteAll: function (ids) {//删除所有
                    $.each(ids, function (i, item) {
                        element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                    })
                },
                offset: function (othis) {
                    var type = othis.data('type')
                        , text = othis.text();

                    layer.open({
                        type: 1,
                        title: '修改个人头像'
                        ,
                        offset: type //具体配置参考：/docs/modules/layer.html#offset
                        ,
                        id: 'layerDemo' + type //防止重复弹出
                        ,
                        content: '<div style="padding: 20px 20px;width: 400px;height: 260px"><iframe src="updateTouX.jsp" width="360px" height="260px" ></iframe></div>'
                        ,
                        btn: '确定'
                        ,
                        btnAlign: 'c' //按钮居中
                        ,
                        shade: 0 //不显示遮罩
                        ,
                        yes: function () {
                            //刷新当前页面
                            location.reload()
                            layer.closeAll();
                        }
                    });
                },



            setTop: function () {
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2 //此处以iframe举例
                    , title: '<img src="../images/GK-bg4.png" style="width: 150px;height: 45px" alt="">\n'
                    , area: ['750px', '650px']
                    , maxmin: false
                    , content: 'schoolpage.html'
                    , resize: false
                    , shade: 0.4


                    , yes: function () {
                        $(that).click();
                    }
                    , btn2: function () {
                        layer.closeAll();
                    }

                    , zIndex: layer.zIndex //重点1


                });
            },

            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '300px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确定', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight:300;font-size:20px;text-align: center">您确定要退出登录吗?</div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: "http://localhost:8080/HrmProjectGK/UserController/logout.do"
                        });
                    }
                });
            }
        };

        $('#logout').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        $('#sljj').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });


        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });


        //多窗口模式 - esc 键
        $(document).on('keyup', function (e) {
            if (e.keyCode === 27) {
                layer.close(layer.escIndex ? layer.escIndex[0] : 0);
            }
        });

    });
</script>
</body>
</html>
