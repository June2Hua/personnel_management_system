<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/3/23
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
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
            <button type="button" class="btn btn-success" id="addMyModal">增加</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>

    <%--查询的列表--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table-hover table">
                <%--表格的标题栏--%>
                <thead>
                    <td>#</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>邮箱</td>
                    <td>部门</td>
                    <td>操作</td>
                </thead>
                <%--数据,使用jQuery发送ajax请求，得到json数据动态填充--%>
                <tbody id="tbody">

                </tbody>
            </table>
        </div>
    </div>

    <%--页号相关信息--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--分页条--%>
        <div class="col-md-6" id="nav_info_area">

        </div>
    </div>
</div>


    <!-- Modal,点击增加按钮，弹出对话框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加人员信息</h4>
                </div>
                <%--Modal主体信息--%>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName" class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empName" placeholder="请输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">邮箱：</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" placeholder="请输入邮箱">
                            </div>
                        </div>
                        <%--性别--%>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别：</label>
                            <div class="col-md-6">
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="gender_M" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="gender_F" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <%--部门--%>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">部门：</label>
                            <div class="col-md-6" id="depts">
                                <select class="form-control">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%--使用jQuery发送ajax请求--%>
    <script type="text/javascript">
        $(function () {
            ajax_to_page(1);
        });
        // <button type="button" class="btn btn-success btn-sm">
        //     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
        // 插入
        // </button>
        function buildPersonnel(result) {
            var employees=result.extend.PageInfo.list;
            $("#tbody").empty();
            $.each(employees,function (index,item) {
                // alert(item.empName);
                // alert(item.gender);
                var id=$("<td></td>").append(item.empId);
                var name=$("<td></td>").append(item.empName);
                var gender=$("<td></td>").append(item.gender);
                var email=$("<td></td>").append(item.email);
                var department=$("<td></td>").append(item.department.deptName);
                var addBtn=$("<button></button>").addClass("btn btn-success btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("增加"));
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
                $("<tr></tr>").append(id).append(id).append(name).append(gender).append(email).append(department).append(addBtn).append(delBtn).appendTo("#tbody");
            });
        }

        function buildPageInfo(result) {
            // 清空上一页的显示数据
            $("#page_info_area").empty();
            var pageInfo = result.extend.PageInfo;
            var page_info = '当前第 <span class="label label-default">'+pageInfo.pageNum+'</span> 页，\
							共 <span class="label label-default">'+pageInfo.pages+'</span> 页，\
							共 <span class="label label-default">'+pageInfo.total+'</span> 条记录'
            $("#page_info_area").append(page_info);
        }

        function buildPageVal(result) {
            // 清空上一页的显示数据
            $("#nav_info_area").empty();

            var pageInfo = result.extend.PageInfo;
            // 每个导航数字 1 2 3都在li标签里面，所有li在一个ul里面，ul在nav里面
            var ul = $("<ul></ul>").addClass("pagination");
            var nav = $("<nav></nav>").attr("aria-label","Page navigation");
            // 首页li
            var firstLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            // 上一页li
            var prevLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;"));
            // 绑定事件（不在第一页时，点击首页和上一页才发送请求）
            if(pageInfo.hasPreviousPage == true){
                firstLi.click(function () {
                    ajax_to_page(1);
                });
                prevLi.click(function () {
                    ajax_to_page(pageInfo.pageNum-1);
                });
            }
            ul.append(firstLi).append(prevLi);

            // 遍历此次pageInfo中的导航页，并构建li标签，添加到ul
            $.each(pageInfo.navigatepageNums,function (index,item) {
                var navLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                // 遍历到当前显示的页，就高亮，且不能点击
                if(pageInfo.pageNum == item){
                    navLi.addClass("active");
                }else {
                    // 绑定单击事件
                    navLi.click(function () {
                        // 传入页号，获取数据
                        ajax_to_page(item);
                    });
                }
                ul.append(navLi);
            })

            // 下一页li
            var nextLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
            // 尾页li
            var lastLi = $("<li></li>").append($("<a></a>").attr("href","#").append("尾页"));
            // 绑定事件（不在最后页时，点击尾页和下一页才发送请求）
            if(pageInfo.hasNextPage == true){
                nextLi.click(function () {
                    ajax_to_page(pageInfo.pageNum+1);
                });
                lastLi.click(function () {
                    ajax_to_page(pageInfo.pages);
                });
            }
            ul.append(nextLi).append(lastLi);
            // 将ul添加到nav
            nav.append(ul);
            // 将构造好的nav添加到table tbody
            nav.appendTo($("#nav_info_area"));
        }


    //    跳转页面
        function ajax_to_page(pageNum) {
            $.ajax({
                url:"${PATH}/emps",
                type:"GET",
                data:"pn="+pageNum,
                // result是服务器返回结果(InfoDTO对象)
                success:function (result) {
                    // console.log(result);
                    totalPage = result.extend.PageInfo.total;
                    currentPage = result.extend.PageInfo.pageNum;
                    // 1.解析并显示员工信息
                    buildPersonnel(result);
                    // 2.解析并显示分页信息
                    buildPageInfo(result);
                    // 2.解析并显示导航信息
                    buildPageVal(result);
                }
            });
        }

        //Modal
        $("#addMyModal").click(function () {
            getDepartment(),
            $("#myModal").modal({
                backdrop:"static"
            });
        });

        function getDepartment() {
            $.ajax({
                url:"${PATH}/depts",
                type:"GET",
                // result是服务器返回结果(InfoDTO对象)
                success:function (result) {
                    console.log(result);
                    $.each(result.extend.depts,function () {
                        var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo("#depts select");
                    })
                }
            })
        }

    </script>

</body>
</html>
