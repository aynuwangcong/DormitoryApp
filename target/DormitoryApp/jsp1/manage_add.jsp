<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    function checkForm(){
        var manage_id=document.getElementById("manage_id").value;
        var manage_name=document.getElementById("manage_name").value;
        var manage_age=document.getElementById("manage_age").value;
        var manage_sex=document.getElementById("manage_sex").value;
        var apartment=document.getElementById("apartment").value;
        var nature=document.getElementById("nature").value;
        var telphone=document.getElementById("telphone").value;
        if(manage_id==""||manage_name==""||manage_age==""||manage_sex==""||apartment==""||nature==""||telphone==""){
            document.getElementById("error").innerHTML="信息填写不完整！";
            return false;
        }
        return true;
    }

</script>
<div class="data_list">
    <div class="data_list_title">
        <c:choose>
            <c:when test="${student.student_id!=null }">
                修改管理员
            </c:when>
            <c:otherwise>
                添加管理员
            </c:otherwise>
        </c:choose>
    </div>
    <form action="${pageContext.request.contextPath}/manage/add?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="manage" name="method" value="${manage.id}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>工号：</td>
                    <td><input type="text" id="manage_id"  name="manage_id" value="${manage.manage_id}"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>姓名：</td>
                    <td><input type="text" id="manage_name"  name="manage_name" value="${manage.manage_name }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>年龄：</td>
                    <td><input type="text" id="manage_age"  name="manage_age" value="${manage.manage_age }" style="margin-top:5px;height:30px;" /></td>
                </tr>

                <tr>
                    <td><font color="red">*</font>性别：</td>
                    <td>
                        <select id="manage_sex" name="manage_sex" value="${manage.manage_sex }" style="width: 90px;">
                            <option>${manage.manage_sex }</option>
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><font color="red">*</font>宿舍楼：</td>
                    <td>
                        <select id="apartment" name="apartment" value="${manage.apartment }" style="width: 130px;">
                            <option>${manage.apartment }</option>
                            <option>南苑1号楼</option>
                            <option>南苑2号楼</option>
                            <option>南苑3号楼</option>
                            <option>北苑4号楼</option>
                            <option>北苑5号楼</option>
                            <option>北苑6号楼</option>
                            <option>竹苑1号楼</option>
                            <option>竹苑2号楼</option>
                            <option>竹苑3号楼</option>
                            <option>菊苑4号楼</option>
                            <option>菊苑5号楼</option>
                            <option>菊苑6号楼</option>
                            <option>兰苑1号楼</option>
                            <option>兰苑2号楼</option>
                            <option>兰苑3号楼</option>
                            <option>梅苑4号楼</option>
                            <option>梅苑5号楼</option>
                            <option>梅苑6号楼</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><font color="red">*</font>宿舍类别：</td>
                    <td><input type="text" id="nature"  name="nature" value="${manage.nature }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>电话：</td>
                    <td><input type="text" id="telphone" name="telphone" value="${manage.telphone }" style="margin-top:5px;height:30px;" /></td>
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