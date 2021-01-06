<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    function checkForm(){
        var username=document.getElementById("username").value;
        var password=document.getElementById("password").value;


        if(username==""||password==""){
            document.getElementById("error").innerHTML="你还没有输入账号和密码！";
            return false;
        }
        return true;
    }

</script>
<html>
<style type="text/css">
    body {
        padding-top: 200px;
        padding-bottom: 40px;
        /*background-image: url('https://s3.jpg.cm/2020/12/14/FF4vk.jpg');*/
        background-image: url('${pageContext.request.contextPath}/images/bg.jpg');
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }
    .form-signin-heading{
        text-align: center;
    }
    .form-signin {
        max-width: 300px;
        padding: 19px 29px 0px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        box-shadow: 0 1px 2px rgba(0,0,0,.05);

    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
    }
    .form-signin{
        padding-bottom: 15px;
    }
    .input{
        text-align: center;
    }
    .login{
        text-align: center;
        margin-top: 15px;
    }
    .btn-primary {
        color: #ffffff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        background-color: #006dcc;
        *background-color: #0044cc;
        background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
        background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
        background-image: -o-linear-gradient(top, #0088cc, #0044cc);
        background-image: linear-gradient(to bottom, #0088cc, #0044cc);
        background-repeat: repeat-x;
        border-color: #0044cc #0044cc #002a80;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
    }
    .btn-large {
        padding: 11px 19px;
        font-size: 17.5px;
        -webkit-border-radius: 6px;
        -moz-border-radius: 6px;
        border-radius: 6px;
    }
    .lost{
        padding-top: 10px;
    }
    a{
        text-decoration: none;
    }
</style>
<body>

<div align="center">
    <font color="red">${msg}</font>
</div>
<div class="container">
    <form  class="form-signin" action="${pageContext.request.contextPath}/login/first" method="post" onsubmit="return checkForm()">
        <h2 class="form-signin-heading"><font color="gray">校园宿舍管理系统</font></h2>
        <div class="input">
        <input id="username"  name="username" type="text" class="input-block-level" placeholder="用户名...">
        <input id="password" name="password" type="password" class="input-block-level" placeholder="密码..." ><br>
        </div>


        <label class="radio inline">
            <input id="admin" type="radio" name="flag" value="系统管理员"  checked/> 系统管理员
        </label>
        <label class="radio inline">
            <input id="dormManager" type="radio" name="flag" value="宿舍管理员" ${userType==2?'checked':''} /> 宿舍管理员
        </label>
        <label class="radio inline">
            <input id="student" type="radio" name="flag" value="学生"  ${userType==3?'checked':''}/> 学生
        </label>


        <div class="login">
        <button class="btn btn-large btn-primary"  type="submit">登录</button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-large btn-primary" type="reset" >重置</button>
        </div>
        <div class="lost">
            <button style="float: left;"  class="btn"  type="submit">忘记密码</button>
        &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
        <a style="float: right;" class="btn " href="<c:url value='/jsp2/register.jsp'/>" target="body" id="z" >注册</a> </div>
    </form>
   </div>

<div align="center">
    <font id="error" color="red">${error1}</font>
    <font id="error2" color="red">${error2}</font>
</div>
</body>
</html>
