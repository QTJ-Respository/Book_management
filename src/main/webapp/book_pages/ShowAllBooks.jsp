<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />

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

<body style="padding: 40px;background-color: #F0F0F0">

<table id="mytb" style="background-color: white" class="table table-hover" border="1">
    <thead>
        <tr><td colspan="8" style="background-color: #6795B4">
            <center style="font-size: 18px;color: white">书籍列表</center>
        </td></tr>
        <tr style="background-color: #EEEEEE">
            <td>编号</td><td>名称</td><td>类型</td><td>作者</td><td>价格</td><td>上架数量</td>
            <td>上架时间</td><td>管理</td>
        </tr>

    </thead>
</table>
<div style="float: right;padding: 10px;">
    <input type="button"  onclick="firstPage();"  name="Submit" value="首页" class="button"/>
    <input type="button"  id="upPage" onclick="upPage()"  name="Submit" value="上一页" class="button"/>
    <input type="button"  id="downPage" onclick="downPage()"  name="Submit" value="下一页" class="button"/>
    <input type="button"  onclick="lastPage();" name="Submit" value="尾页" class="button"/>
</div>

</body>
</html>
<script>
    function lastPage(){
        $("#mytb tr:gt(1)").remove();
        $.get("${pageContext.request.contextPath}/booksAction/lastPage","",function(data) {
            $.each(data, function (i, v) {
                var str = "<tr>";
                str += "<td>" + (i + 1) + "</td>";
                str += "<td>" + v[4] + "</td>";
                str += "<td>" + v[7] + "</td>";
                str += "<td>" + v[2] + "</td>";
                str += "<td>" + v[5] + "</td>";
                str += "<td>" + v[1] + "</td>";
                var date = new Date(v[3]);
                str += "<td>" + date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + (date.getDate()) + "</td>";
                str += "<td><a href='${pageContext.request.contextPath}/booksAction/updateBooks?id="+v[0]+"'>修改<a></td>";
                str += "</tr>";
                $("#mytb").append(str);
            })
        })
    }
    function firstPage(){
        $("#mytb tr:gt(1)").remove();
        $.get("${pageContext.request.contextPath}/booksAction/firstPage","",function(data) {
            $.each(data, function (i, v) {
                var str = "<tr>";
                str += "<td>" + (i + 1) + "</td>";
                str += "<td>" + v[4] + "</td>";
                str += "<td>" + v[7] + "</td>";
                str += "<td>" + v[2] + "</td>";
                str += "<td>" + v[5] + "</td>";
                str += "<td>" + v[1] + "</td>";
                var date = new Date(v[3]);
                str += "<td>" + date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + (date.getDate()) + "</td>";
                str += "<td><a href='${pageContext.request.contextPath}/booksAction/updateBooks?id="+v[0]+"'>修改<a></td>";

                str += "</tr>";
                $("#mytb").append(str);
            })
        })
    }
    //页面加载完毕显示所有书籍
    /*
    $(function(){
       $.get("/booksAction/findBookList",null,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                    str+="<td>"+(i+1)+"</td>";
                    str+="<td>"+v.book_name+"</td>";
                    str+="<td>"+v.book_type+"</td>";
                    str+="<td>"+v.book_author+"</td>";
                    str+="<td>"+v.book_price+"</td>";
                    str+="<td>"+v.book_amount+"</td>";
                    var date = new Date(v.book_intime);
                    str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDay()+1)+"</td>";
                    str +="</tr>";
                    $("#mytb").append(str);
            });
        });
    });
    */
    //-------------------------------
    var initPage = 0;
    var bookCount = 0;
    $(function(){
        initPage = 1;
        var param = "page="+initPage;
        $.get("${pageContext.request.contextPath}/booksAction/findBookListCount",null,function(data){
            bookCount += data;
        });
        $.get("${pageContext.request.contextPath}/booksAction/findBookListBypage",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str+="<td>"+(i+1)+"</td>";
                str+="<td>"+v[4]+"</td>";
                str+="<td>"+v[7]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate())+"</td>";
                str += "<td><a href='${pageContext.request.contextPath}/booksAction/updateBooks?id="+v[0]+"'>修改<a></td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
        });

    })

    //上一页
    function upPage(){
        $("#mytb tr:gt(1)").remove();
        $("#downPage").attr("onclick","lastPage();");
        initPage--;
        if(initPage<=0)
            initPage=1;
        //带条件分页查询
        var param = "page="+initPage;
        $.post("${pageContext.request.contextPath}/booksAction/findBookListBypage",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str+="<td>"+(i+1)+"</td>";
                str+="<td>"+v[4]+"</td>";
                str+="<td>"+v[7]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate())+"</td>";
                str += "<td><a href='${pageContext.request.contextPath}/booksAction/updateBooks?id="+v[0]+"'>修改<a></td>";

                str +="</tr>";
                $("#mytb").append(str);
            });
        });
    }
    function downPage(){
        $("#mytb tr:gt(1)").remove();
            initPage++;
        //带条件查询
        var param = "page="+initPage;
        $.post("${pageContext.request.contextPath}/booksAction/findBookListBypage",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str+="<td>"+(i+1)+"</td>";
                str+="<td>"+v[4]+"</td>";
                str+="<td>"+v[7]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDay()+1)+"</td>";
                str += "<td><a href='${pageContext.request.contextPath}/booksAction/updateBooks?id="+v[0]+"'>修改<a></td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
            //查询完毕后不能下一页
            if($("#mytb tr").length!=6){
                $("#downPage").attr("onclick","");
                var str = "<tr><td colspan='8' style='text-align: center'>没有数据了</td></tr>";
                $("#mytb").append(str);
            }
        });
    }

    //打开div
    function openDiv(){

        //$("#main_div").hide();//隐藏div
    }

</script>
