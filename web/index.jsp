<%--
  Created by IntelliJ IDEA.
  User: LS
  Date: 2018/5/21
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>首页_个人博客</title>
    <meta name="keywords" content="个人博客"/>
    <meta name="description" content="个人博客，"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>static/css/base.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/index.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/m.css" rel="stylesheet">
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <script src="<%=basePath%>static/js/modernizr.js"></script>

    <!--[if lt IE 9]>
    <![endif]-->

</head>

<body>
<jsp:include page="./pages/front/nav.jsp"></jsp:include>

<div class="picshow">
    <ul>
        <li>
            <a href="/"><i><img src="<%=basePath%>/static/image/b01.jpg"></i>
                <div class="font">
                    <h3>个人博客模板《早安》</h3>
                </div>
            </a>
        </li>
        <li>
            <a href="/"><i><img src="<%=basePath%>/static/image/b02.jpg"></i>
                <div class="font">
                    <h3>个人博客模板《早安》</h3>
                </div>
            </a>
        </li>
        <li>
            <a href="/"><i><img src="<%=basePath%>/static/image/b03.jpg"></i>
                <div class="font">
                    <h3>个人博客模板《早安》</h3>
                </div>
            </a>
        </li>
        <li>
            <a href="/"><i><img src="<%=basePath%>/static/image/b04.jpg"></i>
                <div class="font">
                    <h3>个人博客模板《早安》</h3>
                </div>
            </a>
        </li>
        <li>
            <a href="/"><i><img src="<%=basePath%>/static/image/b05.jpg"></i>
                <div class="font">
                    <h3>个人博客模板《早安》</h3>
                </div>
            </a>
        </li>
    </ul>
</div>
<article>
    <div class="blogs layui-anim layui-anim-up">
        <li><span class="blogpic"><a href="/"><img src="<%=basePath%>/static/image/text02.jpg"></a></span>

            <h3 class="blogtitle"><span class="layui-btn layui-btn-danger layui-btn-sm">测试用的</span><a
                    href="pages/front/info.jsp">陌上花开，可缓缓归矣</a>
            </h3>
            <div class="bloginfo">
                <p>用最简单的代码，实现瀑布流布局，没有繁琐的css，没有jq，只需要做到以下就可以实现瀑布流的效果。思路很简单，看成是三列布局，分别用三个ul来调用。帝国cms列表模板，...</p>
            </div>
            <div class="autor"><span class="layui-icon layui-icon-note"><a href="/" title="CSS3|Html5" target="_blank" class="classname">CSS3|Html5</a></span><span
                    class="layui-icon layui-icon-log">2018-05-04</span><span class="layui-icon layui-icon-flag">浏览（<a href="/">0</a>）</span><span
                    class="readmore"><a href="/">阅读原文</a></span></div>
        </li>
        <!--分页开始-->
        <div id="pages"></div>
    </div>

    <div class="sidebar">
        <div class="about">
            <div class="avatar"><img src="<%=basePath%>/static/image/avatar.jpg" alt=""></div>
            <p class="abname">dancesmile | whyzaa</p>
            <p class="abposition">Java开发工程师</p>
            <div class="abtext"> xxxxxxxxxxxxxxxxxxx</div>
        </div>
        <div class="search">
            <form action="" method="post" name="searchform" id="searchform">
                <input class="layui-input" style="float: left;width: 75%;" name="keyboard" id="keyboard"
                       class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);"
                       onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
                       onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>
        </div>

        <jsp:include page="pages/front/paihang.jsp"></jsp:include>


</article>
<div class="blank"></div>
<footer>
    <span class="layui-icon layui-icon-login-wechat">微信</span>
    <span class="layui-icon layui-icon-login-qq">微信</span>
    <span class="layui-icon layui-icon-login-weibo">微信</span>

    <p>Design by
        <a href="javascript:(0)">whyzaa个人博客</a>
        <a href="javascript:(0)">湘ICP备11002373号-1</a>
    </p>
</footer>
<script src="<%=basePath%>/static/js/nav.js"></script>
<script>
    layui.use('laypage', function () {
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
            , theme: '#FF5722'
            , count: 50 //数据总数，从服务端得到
        });
    });
</script>
</body>

</html>
