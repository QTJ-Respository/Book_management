<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15 0015
  Time: 下午 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />

    <title>Title</title>
    <style type="text/css">
        <!--
        .atten {font-size:12px;font-weight:normal;color:#F00;}
        -->
    </style>
</head>
<body class="ContentBody">
<form action="${pageContext.request.contextPath}/borrowOrReturnAction/addRecord" method="post">
    <div class="MainDiv" style="margin-top: 90px">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title" >信息登记页面<center><span id="myspan"></span></center></th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr><td align="left">
                            <input type="submit"  name="Submit" value="保存" class="button"/>　

                            <input type="reset" name="Submit2" value="重置" class="button"/>
                        </td></tr>

                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>添加借阅信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="13%">用户姓名:</td>
                                            <td width="41%"><input name="user.user_name" class="text" style="width:250px" type="text" size="40" />
                                                <span class="red"> *</span></td>
                                            <td nowrap align="right">书籍名称:</td>
                                            <td><input name="book.book_name" class="text" style="width:154px" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="19%">用户电话:</td>
                                            <td width="27%"><input name="utel" id="Input22" class="text" style="width:154px" /></td>
                                            <td align="right">借书时间:</td>
                                            <td><input name="borrow_time" id="Input" type="date" class="text" style="width:154px" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="19%"></td>
                                            <td width="27%"></td>
                                            <td align="right">归还时间:</td>
                                            <td><input name="still_time" id="Input2" type="date" class="text" style="width:154px" /></td>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </table>
                                    <br />
                                </fieldset>			</TD>
                        </TR>

                    </TABLE>


                </td>
            </tr>

            <TR>
                <TD colspan="2" align="center" height="50px">
                    <input type="submit"  name="Submit" value="保存" class="button"/>　

                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
            </TR>
        </TABLE>


        </td>
        </tr>




        </table>

    </div>
</form>
</body>
</html>
<script>
    if(${param.rtype==1}){
        $("#myspan").html("添加成功");
    setTimeout("myspan()",1000);
    }
    function myspan(){
        $("#myspan").html(" ");
    }
    if(${param.rtype==-1}){
        $("#myspan").html("添加失败");
    setTimeout("myspan()",1000);
    }
</script>
