<%--
  Created by IntelliJ IDEA.
  User: LS
  Date: 2018/5/12
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="../layui/css/layui.css"/>
    <link rel="stylesheet" href="../static/css/style.css"/>
    <script type="text/javascript" src="../layui/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../layui/layui.all.js"></script>
    <script type="text/javascript" src="../layer/layer.js"></script>
    <base href="<%=basePath %>">
</head>
<body>
<div class="login-main layui-anim layui-anim-up">

    <header class="layui-elip">用户注册</header>
    <form class="layui-form" method="post" action="#" id="form1">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="username" placeholder="用户名"  class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="password" name="password" required lay-verify="password" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="repeatpassword" id="repeatpassword" lay-verify="repeatpassword" placeholder="重复密码" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="email" name="uemail" lay-verify="email" placeholder="邮箱地址" lass="layui-input">
        </div>
        <div class=" ">
            <button class="layui-btn" style="width: 45%" lay-submit="" lay-filter="register">注册</button>
            <button type="reset" class="layui-btn layui-btn-danger" style="width: 45%;float: right">重置</button>
        </div>
        <hr/>
    </form>
</div>
<script>
    $.fn.serializeObject = function () {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
    layui.use('form', function () {
        var form = layui.form;
        form.verify({
            username: [
                /^[a-zA-Z_-]{4,16}$/,
                '用户名不合法(4-16位字母开头)..'
            ], password: [
                /^[\S]{6,18}$/, '密码必须6到18位，且不能出现空格'
            ], repeatpassword: function (value) {
                var password = $("#password").val();
                if (value != password) {
                    return '两次输入的密码不一致!';
                }
            }
        }); // 监听提交
        form.on('submit(register)', function (data) {
            var loading = layer.msg('请稍后....', {
                icon: 16
                , shade: 0.01
            });
            var url = '<%=basePath%>/re.do';
            $.ajax({
                type: "POST",
                url: url,
                dataType: "text",
                data: JSON.stringify($('#form1').serializeObject()),
                contentType: 'application/json;',
                success: function (data) {
                    if (data == "success") {
                        layer.msg("注册成功...");
                        window.location.href = "<%=basePath%>/pages/login.html";
                    } else if (data == "error") {
                        layer.msg("注册失败...");
                        window.location.href = "<%=basePath%>/pages/register.jsp";
                    }
                }, error: function () {
                    layer.msg("错误");
                }, done: function () {
                    layer.close(loading);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>