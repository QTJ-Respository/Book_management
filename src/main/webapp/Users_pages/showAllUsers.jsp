<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20 0020
  Time: 下午 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="padding: 30px;background-color: #F5FAFF">
<h2>showAllUsers</h2>
<div id="message" style="font-size: 18px;width: 100%;text-align: center">
        <p id="message_p" name="message_p" style="color:green;display: none">已禁用!</p>
        <p id="message_p2" style="color:red;display: none">禁用失败!</p>
</div>
<table style="font-size: 9px" id="mytb" border="1" class="table table-hover">
    <thead>
        <tr>
            <td>编号</td><td>姓名</td><td>性别</td><td>电话</td>
            <td>证号</td><td>地址</td><td>订金</td><td>状态</td><td>管理</td>
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
    $(function () {
        $("#mytb tr:not(:first)").remove();
        $.get("${pageContext.request.contextPath}/usersAction/findAllUser","",function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                    str +="<td>"+(i+1)+"</td>";
                    str += "<td>"+v.user_name+"</td>";
                    str +="<td>"+(v.user_sex==1?'男':'女')+"</td>";
                    str +="<td>"+v.user_tel+"</td>";
                    str +="<td>"+v.user_ID+"</td>";
                    str +="<td>"+v.user_address+"</td>";
                    str +="<td>"+v.user_money+"</td>";
                    str +="<td>"+(v.user_state==1?'正常':'拉黑')+"</td>";
                    str +="<td><a href='${pageContext.request.contextPath}/usersAction/findUserById?id="+v.user_no+"'>禁用</a></td>";
                    str+= "</tr>";
                $("#mytb").append(str);

            })

        },"json");

            if(${param.rtype==1}){
                $("#message_p").show();
                setTimeout(dohide,2000);
            }
            if(${param.rtype==-1}){
                $("#message_p2").show();
                setTimeout(dohide,2000);
            }

        })
        function dohide(){
            $("#message_p").hide(300);
        }

</script>
