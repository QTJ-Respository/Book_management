<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:41
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
            font-size: 13px;
            min-width: 700px;
        }
        #mydiv{
            padding: 20px;
            margin: auto;
        }
    </style>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #F5FAFF">
<h2>管理员信息列表</h2>
<div id="mydiv">
<form id="myform" action="" method="post">
    <input id="AdminsName" name="admins_name"><input type="button" onclick="findAdmins();" value="查询">
</form><br>
<table class="table table-hover" id="mytb" border="1">
    <thread>
        <tr>
            <td>编号</td><td>头像</td><td>姓名</td><td>年龄</td><td>性别</td><td>邮箱</td>
            <td>电话</td><td>住址</td><td>身份证</td><td>状态</td><td>管理</td>
        </tr>
    </thread>
</table>
</div>
</body>
</html>
<script>
    //根据名称查询
    function findAdmins(){
        $("#mytb tr:not(:first)").remove();
        //${pageContext.request.contextPath}/adminsAction/findAdminsByName
        var param = $("#myform").serialize();
        $.post("${pageContext.request.contextPath}/adminsAction/findAdminsByName",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str +="<td>"+(i+1)+"</td>";
                str +="<td><img style='width:30px;height:30px;' src='${pageContext.request.contextPath}/images/"+v.admins_img+"'></td>";
                str +="<td>"+v.admins_name+"</td>";
                str +="<td>"+v.admins_age+"</td>";
                str +="<td>"+(v.admins_sex==1?'男':'女')+"</td>";
                str +="<td>"+v.admins_email+"</td>";
                str +="<td>"+v.admins_tel+"</td>";
                str +="<td>"+v.admins_address+"</td>";
                str +="<td>"+v.admins_ID+"</td>";
                str +="<td>"+(v.admins_state==1?'启用':'禁用')+"</td>";
                str +="<td><a>修改</a> <a>删除</a></td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
        });
    }
    //页面初始化加载
    $(function(){
        $("#mytb tr:not(:first)").remove();
        $.get("${pageContext.request.contextPath}/adminsAction/findAdmins","",function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                    str +="<td>"+(i+1)+"</td>";
                    str +="<td><img style='width:30px;height:30px;' src='${pageContext.request.contextPath}/images/"+v.admins_img+"'></td>";
                    str +="<td>"+v.admins_name+"</td>";
                    str +="<td>"+v.admins_age+"</td>";
                    str +="<td>"+(v.admins_sex==1?'男':'女')+"</td>";
                    str +="<td>"+v.admins_email+"</td>";
                    str +="<td>"+v.admins_tel+"</td>";
                    str +="<td>"+v.admins_address+"</td>";
                    str +="<td>"+v.admins_ID+"</td>";
                    str +="<td>"+(v.admins_state==1?'启用':'禁用')+"</td>";
                    str +="<td><a>修改</a> <a>删除</a></td>";
                    str +="</tr>";
                $("#mytb").append(str);
            });
       },"json")
    })
</script>
