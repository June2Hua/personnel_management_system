<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/3/23
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>人员列表</title>
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
    <%--使用bootstrap栅格布局--%>
    <div class="container" style="margin-top: 20px">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h3>人员管理系统（personnel management system）</h3>
            </div>
        </div>

        <%--插入和删除按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-success">增加</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>

        <%--查询的列表--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table-hover table">
                    <%--表格的标题栏--%>
                    <tr>
                        <td>#</td>
                        <td>序号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>邮箱</td>
                        <td>部门</td>
                        <td>操作</td>
                    </tr>
                        <%--表格的标题栏--%>
                        <tr>
                            <td>1</td>
                            <td>序号</td>
                            <td>姓名</td>
                            <td>性别</td>
                            <td>邮箱</td>
                            <td>部门</td>
                            <td>
                                <button type="button" class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    插入
                                </button>
                                <button type="button" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    插入
                                </button>
                            </td>
                        </tr>

                </table>
            </div>
        </div>

        <%--页号相关信息--%>
        <div class="row">
            <div class="col-md-6">
                分页信息：×××××
            </div>
            <%--分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">尾页</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
