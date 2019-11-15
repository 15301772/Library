<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">图书管理&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/updateBook.action">
		<input type="hidden" name="method" value="update">
		<input type="hidden" name="billId" id="billId" value="6">
		<div class="content">
			<table class="box">
				<tbody><tr>
					<td class="field">书籍名称：</td>
					<td>
						<input type="hidden" name="id" value="${bill.id}">
						<input type="text" name="name" class="text" id="productName" value="${bill.name}"> <font color="red">*</font><font color="red" id="productName_span"></font>
					</td>
				</tr>
				<tr>
					<td class="field">作者：</td>
					<td><input type="text" name="writer" class="text" id="productUnit" value="${bill.writer}"> <font color="red">*</font><font color="red" id="productUnit_span"></font></td>
				</tr>
				<tr>
					<td class="field">出版社：</td>
					<td>
						<input type="text" name="publishe" id="proId" value="${bill.publishe}">
						<font color="red">*</font><font color="red" id="proId_span"></font>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="update" id="update" value="保存" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
		</div>
	</form>
</div>
<script type="text/javascript" src="js/bill/update.js"></script>
</body></html>