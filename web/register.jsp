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
<input type="text" name="username" value="">
<span></span>
<script>
    $(function () {
        var username = $("input[name = username]");
        username.on("blur",function () {
            $.ajax({
                url:"<%=request.getContextPath()%>/check.action",
                data:"name" + username.val(),
                type:"post",
                success:function (d) {
                    if (d.length>0){
                        $("span").html(d);
                    }
                }
            })
        })
    })
</script>
</body>
</html>
