<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>校园宿舍管理系统</title>

    <link rel="icon" href="${pageContext.request.contextPath}/images/1.png" sizes="65x65">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/style/dorm.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
            border: 0;
        }
        .bs-docs-sidenav {
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
            padding-left: 50px;
            padding-top: 50px;
            width: 228px;
        }
        .bs-docs-sidenav li a {
            border: 1px solid #e5e5e5;
            display: block;
            padding: 8px 14px;
            margin: 0 0 -1px;
            text-decoration: none;
            color: #0097db;
        }
        .aa{
            float: right;
            line-height: 100%;
        }
        .bs-docs-sidenav  li:first-child a {
            border-radius: 6px 6px 0 0;
        }
        .bs-docs-sidenav  li:last-child a {
            border-radius: 0 0 6px 6px;
        }
        .bs-docs-sidenav li a:hover {
            background-color: #f5f5f5;
            color:#333333;
        }
        .container-fluid ul{
            list-style: none;
        }
        .bs-docs-sidebar{
            float: left;
            height: 82%;
            width: 22%;
        }
        #span10{
            float: right;
            width: 75%;
            height: 82%;
        }

    </style>

</head>
<body>
<div class="container-fluid0">
    <div region="north" style="height: 100px;background-image: url('${pageContext.request.contextPath}/images/bg.jpg')">
        <div align="left" style="width: 80%;height:100px ;float: left;padding-top: 40px;padding-left: 30px;" ><font color="white" size="6" >校园宿舍管理系统</font></div>
        <div style="padding-top: 70px;padding-right: 20px;font-weight: bolder;font-size: 25px;"><i class="fa fa-user-circle" aria-hidden="true"></i> 当前用户：&nbsp;<font color="red" >${user.name}</font></div>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="bs-docs-sidebar" >
            <ul class="bs-docs-sidenav">
                <li><a href="${pageContext.request.contextPath}/jsp1/student.jsp">首页<i class="aa fa fa-chevron-right" aria-hidden="true"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/absence/querystudent">学生缺勤记录<i class="aa fa fa-chevron-right" aria-hidden="true"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/absence/redo">学生补假<i class="aa fa fa-chevron-right" aria-hidden="true"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/login/preupdatepassage">修改密码<i class="aa fa fa-chevron-right" aria-hidden="true"></i></a></li>
                <li><a href="<c:url value='/login/quit'/>">退出系统<i class="aa fa fa-chevron-right" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="span10" id="span10">
            <jsp:include page="${mainPage==null?'/jsp2/blank2.jsp':mainPage}"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>