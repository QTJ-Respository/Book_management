<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20 0020
  Time: 下午 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</head>
<body style="background-color: #F5FAFF;padding: 30px">
<h2>AddUsers</h2>
<div id="mainDiv">
    <div id="message" style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p name="message_p" style="color:green;">添加成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加失败!</p>
        </c:if>
    </div>
    <!--<input type=file name="doc" id="doc" onchange="javascript:setImagePreview();">-->
    <div id="localImag"><img id="preview" width="-1" height="-1" style="diplay:none" /></div>
    <form id="myform"  action="${pageContext.request.contextPath}/usersAction/addUsers" method="post" enctype="multipart/form-data">
        姓&nbsp;名：<input id="name" name="user_name">&nbsp;<div id="name_test" style="display:inline;color:red;"></div><br><br>
        性&nbsp;别：<input name="user_sex" type="radio" value="1" checked>男
        <input name="user_sex" type="radio" value="0">女<br><br>
        定&nbsp;金：<input name="user_money"><br><br>
        身份证：<input id="userid" name="user_ID">&nbsp;<div id="error5" style="display:inline;color:red;"></div><br><br>
        电&nbsp;话：<input id="tel" name="user_tel">&nbsp;<div id="error6" style="display:inline;color:red;"></div><br><br>
        <div id="distpicker">
            <div class="form-group">
                地&nbsp;址：<select name="sheng" class="form-control" id="province10" style="width: 90px"></select>
                <select name="shi" class="form-control" id="city10" style="width: 90px"></select>
                <select name="qu" class="form-control" id="district10" style="width: 90px"></select>
            </div>
        </div><br>
        状&nbsp;态：<input name="user_state" value="1" type="radio" checked>启用
        <input name="user_state" value="0" type="radio">禁用<br><br>
        <input type="submit" value="添加">
    </form>
</div>
</body>
</html>
<script>
    /*
    $("document").ready(function(){
        $("#myform").submit(function(){
            //姓名验证
            var user=$("#name").val();
            var username=/^[a-z]{6,10}/i;
            if(user.length==0) {
                $("#name_test").html("账号不可以为空");
                return false;
            }else if(!username.test(user)){
                $("#name_test").html("请输入6-10的字母");
                return false;
            }else{
                $("#name_test").html("输入正确");
            }

            //验证身份证
            var userid = $("#userid").val();
            var id = /^[1-4]{18}$/;
            if(userid.length==0){
                $("#error5").html("身份证不可以为空");
                return false;
            }else if(!id.test(telephone)){
                $("#error5").html("请输入合法身份证");
                return false;
            }else{
                $("#error5").html("输入正确");
            }

            //电话验证
            var telephone=$("#tel").val();
            var telephone1=/^[1]{1}[0-9]{10}/;
            if(telephone.length==0){
                $("#error6").html("电话不可以为空");
                return false;
            }else if(!telephone1.test(telephone)){
                $("#error6").html("请输入合法电话");
                return false;
            }else{
                $("#error6").html("输入正确");
            }
        })
    });
    */
</script>
