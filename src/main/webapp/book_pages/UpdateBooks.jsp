<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 上午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
    <style type="text/css">
        <!--
        .atten {font-size:12px;font-weight:normal;color:#F00;}
        -->
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body class="ContentBody">
<form id="myform" action="${pageContext.request.contextPath}/booksAction/doupdateBooks" method="post">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title" >书籍修改页面<center><span id="myspan"></span></center></th>
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
                                    <legend>添加书籍</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <input type="hidden" name="book_no" value="${book.book_no}">
                                            <td nowrap align="right" width="13%">书籍标题:</td>
                                            <td width="41%"><input id="book_name" value="${book.book_name}" name="book_name" class="text" style="width:250px" type="text" size="40" />
                                                <span id="bookname" class="red"> *</span></td>
                                            <td align="right" width="19%">上架时间:</td>
                                            <td width="27%"><input  name="book_intime" id="Input22" class="text" style="width:154px" /></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">价格:</td>
                                            <td><input name="book_price" value="${book.book_price}"  id="book_price"  class="text" style="width:154px" />
                                                <span id="bookprice" class="red"></span>
                                            </td>
                                            <td align="right">作者:</td>
                                            <td><input  name="book_author" value="${book.book_author}"  id="book_author" class="text" style="width:154px" />
                                                <span id="bookauthor" class="red"></span></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">总数:</td>
                                            <td><input name="book_amount"  value="${book.book_amount}"  id="book_amount" class="text" style="width:154px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">分类</td>
                                            <td><select id="myselect" name="book_type" >
                                                <option value="小说">小说</option><option value="文学">文学</option>
                                                <option value="法学">法学</option><option value="技术">技术</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" height="120px">书籍说明:</td>
                                            <td colspan="3"><textarea id="textarea" name="textarea" rows="5" cols="80"></textarea></td>
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
                    <input type="submit" name="Submit" value="保存" class="button"/>　

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
    $(function(){
        var intime = "${book.book_intime}";
        var str = intime.substring(0,10);
        $("input[name='book_intime']").val(str);

        var i = $("#myselect").get(0).options[1].value;
        var a = $("#myselect option").length;
        for(var i = 0;i<4;i++){
            if($("#myselect").get(0).options[i].value == "${book.book_type}"){
                $("#myselect").get(0).options[i].selected = true;
            }
        }
    })

    if(${param.rtype==1}){
        $("#myspan").html("修改成功");
        setTimeout("myspan()",1000);
    }
    function myspan(){
        $("#myspan").html(" ");
    }
    if(${param.rtype==-1}){
        $("#myspan").html("修改失败");
        setTimeout("myspan()",1000);
    }
</script>