<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
    function dormManagerDelete(manage_id) {
        if(confirm("您确定要删除这个宿管吗？")) {
            window.location="${pageContext.request.contextPath}/manage/delete?manage_id="+manage_id+"&&pageStartIndex="+${pageStartIndex};
        }
    }


    function pageNumCheck() {
        var inputPages1 = $("#pagenum1").val();
        var totalPages1 = $("#totalPages").val();


        // var re = /^-?[0-9]+.?[0-9]*/;
        // var re1 =  /^(-|\+)?\d+$/;
        var re = /^(-)?[1-9][0-9]*$/;
        if(!re.test(inputPages1)){
            alert("请输入合法的数据");
            return false;
        }
        var inputPages =parseInt(inputPages1);
        var totalPages =parseInt(totalPages1);

        if(inputPages<0){
            alert("输入的数据不能为负数");
            return false;
        }
        if(inputPages>totalPages){
            alert("你输入的页码数为"+inputPages+" 超过了最大页码数"+totalPages);
            flag = false;
            return false;
        }
        else{
            alert("是否确认跳转至第"+inputPages+"页");
            flag = true;
        }
    }
</script>

<div class="data_list">
    <div class="data_list_title">
        宿舍管理员管理
    </div>
    <button style="padding-bottom: 0;margin-bottom: 0;float: left" class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='${pageContext.request.contextPath}/manage/preAdd?manage_id=null&&pageStartIndex=${pageStartIndex}'">添加</button>

    <form class="form-search" action="${pageContext.request.contextPath}/manage/compound?pageStartIndex=${pageStartIndex}&&pagenum=${page.pagenum}" method="post" style="float: right" >
        <table class="data_search" style="float: right">
            <select id="searchType" name="searchType" style="width: 80px;" onchange="this">
                <option value="manage_name">姓名</option>
                <option value="apartment">宿舍楼</option>
                <option value="nature">宿舍类别</option>
            </select>
            <input name="Text" type="text" value="${Text}" style="width:120px;height: 30px;" class="input-medium search-query" >

            <span> 工号:</span>
            &nbsp;<input name="manage_id" type="text" value="${manage1.manage_id}" style="width:120px;height: 30px;" class="input-medium search-query" >
            <span> 性别:</span>
            &nbsp;<input name="manage_sex" type="text" value="${manage1.manage_sex}" style="width:120px;height: 30px;" class="input-medium search-query" >
            <span> 年龄:</span>
            &nbsp;<input name="manage_age" type="text" value="${manage1.manage_age}"  style="width:120px;height: 30px;" class="input-medium search-query" >
            &nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
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
            <c:forEach  varStatus="i" var="c" items="${contactorList}">
                <tr>
                    <td>${c.manage_id}</td>
                    <td>${c.manage_name}</td>
                    <td>${c.manage_age}</td>
                    <td>${c.manage_sex}</td>
                    <td>${c.apartment}</td>
                    <td>${c.nature}</td>
                    <td>${c.telphone}</td>
                    <td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='${pageContext.request.contextPath}/manage/preAdd?manage_id=${c.manage_id}&&pageStartIndex=${pageStartIndex}'">修改</button>&nbsp;
                        <button class="btn btn-mini btn-danger" type="button" onclick="dormManagerDelete(${c.manage_id})">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="pagination pagination-centered">
        <ul style="margin-left: 180px;" class="pagination pagination-lg">
            <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=1">首页</a></li>
            <c:choose>
                <c:when test="${page.pagenum== 1 }">
                    <li><a href="#">上一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=${page.pagenum-1}">上一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=1">1</a></li>
            <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=2">2</a></li>
            <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=3">3</a></li>

            <c:choose>
                <c:when test="${page.pagenum>=page.totalPages}">
                    <li><a href="#">下一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=${page.pagenum+1}">下一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/manage/querystudent?pagenum=${page.totalPages}">尾页</a></li>


            <li style="margin-left: 50px;"><a href="#" style="color: #0e90d2">当前页 ${page.pagenum}</a></li>
            <li><a href="#">总页数 ${page.totalPages}</a></li>

        </ul>



        <form class="form-search" action="${pageContext.request.contextPath}/manage/querystudent" method="post" style="float: right" onsubmit="return pageNumCheck()">
            <table width="20" border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;">
                <tr style="width: 200px;">
                    <td>转至</td>
                    <td width="1%"><input style="height: 28px;width: 60px;" name="pagenum1" id="pagenum1" type="text" class="right-textfield" size="1" /></td>
                    <td width="87%">
                        <input type="hidden" value="${page.totalPages}" id="totalPages" name="totalPages"/>
                        <input type="submit" class="btn btn-primary" />
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>