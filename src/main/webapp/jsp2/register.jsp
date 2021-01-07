<%--
  Created by IntelliJ IDEA.
  User: 聪聪
  Date: 2020/12/18
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户注册</title>
    <script type="text/javascript">
        function checkForm(){
            var username=document.getElementById("username").value;
            var newPassword=document.getElementById("newPassword").value;
            var rPassword=document.getElementById("rPassword").value;
            var name=document.getElementById("name").value;
            if(username==""||newPassword==""||name==""||rPassword==""){
                document.getElementById("error").innerHTML="信息填写不完整！";
                return false;
            } else if(newPassword!=rPassword){
                document.getElementById("error").innerHTML="密码填写不一致！";
                return false;
            }
            return true;
        }

        $(document).ready(function(){
            $("ul li:eq(5)").addClass("active");
        });
    </script>
</head>
<style>
    #data_form{
        margin: 0 300px;
        margin-top: 200px;
    }
   body{
       background-image: url('${pageContext.request.contextPath}/images/bg.jpg');
   }
   #zhuce:hover{
       color: red;
   }
   #cc{
       text-align: center;
       margin-top: 20px;
       padding-left: 75px;
   }
</style>
<body>
<form action="${pageContext.request.contextPath}/login/register" method="post" onsubmit="return checkForm()">
    <div id="data_form" class="data_form"  align="center">
          <h1 style="text-align: center">用户注册账号</h1>
        <table align="center">
            <tr>
                <td><font color="red">*</font>用户名：</td>
                <td><input type="text" id="username"  name="username"  style="margin-top:5px;height:30px;" /></td>
            </tr>
            <tr>
                <td><font color="red">*</font>密码：</td>
                <td><input type="password" id="newPassword"  name="password"  style="margin-top:5px;height:30px;" /></td>
            </tr>
            <tr>
                <td><font color="red">*</font>确认密码：</td>
                <td><input type="password" id="rPassword"   style="margin-top:5px;height:30px;" /></td>
            </tr>
            <tr>
                <td><font color="red">*</font>姓名：</td>
                <td><input type="text" id="name"  name="name"  style="margin-top:5px;height:30px;" /></td>
            </tr>
            <tr>
                <td><font color="red">*</font>身份：</td>

           <td> <select id="flag" name="flag" style="margin-top:5px;height:30px;" onchange="this">
                    <option>系统管理员</option>
                    <option>宿舍管理员</option>
                    <option>学生</option>
                </select>  </td>
            </tr>
        </table>
        <div id="cc" align="center">
            <input id="zhuce" type="submit" class="btn btn-primary" value="注册"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-primary" type="reset" onclick="javascript:history.back()">重置</button>
        </div>
        <div align="center">
            <font id="error" color="red">${error }</font>
        </div>
    </div>
</form>
</body>
</html>
