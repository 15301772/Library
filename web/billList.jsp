<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理系统-图书管理</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script src="/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="<%=request.getContextPath()%>/billList.action">
                    <input name="method" value="query" class="input-text" type="hidden">
                    书籍名称：<input name="name" class="input-text" type="text" value="">
                    作者：<input name="writer" class="input-text" type="text" value="">
                    是否借出：<input type="radio" name="press" value="1">是<input type="radio" name="press" value="0">否
                    <input value="查 询" type="submit">
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="main">
    <div class="optitle clearfix">
        <em>
            <form action="<%=request.getContextPath()%>/billAdd.action" method="post"><input value="添加图书"
                                                                                             class="input-button"
                                                                                             type="submit"></form>
        </em>
        <div class="title">图书管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="list">
            <thead>
            <tr>
                <td width="70" height="29">
                    <div class="STYLE1" align="center">图书编号</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">书籍名称</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">作者</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">出版社</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">是否借出</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">图书管理</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">借阅人</div>
                </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="bill" items="${billList}">
                <tr>
                    <td height="23">${bill.id}</td>
                    <td><a href="#" name="search">${bill.name}</a></td>
                    <td>${bill.writer}</td>
                    <td>${bill.publishe}</td>
                    <td>${bill.press}</td>
                    <td collapse=2>
                        <em>
                            <form action="<%=request.getContextPath()%>/deleteBook.action" method="post">
                                <input type="hidden" name="id" value="${bill.id}">
                                <input name="deleteBill" value="删除" class="input-button" type="submit">
                            </form>
                        </em>
                        <em>
                            <form action="<%=request.getContextPath()%>/billUpdate.action" method="post">
                                <input type="hidden" name="id" value="${bill.id}">
                                <input name="updateBill" value="修改" class="input-button" type="submit">
                            </form>
                        </em>
                    </td>
                    <td><c:out value="${bill.user.name}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
        var a = $("a");
        a.on("click", function () {
            for (var i = 0; i < a.length; i++) {
                var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;
                if (($(this))[i].name == "search") {
                    location.href = "billView.action?id=" + id;
                }
            }
        })
    })
</script>
</body>
</html>