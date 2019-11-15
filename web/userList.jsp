<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理系统-用户管理</title>
    <script src="js/jquery-3.4.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="<%=request.getContextPath()%>/userList.action">
                    <input name="method" value="query" class="input-text" type="hidden"> 用户名：
                    <input name="name" class="input-text" type="text" value="${name}">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input value="查 询" type="submit" name="select">
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="main">

    <div class="optitle clearfix">
        <em>
            <form action="<%=request.getContextPath()%>/userAdd.action"><input value="添加用户" class="input-button"
                                                                               type="submit"></form>
        </em>
        <div class="title">用户管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="list">
            <thead>
            <tr>
                <td width="70" height="29">
                    <div class="STYLE1" align="center">编号</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">用户名</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">用户账号</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">性别</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">出生日期</div>
                </td>
                <td width="150">
                    <div class="STYLE1" align="center">电话</div>
                </td>
                <td width="150">
                    <div class="STYLE1" align="center">权限</div>
                </td>
                <td width="150">
                    <div class="STYLE1" align="center">头像</div>
                </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${pageInfo.list}">
                <tr>
                    <td height="23">${user.id}</td>
                    <td><a href="#" name="search">${user.name}</a></td>
                    <td>${user.account}</td>
                    <td>${user.sex}</td>
                    <td>${user.date}</td>
                    <td>${user.tel}</td>
                    <td>${user.root}</td>
                    <td>${user.headPath}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div align="center">
            共<span>${pageInfo.pages}</span>页
            当前是第<span>${pageInfo.pageNum}</span>页 每页<span>${pageInfo.pageSize}</span>条记录
            <c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
            <c:if test="${pageInfo.isFirstPage==false}"><a href="/userList.action?page=${pageInfo.prePage}">上一页</a></c:if>
            <c:if test="${pageInfo.isLastPage==false}"><a href="/userList.action?page=${pageInfo.nextPage}&name=${name}">下一页</a></c:if>
            <c:if test="${pageInfo.isLastPage==true}">下一页</c:if>
        </div>
    </div>
</div>
<script>
    $(function () {
        var a = $("a");
        a.on("click", function () {
            for (var i = 0; i < a.length; i++) {
                var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;
                if (($(this))[i].name == "search") {
                    location.href = "/userView.action?id=" + id
                }
            }
        })
    })
</script>
</body>
</html>