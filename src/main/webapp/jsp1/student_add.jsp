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
        <c:choose>
            <c:when test="${student.student_id!=null }">
                修改学生
            </c:when>
            <c:otherwise>
                添加学生
            </c:otherwise>
        </c:choose>
    </div>
    <form action="${pageContext.request.contextPath}/student/add?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="student" name="method" value="${student.id}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>学号：</td>
                    <td><input type="text" id="student_id"  name="student_id" value="${student.student_id}"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>姓名：</td>
                    <td><input type="text" id="student_name"  name="student_name" value="${student.student_name }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>年龄：</td>
                    <td><input type="text" id="student_age"  name="student_age" value="${student.student_age }" style="margin-top:5px;height:30px;" /></td>
                </tr>

                <tr>
                    <td><font color="red">*</font>性别：</td>
                    <td>
                        <select id="student_sex" name="student_sex" value="${student.student_sex }" style="width: 90px;">
                            <option>${student.student_sex }</option>
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><font color="red">*</font>宿舍楼：</td>
                    <td>
                        <select id="apartment" name="apartment" value="${student.apartment }" style="width: 130px;">
                            <option>${student.apartment }</option>
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
                    <td><font color="red">*</font>寝室：</td>
                    <td><input type="text" id="dormitory"  name="dormitory" value="${student.dormitory }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>电话：</td>
                    <td><input type="text" id="telphone" name="telphone" value="${student.telphone }" style="margin-top:5px;height:30px;" /></td>
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