<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15 0015
  Time: 下午 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

    <title>Title</title>
    <style>
        #mainDiv{
            width: 50%;
            min-width: 500px;
            height:90%;
            border: 1px solid #C3D6E8;
            margin: auto;
            padding-left: 10px;
            border: 1px solid #C3D6E8;
            padding-top: 20px;
            border-radius: 10px;
            background-color: lightskyblue;
        }
        input,select{
            width: 200px;
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
    </style>
</head>
<body style="background-color: #F5FAFF;padding: 20px;">
<h1>Borrow books</h1>
    <div id="message" style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p name="message_p" style="color:green;">借书成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">借书失败!</p>
        </c:if>
    </div>
    <div id="mainDiv" >
        <center>
        <form action="${pageContext.request.contextPath}/borrowOrReturnAction/addRecord" method="post">
            用户姓名：<input id="uname" name="user.user_name" onblur="selectUser();"><br><br>
            用户电话：<input name="utel"><br><br>
            书籍名称：<input name="book.book_name"><br><br>
            借书时间：<input name="borrow_time" type="date"><br><br>
            归还时间：<input name="still_time" type="date"><br><br>
            <input type="submit"><br>
        </form>
        </center>
    </div>
</body>
</html>
<script>

</script>
