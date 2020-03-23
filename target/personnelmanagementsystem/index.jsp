<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/3/21
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        //        添加路径
        pageContext.setAttribute("PATH", request.getContextPath());
    %>
    <%--连接jQuery--%>
    <script src="${PATH}/static/js/jquery-3.4.1.js"></script>
    <!-- Bootstrap -->
    <%--连接bootstrap--%>
    <link href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="margin: 200px">
        <a href="${PATH}/emps"><button type="button" class="btn btn-success" >按钮</button></a>
    </div>

</body>
</html>
