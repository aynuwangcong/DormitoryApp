<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">

function pageNumCheck() {
    var inputPages1 = $("#pagenum1").val();
    var totalPages1 = $("#totalPages").val();

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
        return true;
    }
}
</script>
<div class="data_list">
    <div class="data_list_title">
        用户权限管理
    </div>

    <form class="form-search" action="${pageContext.request.contextPath}/login/compound?pageStartIndex=${pageStartIndex}&&pagenum=${page.pagenum}" method="post" style="float: right" >
        <table class="data_search" style="float: right">

            <span> 用户名:</span>
            &nbsp;<input name="username" type="text" value="${user1.username}" style="width:120px;height: 30px;" class="input-medium search-query" >

            &nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
        </table>
    </form>
    <div>
        <table class="table table-hover table-striped table-bordered">
            <tr>
                <th>用户名</th>
                <th>姓名</th>
                <th>用户类型</th>
                <th>权限更改</th>
                <th>删除用户</th>
            </tr>
            <c:forEach  varStatus="i" var="c" items="${contactorList}">
                <tr>
                    <td>${c.username}</td>
                    <td>${c.name}</td>
                    <td>${c.flag}</td>

                    <td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='${pageContext.request.contextPath}/login/preAdd?username=${c.username}&&pageStartIndex=${pageStartIndex}'">更改权限</button>&nbsp;

                    </td>
                   <td><button class="btn btn-mini btn-danger" type="button" onsubmit="return checkForm()" onclick="javascript:window.location='${pageContext.request.contextPath}/login/delete?username=${c.username}&&pageStartIndex=${pageStartIndex}'">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script>
        function checkForm() {
            var flag=false;
            if(flag===false){
                alert("确定要删除吗");
                return false;
            }
        }
    </script>
    <div class="pagination pagination-centered">
        <ul style="margin-left: 180px;" class="pagination pagination-lg">
            <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=1">首页</a></li>
            <c:choose>
                <c:when test="${page.pagenum== 1 }">
                    <li><a href="#">上一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=${page.pagenum-1}">上一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=1">1</a></li>
            <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=2">2</a></li>
            <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=3">3</a></li>

            <c:choose>
                <c:when test="${page.pagenum>=page.totalPages}">
                    <li><a href="#">下一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=${page.pagenum+1}">下一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/login/authority?pagenum=${page.totalPages}">尾页</a></li>
            <li style="margin-left: 50px;"><a href="#" style="color: #0e90d2">当前页 ${page.pagenum}</a></li>
            <li><a href="#">总页数 ${page.totalPages}</a></li>
        </ul>
        <form class="form-search" action="${pageContext.request.contextPath}/login/authority" method="post" style="float: right" onsubmit="return pageNumCheck()">
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