<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    function checkForm(){
        var student_id=document.getElementById("student_id").value;
        var student_name=document.getElementById("student_name").value;
        var apartment_name=document.getElementById("apartment_name").value;
        var time=document.getElementById("time").value;
        var leave_if=document.getElementById("leave_if").value;
        var dormitory=document.getElementById("dormitory").value;
        var cause=document.getElementById("cause").value;

        if(student_id==""||student_name==""||time==""||leave_if==""||apartment_name==""||dormitory==""||cause==""){
            document.getElementById("error").innerHTML="信息填写不完整！";
            return false;
        }
        return true;
    }

</script>
<div class="data_list">
    <div class="data_list_title">
        <c:choose>
            <c:when test="${absence.student_id!=null }">
                修改记录
            </c:when>
            <c:otherwise>
                添加记录
            </c:otherwise>
        </c:choose>
    </div>
    <form action="${pageContext.request.contextPath}/absence/add?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="absence" name="method" value="${absence.student_id}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>日期：</td>
                    <td>
                        <span class="controls input-append date form_date" style="margin-right: 10px" data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd" >
                        <input type="date" id="time"  name="time" value="${absence.time}"  style="margin-top:5px;height:30px;" placeholder="日期" />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td><font color="red">*</font>学号：</td>
                    <td><input type="text" id="student_id"  name="student_id" value="${absence.student_id }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>姓名：</td>
                    <td><input type="text" id="student_name"  name="student_name" value="${absence.student_name }" style="margin-top:5px;height:30px;" /></td>
                </tr>

                <tr>
                    <td><font color="red">*</font>宿舍楼：</td>
                    <td>
                        <select id="apartment_name" name="apartment_name" value="${absence.apartment_name }" style="width: 130px;">
                            <option>${absence.apartment_name }</option>
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
                    <td><input type="text" id="dormitory"  name="dormitory" value="${absence.dormitory }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>是否请假：</td>
                    <td><input type="text" id="leave_if" name="leave_if" value="${absence.leave_if }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>缺勤原因：</td>
                    <td><input type="text" id="cause" name="cause" value="${absence.cause }" style="margin-top:5px;height:30px;" /></td>
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