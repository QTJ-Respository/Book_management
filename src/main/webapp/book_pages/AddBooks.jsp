<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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
        }
    </style>
</head>
<body style="background-color: #F5FAFF">
<h2>添加书籍</h2>
    <div id="message" style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p name="message_p" style="color:green;">添加成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加失败!</p>
        </c:if>
    </div>
<div id="mainDiv">
    <center>
        <form action="${pageContext.request.contextPath}/booksAction/addBooks" method="post">
            书名：<input name="book_name"><br><br>
            分类：<select name="book_type">
                    <option value="小说">小说</option><option value="文学">文学</option>
                    <option value="法学">法学</option><option value="技术">技术</option>
                  </select><br><br>
            价格：<input name="book_price"><br><br>
            作者：<input name="book_author"><br><br>
            总数：<input name="book_amount"><br><br>
            时间：<input name="book_intime"><br><br>
            <input type="submit" value="添加">&nbsp;<input type="reset" value="取消">
        </form>
    </center>
</div>
</body>
</html>
