<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/18
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<input type="text" name="username">
<input type="text" name="account">
<input type="text" name="password">
<input type="button" name="search" value="搜索">
<span></span>
<tbody></tbody>
<script>
    $(function () {
        var username = $("input[name = username]");
        username.on("blur",function () {
            $.ajax({
                url:"<%=request.getContextPath()%>/check.action",
                data:"username=" + username.val(),
                type:"post",
                success:function (d) {
                    if (d.length>0){
                        $("span").html(d);
                    }
                }
            })
        })
        $("input[name = search]").on("click",function () {
            var account =  $("input[name = account]");
            var password =  $("input[name = password]");
            var data = {"account":account.val(),"password":password.val()}
            $.ajax({
                url:"<%=request.getContextPath()%>/searchByWhere.action",
                data:JSON.stringify(data),
                type:"post",
                contentType:"application/json;charset=utf-8",
                success:function (d) {
                    $("tbody").empty();
                    for (var i = 0;i<d.length; i++){
                        $("tbody").append("<tr><td>" + d[i].account + "<tr><td>" + d[i].password + "<tr><td>" )
                    }
                }
            })
        })
    })
</script>
</body>
</html>
