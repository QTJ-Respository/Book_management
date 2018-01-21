<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        #mainDiv{
            width: 50%;
            min-width: 500px;
            height:90%;
            border: 1px solid #C3D6E8;
            margin: auto;
            padding-left: 50px;
            border: 1px solid #C3D6E8;
            padding-top: 20px;
            border-radius: 10px;
            background-color: lightskyblue;
        }
        input,select{
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
    </style>
</head>
<body style="background-color: #F5FAFF">
<h2>添加书籍</h2>
    <div id="message" style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p name="message_p" style="color:green;">添加成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加失败!</p>
        </c:if>
    </div>
<div id="mainDiv" >
        <form action="${pageContext.request.contextPath}/booksAction/addBooks" method="post">
            书名：<input class="myinput" name="book_name">&nbsp;<div id="error1" style="display:inline;color:red;"></div><br><br>
            分类：<select name="book_type">
                    <option value="小说">小说</option><option value="文学">文学</option>
                    <option value="法学">法学</option><option value="技术">技术</option>
                  </select><br><br>
            价格：<input class="myinput" name="book_price">&nbsp;<div id="error2" style="display:inline;color:red;"></div><br><br>
            作者：<input class="myinput" name="book_author">&nbsp;<div id="error3" style="display:inline;color:red;"></div><br><br>
            总数：<input class="myinput" name="book_amount">&nbsp;<div id="error4" style="display:inline;color:red;"></div><br><br>
            时间：<input class="myinput" name="book_intime">&nbsp;<div id="error5" style="display:inline;color:red;"></div><br><br>
            <input style="padding: 10px" type="submit" value="添加">&nbsp;<input style="padding: 10px" type="reset" value="取消">
        </form>
</div>
</body>
</html>
<script>
    $("document").ready(function(){
        $("#myform").submit(function(){
            //姓名验证
            var name=$("input[name='book_name']").val();
            if(name.length==0) {
                $("#name_test").html("名称不可以为空");
                return false;
            }else{
                $("#name_test").html("输入正确");
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
</script>
