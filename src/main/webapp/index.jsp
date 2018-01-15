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
    <style>
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            color: #7F9DB9;
        }
        #main_div{
            margin: auto;
            width: 400px;
            height: 50%;
            padding-top: 30px;
        }
    </style>
</head>
<body>
<div><img src="images/top03.gif" width="100%" height="147"></div>

<div id="main_div">
    <div style="float: right">
        <div style="font-size: 18px">
            <c:if test="${param.rtype==-1}">
                <p style="color:red;">登录失败!</p>
            </c:if>
        </div>
        <form action="adminsAction/doLogin" method="post">
            用户名：<input name="uname"><br><br>
            密&nbsp;码：<input name="upwd"><br><br>
            <input type="submit" style="background-color: #D6EDFF;border: solid 1px #87A3C1;" value="登录">&nbsp;<a href="#" style="font-size: 9px;">找回密码</a>
        </form>

    </div>
    <div>
        <img src="images/ico13.gif">
    </div>
</div>
</body>
</html>
