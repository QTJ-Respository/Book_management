<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8 0008
  Time: 下午 7:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>用户登录</h1>
<div style="font-size: 18px">
    <c:if test="${param.rtype==-1}">
        <p style="color:red;">登录失败!</p>
    </c:if>
</div>
<form action="adminsAction/doLogin" method="post">
    用户名：<input name="uname"><br>
    密&nbsp;码：<input name="upwd"><br>
    <input type="submit" value="登录">
</form>
<a href="#">找回密码</a>
</body>
</html>
