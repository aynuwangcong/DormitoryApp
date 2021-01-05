<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    function checkForm(){
        var oldPassword=document.getElementById("oldPassword").value;
        var newPassword=document.getElementById("newPassword").value;
        var rPassword=document.getElementById("rPassword").value;
        if(oldPassword==""||newPassword==""||rPassword==""){
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
<style>
    #cc{
        text-align: center;
        margin-top: 20px;
        padding-left: 62px;
    }
    #data_form{
        /*margin: 0 300px;*/
        /*margin-top: 200px;*/
        <%--background-image: url('${pageContext.request.contextPath}/images/bg.jpg') no-repeat;--%>
    }
</style>
<div id="data_form" class="data_list">
    <div style="text-align: center" class="data_list_title">
        <h1>用户修改密码</h1>
    </div>
    <form action="${pageContext.request.contextPath}/login/update" method="post" onsubmit="return checkForm()">
        <div align="center" class="data_form" >
            <table align="center">
                <tr>
                    <td><font color="red">*</font>原密码：</td>
                    <td><input type="password" id="oldPassword"  name="oldPassword" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>新密码：</td>
                    <td><input type="password" id="newPassword"  name="newPassword"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>重复密码：</td>
                    <td><input type="password" id="rPassword"  name="rPassword"  style="margin-top:5px;height:30px;" /></td>
                </tr>
            </table>
            <div id="cc"  align="center">
                <input type="submit" class="btn btn-primary" value="提交"/>  &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-primary" type="reset" onclick="javascript:history.back()">返回</button>
            </div>

        </div>
    </form>
</div>