<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="padding: 20px;background-color: #F5FAFF">
<div id="mainDiv" style="position: absolute;top: 10%;left: 30%;background-color: #7F9DB9;">
    <center>
        <form action="" method="post" style="padding: 20px;">
            书名：<input name="book_name" value="${book.book_name }"><br><br>
            分类：<select name="book_type">
            <option value="小说">小说</option><option value="文学">文学</option>
            <option value="法学">法学</option><option value="技术">技术</option>
        </select><br><br>
            价格：<input name="book_price" value="${book.book_price }"><br><br>
            作者：<input name="book_author" value="${book.book_author }"><br><br>
            总数：<input name="book_amount" value="${book.book_amount }"><br><br>
            时间：<input name="book_intime" value="${book.book_intime }"><br><br>
            <input type="submit" value="添加">&nbsp;<input onClick="javascript :history.back(-1);" type="reset" value="取消">
        </form>
    </center>
</div>
</body>
</html>
<script>

</script>
