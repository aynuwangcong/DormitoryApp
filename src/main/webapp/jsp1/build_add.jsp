<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
    function checkForm(){
        var apartment_id=document.getElementById("apartment_id").value;
        var apartment_name=document.getElementById("apartment_name").value;
        var apartment_nature=document.getElementById("apartment_nature").value;
        var apartment_location=document.getElementById("apartment_location").value;
        var apartment_remark=document.getElementById("apartment_remark").value;
        if(apartment_id==""||apartment_name==""||apartment_nature==""||apartment_location==""||apartment_remark==""){
            document.getElementById("error").innerHTML="信息填写不完整！";
            return false;
        }
        return true;
    }

</script>
<div class="data_list">
    <div class="data_list_title">
        <c:choose>
            <c:when test="${build.apartment_id!=null }">
                修改宿舍楼
            </c:when>
            <c:otherwise>
                添加宿舍楼
            </c:otherwise>
        </c:choose>
    </div>
    <form action="${pageContext.request.contextPath}/build/add?pageStartIndex=${pageStartIndex}" method="post" onsubmit="return checkForm()">
        <div class="data_form"  align="center">
            <input type="hidden" id="build" name="method" value="${build.apartment_id}"/>
            <table align="center">
                <tr>
                    <td><font color="red">*</font>楼栋号：</td>
                    <td><input type="text" id="apartment_id"  name="apartment_id" value="${build.apartment_id}"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>楼栋名：</td>
                    <td><input type="text" id="apartment_name"  name="apartment_name" value="${build.apartment_name }"  style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>宿舍楼位置：</td>
                    <td><input type="text" id="apartment_location"  name="apartment_location" value="${build.apartment_location }" style="margin-top:5px;height:30px;" /></td>
                </tr>

                <tr>
                    <td><font color="red">*</font>宿舍类别：</td>
                    <td><input type="text" id="apartment_nature"  name="apartment_nature" value="${build.apartment_nature }" style="margin-top:5px;height:30px;" /></td>
                </tr>
                <tr>
                    <td><font color="red">*</font>楼栋描述：</td>
<%--                    <td><input type="text" id="apartment_remark" name="apartment_remark" value="${build.apartment_remark}" style="margin-top:5px;height:150px;padding: 0;" /></td>--%>
                    <td><textarea id="apartment_remark" name="apartment_remark" rows="10" value="${build.apartment_remark}">${build.apartment_remark}</textarea></td>
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