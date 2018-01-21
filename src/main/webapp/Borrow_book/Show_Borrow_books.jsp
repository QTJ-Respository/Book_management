<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/17 0017
  Time: 上午 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <style>
        #mytb{
            margin: auto;
            font-size: 10px;
        }
    </style>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body style="padding: 20px;background-color: #F5FAFF">
<h2>Show_Borrow_books</h2>
    <input name="username"><input type="button" value="查询" onclick="findRecordByName();"><br><br>
    <table id="mytb" class="table table-hover" border="1">
        <thead>
        <tr>
            <td>编号</td><td>用户名</td><td>书籍名</td><td>借阅日期</td><td>归还日期</td><td>是否归还</td><td>管理</td>
        </tr>
        <tr>
            <a href="javascript:doPage(1);">首页</a>|
            <a href="javascript:doPage(${pageBean.cpage-1>0?pageBean.cpage-1:1});">上一页</a>|
            <a href="javascript:doPage(${pageBean.cpage+1>pageBean.allPage?pageBean.allPage:pageBean.cpage+1});">下一页</a>|
            <a href="javascript:doPage(${pageBean.allPage});">尾页</a>
        </tr>
        </thead>
    </table>
</body>
</html>
<script>
    function doPage(num){
        $("input[name='pageBean.cpage']").val(num);
        $("#mytb")[0].submit();
    }

    $(function(){
        $.get("${pageContext.request.contextPath}/borrowOrReturnAction/findRecord","",function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                    str += "<td>"+ (i+1) +"</td>";
                    str += "<td>"+ v[2] +"</td>";
                    str += "<td>"+ v[1] +"</td>";
                    var date = new Date(v[3]);
                    str += "<td>"+ date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate() +"</td>";
                    var date = new Date(v[4]);
                    str += "<td>"+ date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()  +"</td>";
                    str += "<td>"+ (v[5]==0?'否':'是')+"</td>";
                    str += "<td><a href='${pageContext.request.contextPath}/borrowOrReturnAction/HuanShu?param="+v[0]+"'>还书</a></td>";
                    str += "</tr>";
                $("#mytb").append(str);
            });

        },"json");
    })

    //根据名称查询的方法
    function findRecordByName(){
        $("#mytb tr:not(:first)").remove();
        var param = "username="+$("input[name='username']").val();
        $.post("${pageContext.request.contextPath}/borrowOrReturnAction/findRecordByName",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str += "<td>"+ (i+1) +"</td>";
                str += "<td>"+ v[2] +"</td>";
                str += "<td>"+ v[1] +"</td>";
                var date = new Date(v[3]);
                str += "<td>"+ date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate() +"</td>";
                var date = new Date(v[4]);
                str += "<td>"+ date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()  +"</td>";
                str += "<td>"+ (v[5]==0?'否':'是')+"</td>";
                str += "<td><a href='${pageContext.request.contextPath}/borrowOrReturnAction/HuanShu?param="+v[0]+"'>还书</a></td>";
                str += "</tr>";
                $("#mytb").append(str);
            })
        });

    }

</script>
