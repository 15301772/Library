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
    <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/insertUser.action">
        <input type="hidden" name="method" value="add">
        <div class="content">
            <table class="box">
                <tbody>
                <tr>
                    <td class="field">用户名：</td>
                    <td>
                        <input type="text" name="name" class="text" id="name" value=""> <font color="red">*</font><font
                            color="red" id="name_span"></font>
                    </td>
                </tr>
                <tr>
                    <td class="field">用户账号：</td>
                    <td><input type="text" name="account" class="text" id="loginName" value=""> <font
                            color="red">*</font><font color="red" id="loginName_span"></font></td>
                </tr>
                <tr>
                    <td class="field">用户密码：</td>
                    <td><input type="password" name="password" class="text" id="password" value=""> <font
                            color="red">*</font><font color="red" id="password_span"></font></td>
                </tr>
                <tr>
                    <td class="field">确认密码：</td>
                    <td><input type="password" name="conpassword" class="text" id="rpassword" value=""> <font
                            color="red">*</font></td>
                </tr>
                <tr>
                    <td class="field">用户性别：</td>
                    <td><select name="sex" id="gender">
                        <option value="男" checked="">男</option>
                        <option value="女">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td class="field">出生日期：</td>
                    <td><input type="text" name="date" class="text" id="birthDate" value=""> <font
                            color="red">*</font><font color="red" id="birthDate_span"></font></td>
                </tr>
                <tr>
                    <td class="field">用户电话：</td>
                    <td><input type="text" name="tel" class="text" id="phone" value=""> <font color="red">*</font><font
                            color="red" id="phone_span"></font></td>

                </tr>
                <tr>
                    <td class="field">用户地址：</td>
                    <td><input name="address" id="address" class="text" value=""></td>
                </tr>
                <tr>
                    <td class="field">用户权限：</td>
                    <td>
                        <input type="radio" name="root" value="管理员">管理员<input type="radio" name="root" value="普通用户"
                                                                              checked="true">普通用户
                        <input type="radio" name="root" value="经理">经理
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <input type="submit" name="add" id="add" value="保存" class="input-button">
            <input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
        </div>
    </form>
</div>
<script type="text/javascript" src="js/user/add.js"></script>


</body>
</html>