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
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <style>
       #mainDiv{
           width: 50%;
           min-width: 500px;
           height:90%;
           background-color:white;
           margin: auto;
           padding-left: 10px;
       }
       #localImag{
            background-color: red;
            width:60px;
            height:80px;
           position: relative;
            left:55%;
            top:20%;
       }
    </style>
</head>
<body>
<h2>添加管理员</h2>
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
        <form id="myform"  action="${pageContext.request.contextPath}/adminsAction/addAdmins" method="post" enctype="multipart/form-data">
            姓名：<input name="admins_name"><br>
            性别：<input name="admins_sex" type="radio" value="1" checked>男
                  <input name="admins_sex" type="radio" value="0">女<br>
            年龄：<input name="admins_age"><br>
            邮箱：<input name="admins_email"><br>
            电话：<input name="admins_tel"><br>
            <div id="distpicker">
                <div class="form-group">
                   地址：<select name="sheng" class="form-control" id="province10" style="width: 90px"></select>
                         <select name="shi" class="form-control" id="city10" style="width: 90px"></select>
                         <select name="qu" class="form-control" id="district10" style="width: 90px"></select>
                </div>
            </div>
            证号：<input name="admins_ID"><br>
            状态：<input name="admins_state" value="1" type="radio" checked>启用
                  <input name="admins_state" value="0" type="radio">禁用<br>
            头像：<input name="ufile" type="file" name="doc" id="doc" onchange="javascript:setImagePreview();"><br>
            <input type="submit" value="添加">
        </form>
    </div>
</body>
</html>
<script>
   function setImagePreview() {
       var docObj=document.getElementById("doc");
       var imgObjPreview=document.getElementById("preview");
       if(docObj.files && docObj.files[0]){
//火狐下，直接设img属性
           imgObjPreview.style.display = 'block';
           imgObjPreview.style.width = '60px';
           imgObjPreview.style.height = '80px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
           imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
       }else{
//IE下，使用滤镜
           docObj.select();
           var imgSrc = document.selection.createRange().text;
           var localImagId = document.getElementById("localImag");
//必须设置初始大小
           localImagId.style.width = "250px";
           localImagId.style.height = "200px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
           try{
               localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
               localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
           }catch(e){
               alert("您上传的图片格式不正确，请重新选择!");
               return false;
           }
           imgObjPreview.style.display = 'none';
           document.selection.empty();
       }
       return true;
   }
</script>
