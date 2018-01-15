<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<h2>书籍信息列表</h2>

<table id="mytb" class="table table-hover" border="1">
    <thead>
        <tr>
            <td>编号</td><td>名称</td><td>类型</td><td>作者</td><td>价格</td><td>上架数量</td>
            <td>上架时间</td>
        </tr>
    </thead>
</table>
<center>
    <button onclick="upPage()">上一页</button><button id="downPage" onclick="downPage()">下一页</button>
</center>
</body>
</html>
<script>
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
                str+="<td>"+v[6]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDay()+1)+"</td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
        });

    })

    //上一页
    function upPage(){
        $("#mytb tr:not(:first)").remove();
        $("#downPage").attr("disabled",false);
        initPage--;
        if(initPage<=0)
            initPage=1;
        //带条件分页查询
        var param = "page="+initPage;
        $.post("${pageContext.request.contextPath}//booksAction/findBookListBypage",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str+="<td>"+(i+1)+"</td>";
                str+="<td>"+v[4]+"</td>";
                str+="<td>"+v[6]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDay()+1)+"</td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
        });
    }
    function downPage(){
        $("#mytb tr:not(:first)").remove();
            initPage++;
        //带条件查询
        var param = "page="+initPage;
        $.post("${pageContext.request.contextPath}//booksAction/findBookListBypage",param,function(data){
            $.each(data,function(i,v){
                var str = "<tr>";
                str+="<td>"+(i+1)+"</td>";
                str+="<td>"+v[4]+"</td>";
                str+="<td>"+v[6]+"</td>";
                str+="<td>"+v[2]+"</td>";
                str+="<td>"+v[5]+"</td>";
                str+="<td>"+v[1]+"</td>";
                var date = new Date(v[3]);
                str+="<td>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDay()+1)+"</td>";
                str +="</tr>";
                $("#mytb").append(str);
            });
            //查询完毕后不能下一页
            if($("#mytb tr").length!=6){
                $("#downPage").attr("disabled",true);
            }
        });
    }


</script>
