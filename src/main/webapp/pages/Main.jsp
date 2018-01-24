<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8 0008
  Time: 下午 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <style>
        #head{
            width:100%;
            height:10%;
        }
        #Dao_hang{
            width:14%;
            min-width: 200px;
            height:90%;
        }
        #context{
            width:85%;
            height:90%;
            background-color: #f0f0f0;
            float:right;
        }
        #myiframe{
            width: 100%;
            height:100%;
        }
        a:hover{
            color: red;
        }

    </style>
</head>
<body style="font-size: 7px">
<div style="width: 100%;height:100%; min-width: 1000px;">
<div id="head" style="background-color: #87A3C1">
</div>
<div id="context">
    <iframe id="myiframe" src="Context.jsp" style="border: 2px solid #B8C9D6"></iframe>
</div>
<div id="Dao_hang" style="margin-left:10px;border: 2px solid #B8C9D6;">
    <div style="background: url('../images/nav01.gif');text-align: center;padding-top: 10px;height:55px;width:100%">
        <img src="../images<c:out value='${param.admins_img}'/>" width="35" height="35" />
        登录人：<c:out value="${param.admins_name}"/>

    </div>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading" style="background:url('../images/nav02.gif');background-size:100% 100%;">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne" style="font-size: 10px">
                        图书管理
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:toShowAllBook();">查询所有书籍</a><br>
                    <a href="javascript:toAddBook();">添加图书信息</a><br>

                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style="background:url('../images/nav02.gif');background-size:100% 100%;">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFour" style="font-size: 10px">
                        借阅信息
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:toBorrow_books();">添加借阅信息</a><br>
                    <a href="javascript:toShowBorrow_books();">查看借阅记录</a><br>
                    <a></a><br>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style="background:url('../images/nav02.gif');background-size:100% 100%;">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseTwo"  style="font-size: 10px">
                        学生管理
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:showAllUserss();">查看学生所有信息</a><br>
                    <a href="javascript:toAddUsers()">添加学生</a><br>
                    <a href="javascript:toBlacklist()">黑名单</a><br>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style="background:url('../images/nav02.gif');background-size:100% 100%;">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseThree"  style="font-size: 10px">
                        管理员
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:toShowAllAdmins();">查看管理员信息</a><br>
                    <a href="javascript:toaddAdmins();">添加新管理员</a><br>
                    <a></a><br>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
<script>
    //跳转到查询所有书籍页面
    function toShowAllBook(){
        $("#myiframe").attr("src","../book_pages/ShowAllBooks.jsp");
    }
    //跳转到添加书籍信息页面
    function toAddBook(){
        $("#myiframe").attr("src","../book_pages/AddBooks.jsp");
    }
    //跳转到更新书籍信息页面
    function toUpdateBook(){
        $("#myiframe").attr("src","../book_pages/UpdateBooks.jsp");
    }
    //跳转到查看管理员信息页面
    function toShowAllAdmins(){
        $("#myiframe").attr("src","../Admins_pages/ShowAllAdmins.jsp");
    }
    //跳转到添加管理员信息页面
    function toaddAdmins(){
        $("#myiframe").attr("src","../Admins_pages/addAdmins.jsp");
    }
    //跳转到添加用户页面
    function toAddUsers(){
        $("#myiframe").attr("src","../Users_pages/addUsers.jsp");
    }
    //跳转到查询Users页面
    function showAllUserss(){
        $("#myiframe").attr("src","../Users_pages/showAllUsers.jsp");
    }
    //跳转查看借阅页面
    function toBorrow_books(){
        $("#myiframe").attr("src","../Borrow_book/Borrow_books.jsp");
    }
    //跳转查看借阅信息页面
    function toShowBorrow_books(){
        $("#myiframe").attr("src","../Borrow_book/Show_Borrow_books.jsp");
    }
    //去到黑名单
    function toBlacklist(){
        $("#myiframe").attr("src","../Users_pages/Blacklist.jsp");
    }
</script>
