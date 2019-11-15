<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/updateUser.action">
		<input type="hidden" name="method" value="update">
		<div class="content">
			<font color="red"></font>
			<table class="box">
				<tbody>
				<tr>
					<td class="field">用户名：</td>
					<td>
						<input type="hidden" name="id" value="${user.id}">
						<input name="name" value="${user.name}">
						<font color="red">*</font><font color="red" id="name_span"></font>
					</td>
				</tr>
				<tr>
					<td class="field">用户性别：</td>
					<td><input name="sex" value="${user.sex}"></td>
				</tr>
				<tr>
					<td class="field">出生日期：</td>
					<td><input name="date" value="${user.date}"><font color="red">*</font><font color="red" id="birthDate_span"></font></td>
				</tr>
				<tr>
					<td class="field">用户电话：</td>
					<td><input name="tel" value="${user.tel}"><font color="red">*</font><font color="red" id="phone_span"></font></td>
				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><input name="address" value="${user.address}"></td>
				</tr>
				<tr>
					<td class="field">用户权限：</td>
					<td><input name="root" value="${user.root}"></td>
				</tr>
				<tr>
					<td class="field">头像：</td>
					<td>
						<form action="<%=request.getContextPath()%>/updateItemFile.action" method="post" enctype="multipart/form-data">
							<input type="file" name="pictuserName" value="${user.headPath}">
							<img src="/pic/${user.headPath}" />
						</form>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="buttons">
			<input type="submit" name="update" id="update" value="修改" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
		</div>
	</form>
</div>
<script type="text/javascript" src="js/user/update.js"></script>
</body>
</html>