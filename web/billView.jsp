<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">圖書管理&gt;&gt;</div>
	</div>
	<div class="content">
		<table class="box">
			<tbody>
			<tr>
				<td class="field">圖書编号：</td>
				<td>${bill.id}</td>
			</tr>
			<tr>
				<td class="field">书籍名称：</td>
				<td>${bill.name}</td>
			</tr>
			<tr>
				<td class="field">作者：</td>
				<td>${bill.writer}</td>
			</tr>

			<tr>
				<td class="field">出版社：</td>
				<td>${bill.publishe}</td>
			</tr>
			<tr>
				<td class="field">是否借出：</td>
				<td>${bill.press}</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="buttons">
		<div style="float: left;width: 100px">
			<form action="<%=request.getContextPath()%>/billUpdate.action" method="post">
				<input type="hidden" name="id" value="${bill.id}">
				<input type="submit" name="update" id="update" value="修改" class="input-button">
			</form>
		</div>
		<div style="float: left;width: 100px">
			<form action="<%=request.getContextPath()%>/deleteBook.action" method="post">
			<input type="hidden" id="billId" name="id" value="${bill.id}">
			<input type="submit" name="del" id="del" value="删除" class="input-button">
		</form>
		</div>
		<div style="float: left;width: 100px"><input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
		</div>
	</div>
</div>

</body></html>