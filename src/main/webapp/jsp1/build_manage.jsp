<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
    function dormManagerDelete(manage_id) {
        if(confirm("您确定要移除这个宿管吗？")) {
            window.location="${pageContext.request.contextPath}/manage/removeApartment_id?manage_id="+manage_id+"&&apartment_id="+${apartment_id};
        }
    }

</script>
<div class="data_list">
    <div class="data_list_title">
        楼栋管理员管理
    </div>
    <button style="padding-bottom: 0;margin-bottom: 0;float: left" class="btn btn-success" type="button" style="margin-right: 50px;"  onclick="javascript:history.back()">返回</button>

    <form class="form-search" action="${pageContext.request.contextPath}/manage/addmanage?apartment_id=${apartment_id}" method="post" style="float: right" >
        <table class="data_search" style="float: right">
            <select id="searchType" name="searchType" style="width: 80px;" onchange="this">
                <c:forEach  varStatus="i" var="c" items="${contactorList6}">
                <option>${c.manage_name}</option>
                </c:forEach>
            </select>

            &nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">添加</button>
        </table>
    </form>
    <div>
        <table class="table table-hover table-striped table-bordered">
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>宿舍楼</th>
                <th>宿舍类别</th>
                <th>联系电话</th>
                <th>操作</th>
            </tr>
            <c:forEach  varStatus="i" var="c" items="${contactorList2}">
                <tr>
                    <td>${c.manage_id}</td>
                    <td>${c.manage_name}</td>
                    <td>${c.manage_age}</td>
                    <td>${c.manage_sex}</td>
                    <td>${c.apartment}</td>
                    <td>${c.nature}</td>
                    <td>${c.telphone}</td>
                    <td>
                        <button class="btn btn-mini btn-danger" type="button" onclick="dormManagerDelete(${c.manage_id})">移除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="pagination pagination-centered">

    </div>
</div>