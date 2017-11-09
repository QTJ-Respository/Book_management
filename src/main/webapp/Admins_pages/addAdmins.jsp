<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
       #mainDiv{
           width: 60%;
           height:70%;
           background-color:white;
           margin: auto;
           padding: 10px;
       }
    </style>
</head>
<body>
<h2>添加管理员</h2>
    <div id="mainDiv">
        <form action="" method="post">
            姓名：<input name="admins_name"><br>
            性别：<input name="admins_sex" type="radio" value="1" checked>男
                  <input name="admins_sex" type="radio" value="0">女<br>
            年龄：<input name="admins_age"><br>



        </form>
    </div>
</body>
</html>
