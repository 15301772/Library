<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户详情</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
			<div class="content">
				<table class="box">
					<tbody>
					<tr>
						<td class="field">用户编号：</td>
						<td><c:out value="${user.id}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户名：</td>
						<td><c:out value="${user.name}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户账号：</td>
						<td><c:out value="${user.account}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户性别：</td>
						<td><c:out value="${user.sex}"></c:out></td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td><c:out value="${user.date}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><c:out value="${user.tel}"></c:out></td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td><c:out value="${user.address}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>
						<td><c:out value="${user.root}"></c:out></td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="buttons">
				<form action="<%=request.getContextPath()%>/userUpdate.action" method="post" style="float: left">
                    <input type="submit" id="update" name="update" value="修改" class="input-button">
                    <input type="hidden" id="userId" name="id" value="${user.id}">
                </form>
				<form action="<%=request.getContextPath()%>/deleteUser.action" method="post" style="float: left">
                    <input type="submit" id="del" name="delete" value="删除" class="input-button">
                    <input type="hidden" id="userId1" name="id" value="${user.id}">
                </form>
				<%--<form action="" method="post" style="float: left"><input type="button" id="repassword" value="重置密码"--%>
																	 <%--class="input-button"></form>--%>
				<form style="float: left"><input type="button" id="backButton" onclick="history.back(-1)" value="返回"
												 class="input-button"></form>
			</div>
	</div>
	<script type="text/javascript" src="js/user/view.js">
	</script>
</body></html>