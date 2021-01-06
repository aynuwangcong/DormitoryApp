<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
    function dormManagerDelete(student_id) {
        if(confirm("您确定要删除这个记录吗？")) {
            window.location="${pageContext.request.contextPath}/absence/delete?student_id="+student_id+"&&pageStartIndex="+${pageStartIndex};
        }
    }
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
        }
    }
</script>
<div class="data_list">
    <div class="data_list_title">
        学生缺勤补假
    </div>

    <form class="form-search" action="${pageContext.request.contextPath}/absence/compoundabsence?pageStartIndex=${pageStartIndex}&&pagenum=${page.pagenum}" method="post" style="float: right" onsubmit="return checkForm()">
        <span> 指定日期:</span>
        <span class="controls input-append date form_date" style="margin-right: 10px" data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd" >
                <input type="date" id="date" name="time" style="width:145px;height: 30px;" placeholder="日期"  value="${absence1.time }" >
                <span class="add-on"><button id="btn">清空</button></span>
                <span class="add-on"><i class="icon-th"></i></span>
            </span>
        <script>
            var date = document.getElementById('date');
            var btn = document.getElementById('btn');
            var flag=true;
            btn.onclick = function () {
                date.value = "";
                flag=false;
            }
            function checkForm() {
                if(flag===false){
                    flag=true;
                    return false;
                }
            }
        </script>
        <table class="data_search" style="float: right">
            <select id="searchType" name="searchType" style="width: 140px;" onchange="this">
                <option>查询所有楼栋</option>
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

            <span> 学号:</span>
            &nbsp;<input name="student_id" type="text" value="${absence1.student_id}" style="width:120px;height: 30px;" class="input-medium search-query" >
            <span> 姓名:</span>
            &nbsp;<input name="student_name" type="text" value="${absence1.student_name}" style="width:120px;height: 30px;" class="input-medium search-query" >
            &nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
        </table>
    </form>
    <div>
        <table class="table table-hover table-striped table-bordered">
            <tr>
                <th>缺勤日期</th>
                <th>学号</th>
                <th>姓名</th>
                <th>宿舍楼</th>
                <th>寝室</th>
                <th>是否请假</th>
                <th>缺勤原因</th>
                <th>操作</th>
            </tr>
            <c:forEach  varStatus="i" var="c" items="${contactorList3}">
                <tr>
                    <td>${c.time}</td>
                    <td>${c.student_id}</td>
                    <td>${c.student_name}</td>
                    <td>${c.apartment_name}</td>
                    <td>${c.dormitory}</td>
                    <td>${c.leave_if}</td>
                    <td>${c.cause}</td>
                    <td><button style="padding-bottom: 0;margin-bottom: 0;float: left" class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='${pageContext.request.contextPath}/absence/preAdd1?student_id=${c.student_id}&&pageStartIndex=${pageStartIndex}'">补假说明</button>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="pagination pagination-centered">
        <ul style="margin-left: 180px;" class="pagination pagination-lg">
            <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=1">首页</a></li>
            <c:choose>
                <c:when test="${page.pagenum== 1 }">
                    <li><a href="#">上一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=${page.pagenum-1}">上一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=1">1</a></li>
            <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=2">2</a></li>
            <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=3">3</a></li>

            <c:choose>
                <c:when test="${page.pagenum>=page.totalPages}">
                    <li><a href="#">下一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=${page.pagenum+1}">下一页</a></li>
                </c:otherwise>
            </c:choose>

            <li><a href="${pageContext.request.contextPath}/absence/redo?pagenum=${page.totalPages}">尾页</a></li>
            <li style="margin-left: 50px;"><a href="#" style="color: #0e90d2">当前页 ${page.pagenum}</a></li>
            <li><a href="#">总页数 ${page.totalPages}</a></li>
        </ul>
        <form class="form-search" action="${pageContext.request.contextPath}/absence/redo" method="post" style="float: right" onsubmit="return pageNumCheck()">
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