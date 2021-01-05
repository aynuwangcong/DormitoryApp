<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    function checkForm(){
        var student_id=document.getElementById("student_id").value;
        var student_name=document.getElementById("student_name").value;
        var student_age=document.getElementById("student_age").value;
        var student_sex=document.getElementById("student_sex").value;
        var apartment=document.getElementById("apartment").value;
        var dormitory=document.getElementById("dormitory").value;
        var telphone=document.getElementById("telphone").value;
        if(student_id==""||student_name==""||student_age==""||student_sex==""||apartment==""||dormitory==""||telphone==""){
            document.getElementById("error").innerHTML="信息填写不完整！";
            return false;
        }
        return true;
    }

</script>
<div class="data_list">
    <div class="data_list_title">
                修改用户权限
    </div>
    <form action="${pageContext.request.contextPath}/login/add?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="student" name="method" value="${user.username}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>用户名：</td>
                    <td><input type="text" id="username"  name="username" value="${user.username}"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>姓名：</td>
                    <td><input type="text" id="name"  name="name" value="${user.name }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>用户权限：</td>
<%--                    <td><input type="text" id="flag"  name="flag" value="${user.flag }" style="margin-top:5px;height:30px;" /></td>--%>
                <td>    <select id="flag1" name="flag" value="${user.flag}" style="width: 140px;" onchange="this">
<%--                        <option></option>--%>
                        <option>宿舍管理员</option>
                        <option>学生</option>
                       </select>
                   </td>
                </tr>

            </table>
            <div align="center">
                <input type="submit" class="btn btn-primary" value="保存"/>
                &nbsp;<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
            </div>
            <div align="center">
                <font id="error" color="red">${error }</font>
            </div>
        </div>
    </form>
</div>