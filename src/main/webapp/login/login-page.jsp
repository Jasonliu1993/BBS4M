<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 24/06/2017
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/login/login-page.css">
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <title>登录 - MyBBS4M</title>
</head>
<body>
<div class="core-dialog">
    <form action="" method="post">
        <div class="error-dialog">用户名不能为空!</div>
        <div class="user-name-area">
            <div class="user-name-lab">用户名:</div>
            <div class="user-name-input">
                <input type="text" id="userId" name="userId" placeholder="邮箱/手机号"/>
            </div>
        </div><div class="user-password-area">
        <div class="user-password-lab">密&nbsp;&nbsp;&nbsp;&nbsp;码:</div>
        <div class="user-password-input">
            <input type="password" id="password" name="password" placeholder="请输入密码"/>
        </div>
    </div>
        <div class="button-area">
            <div class="login-button">
                <a href="javascript:;">登录</a>
            </div>
            <div class="register-button">
                <a href="javascript:;">注册</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
