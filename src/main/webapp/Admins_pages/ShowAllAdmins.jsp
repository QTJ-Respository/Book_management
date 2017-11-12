<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <style>
        #mytb{
            font-size: 13px;
            min-width: 700px;
        }
        #mydiv{
            width: 700px;
            min-width: 700px;
            margin: auto;
        }
    </style>
</head>
<body>
<h2>管理员信息列表</h2>
<div id="mydiv">
<input id="AdminsName"><input onclick="adminsName();" type="button" value="查询"><br><br>
<table id="mytb" border="1">
    <tr>
        <td>编号</td><td>头像</td><td>姓名</td><td>年龄</td><td>性别</td><td>邮箱</td>
        <td>电话</td><td>住址</td><td>身份证</td><td>状态</td><td>管理</td>
    </tr>
</table>
</div>
</body>
</html>
<script>
    function adminsName(){
        var param = $("#AdminsName").val();
        $.post("",param,function(data){

        });
    }

    //页面初始化加载
    $(function(){
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
