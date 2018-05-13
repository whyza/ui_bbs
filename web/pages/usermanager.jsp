<%--
  Created by IntelliJ IDEA.
  User: LS
  Date: 2018/5/12
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script type="text/javascript" src="../layui/jquery-2.1.4.js"></script>
</head>
<body>

<style>
    .ffr {
        float: right;
    }

    @media screen and (max-width: 540px) {
        .layui-btn {
            display: inline-block;
            height: 30px;
            line-height: 30px;
            padding: 0 5px;
            color: #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }

        .ffr {
            position: absolute;
        }

        .frrr {
            float: right;
        }
        .wid{
            width: 120px;
            height: 30px;
        }
        .display{
            display: none;
        }
        .widd{
            height: 35px;
        }
    }
</style>
<form class="layui-form layui-anim layui-anim-up layui-form-item widd" action="#" id="form" method="post">
    <div class="layui-inline frrr">
        <a class="layui-btn layui-btn-md layui-btn-danger">批量删除</a>
        <a id="adduser" class="layui-btn layui-btn-normal">添加用户</a>
    </div>
    <div class="ffr" style="min-width: 152px;">
        <div style="float: left;line-height:40px" class="display">
            搜索用户：
        </div>
        <div style="float: left;margin-right: 10px">
            <input name="username" class="layui-input wid" id="demoReload" autocomplete="off" placeholder="输入用户名检索">
        </div>
        <div style="float: right">
            <button class="layui-btn" lay-submit data-type="reload" type="submit" lay-filter="search">搜索</button>
        </div>
    </div>

</form>


<table class="layui-hide" id="test" style="float:left;"></table>
<script src="../layui/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function () {
        var loading = layer.msg('加载数据库中,请稍后......', {
            icon: 16
            , shade: 0.01
        });
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '<%=basePath%>selectAllUserInfo.do'
            , page: true
            , cols: [[
                {type: 'checkbox'}
                , {field: 'userid', width: 200, title: '用户ID', sort: true, align: 'center'}
                , {field: 'username', width: 200, title: '用户名', align: 'center'}
                , {field: 'uemail', width: 250, title: '邮箱', sort: true, align: 'center'}
                , {field: 'registertime', width: 250, title: '注册时间', align: 'center'}
                , {field: 'userstatus', width: 250, title: '用户状态', sort: true, align: 'center'}
                , {field: 'userrole', width: 242, title: '用户权限', sort: true, align: 'center'}
                , {width: 250, title: '操作', sort: true, toolbar: '#barDemo', align: 'center'}
            ]], done: function () {
                layer.close(loading);
            }
        });
    });
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

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
        layer.msg(JSON.stringify($('#form').serializeObject()));
        //监听提交
        form.on('submit(search)', function (data) {
            var username = $("input[name='username']").val();
            var loading = layer.msg('请稍后....', {
                icon: 16
                , shade: 0.01
            });
            var url = '<%=basePath%>selectUser.do';
            $.ajax({
                type: "GET",
                url: url,
                dataType: "json",
                data: 'username=' + username,
                contentType: 'application/json;',
                success: function (data) {
                    layer.msg("检索成功！！");
                    var table = layui.table;
                    table.render({
                        elem: '#test'
                        , url: '<%=basePath%>selectUser.do?username=' + username
                        , page: true
                        , cols: [[
                            {type: 'checkbox'}
                            , {field: 'userid', width: 200, title: '用户ID', sort: true, align: 'center'}
                            , {field: 'username', width: 200, title: '用户名', align: 'center'}
                            , {field: 'uemail', width: 250, title: '邮箱', sort: true, align: 'center'}
                            , {field: 'registertime', width: 250, title: '注册时间', align: 'center'}
                            , {field: 'userstatus', width: 250, title: '用户状态', sort: true, align: 'center'}
                            , {field: 'userrole', width: 242, title: '用户权限', sort: true, align: 'center'}
                            , {width: 250, title: '操作', sort: true, toolbar: '#barDemo', align: 'center'}
                        ]]
                    });
                }, error: function () {
                    layer.msg("出错了！！！");
                }, done: function () {
                    layer.close(loading);
                }
            });
            return false;
        });
    });
    $('#adduser').on('click', function () {
        layer.open({
            type: 2,
            title: '添加用户',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['893px', '600px'],
            content: 'adduser.html'
        });
    });


</script>


</body>
</html>
