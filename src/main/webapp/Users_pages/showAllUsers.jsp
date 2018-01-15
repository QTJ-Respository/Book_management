<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20 0020
  Time: 下午 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="padding: 30px">
<h2>showAllUsers</h2>
<table style="font-size: 9px" id="mytb" border="1" class="table table-hover">
    <thead>
        <tr>
            <td>编号</td><td>姓名</td><td>性别</td><td>电话</td>
            <td>证号</td><td>地址</td><td>订金</td>
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
                    str+= "</tr>";
                $("#mytb").append(str);
            })

        },"json");
    })

</script>
