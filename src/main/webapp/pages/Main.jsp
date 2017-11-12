<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8 0008
  Time: 下午 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background-color: lightskyblue;
        }
        #Dao_hang{
            width:20%;
            min-width: 200px;
            height:90%;
            background-color: red;
        }
        #context{
            width:80%;
            height:90%;
            background-color: #f0f0f0;
            float:right;
        }
        #myiframe{
            width: 100%;
            height:100%;
        }
    </style>
</head>
<body>
<div style="width: 100%;height:100%;">
<div id="head">
    Logo
</div>
<div id="context">
    <iframe id="myiframe" src="Context.jsp"></iframe>
</div>
<div id="Dao_hang">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne">
                        图书管理
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:toShowAllBook();">查询所有书籍</a><br>
                    <a href="javascript:toAddBook();">添加图书信息</a><br>
                    <a href="javascript:toUpdateBook();">更新图书信息</a><br>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFour">
                        借阅信息
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="#">浏览学生的借阅信息</a><br>
                    <a>删除学生的借阅记录</a><br>
                    <a>9</a><br>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseTwo">
                        学生管理
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:test();">查看学生所有信息</a><br>
                    <a>5</a><br>
                    <a>6</a><br>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseThree">
                        管理员
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body" style="height:100px;">
                    <a href="javascript:toShowAllAdmins();">查看管理员信息</a><br>
                    <a href="javascript:toaddAdmins();">添加新管理员</a><br>
                    <a>9</a><br>
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
</script>
