<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    // function checkForm(){
    //     var student_id=document.getElementById("student_id").value;
    //     var student_name=document.getElementById("student_name").value;
    //     var apartment_name=document.getElementById("apartment_name").value;
    //     var time=document.getElementById("time").value;
    //     var leave_if=document.getElementById("leave_if").value;
    //     var dormitory=document.getElementById("dormitory").value;
    //     var cause=document.getElementById("cause").value;
    //
    //     var data = document.getElementById("time").value;
    //     //返回为false则是日期格式;isNaN(data)排除data为纯数字的情况（此处不考虑只有年份的日期，如‘2018’）
    //     if(!isNaN(Date.parse(data))){
    //         alert("请按照日期格式填写哦！例：20201212");
    //         // document.getElementById("error").innerHTML="请按照日期格式填写哦！例：2020-12-12";
    //         return false;
    //     }
    //
    //     if(student_id==""||student_name==""||time==""||leave_if==""||apartment_name==""||dormitory==""||cause==""){
    //         document.getElementById("error").innerHTML="信息填写不完整！";
    //         return false;
    //     }
    //     return true;
    // }

</script>
<div class="data_list">
    <div class="data_list_title">
        缺勤补假说明
    </div>
    <form action="${pageContext.request.contextPath}/absence/add1?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="absence" name="method" value="${absence.student_id}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>学号：</td>
                    <td><input type="text" id="student_id"  name="student_id" value="${absence.student_id }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>姓名：</td>
                    <td><input type="text" id="student_name"  name="student_name" value="${absence.student_name }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>寝室：</td>
                    <td><input type="text" id="dormitory"  name="dormitory" value="${absence.dormitory }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>缺勤原因说明：</td>
<%--                    <td><input type="text" id="cause" name="cause" value="${absence.leave_if }" style="margin-top:5px;height:30px;" /></td>--%>
                    <td><textarea id="cause" name="cause" rows="10" value="${absence.cause }"></textarea></td>
                </tr>
            </table>
            <div align="center">
                <input type="submit" class="btn btn-primary" value="提交"/>
                &nbsp;<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
            </div>
            <div align="center">
<%--                <font id="error" color="red">${error }</font>--%>
            </div>
        </div>
    </form>
</div>