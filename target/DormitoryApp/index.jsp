<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    function checkForm(){
        var username=document.getElementById("username").value;
        var password=document.getElementById("password").value;

        if(username==""&&password==""){
            document.getElementById("error3").innerHTML="你还没有输入账号和密码！";
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
        background-image: url('https://s3.jpg.cm/2021/01/07/p99Sy.jpg');
        <%--background-image: url('${pageContext.request.contextPath}/images/1.jpg');--%>
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
        /*background-color: #fff;*/
        background-color:rgba(229,229,229,0.4);
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
    .xin{
    color: #3863FF;
    }
    .text{
        background-image: -webkit-linear-gradient(left,blue,#66ffff 10%,#cc00ff 20%,#CC00CC 30%, #CCCCFF 40%, #00FFFF 50%,#CCCCFF 60%,#CC00CC 70%,#CC00FF 80%,#66FFFF 90%,blue 100%);
        -webkit-text-fill-color: transparent;/* 将字体设置成透明色 */
        -webkit-background-clip: text;/* 裁剪背景图，使文字作为裁剪区域向外裁剪 */
        -webkit-background-size: 200% 100%;
        -webkit-animation: masked-animation 4s linear infinite;
    }
   .ds{
        width: 240px;
        height: 100px;
        background-color:rgba(229,229,229,0.1);
        float: left;
        position: relative;
        top: -200px;
        left:0;
    }
    .ds #p2{
        font-size: 15px;
        background-color:rgba(229,229,229,0.0);
        text-align: center;
        color: #bd362f;
        padding-bottom: 10px;
    }
     .ds div{
        width: 46px;
        height: 46px;
        text-align: center;
        line-height: 46px;
         background-color:rgba(229,229,229,0.0);
        float: left;
    }
     .ds #mm,.ds #mm1,.ds #mm2{
        width: 15px;
        height: 46px;
         background-color:rgba(229,229,229,0.0);
        line-height: 46px;
        font-size: 20px;
        text-align: center;
    }
     .ds #d{
     margin-left: 10px;
    }
    .ji{
        position: relative;
        top: 0;
        left: -240px;
    }
</style>
<body>
<div class="ds">
    <p id="p2">距离除夕开始还有</p>
    <div id="d"></div>

    <div id="mm2">:</div>
    <div id="h"></div>

    <div id="mm">:</div>

    <div id="m"></div>

    <div id="mm1">:</div>

    <div id="s"></div>
</div>
<div class="ji" style="float: left;margin-left: 100px;margin-top: 50px;">
    <div class="xin">
        新的一年<br>
        你都有什么愿望呢<br>
        快来查看去年的你有多少次缺勤记录吧<br>
    </div>
    <div class="text">
        <p>
            希望你想陪伴的人此刻正伴你左右<br><br>
            愿四海之内皆平安<br><br>
            ......<br>
        </p>
    </div>
</div>
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
            <input id="admin" type="radio" name="flag" value="系统管理员" checked /> 系统管理员
        </label>
        <label class="radio inline">
            <input id="dormManager" type="radio" name="flag" value="宿舍管理员" /> 宿舍管理员
        </label>
        <label class="radio inline">
            <input id="student" type="radio" name="flag" value="学生"  /> 学生
        </label>


        <div class="login">
        <button class="btn btn-large btn-primary"  type="submit">登录</button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-large btn-primary" type="reset" >重置</button>
        </div>
        <div class="lost">
<%--            <form  class="form-signin" action="${pageContext.request.contextPath}/login/forget" method="post" >--%>
                <button style="float: left;"  class="btn"  type="submit">忘记密码</button>
<%--            </form>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
            <a style="float: right;" class="btn " href="<c:url value='/jsp2/register.jsp'/>" target="body" id="z" >注册</a>
         </div>
    </form>

   </div>

<div align="center">
    <font id="error" color="red">${error1}</font>
    <font id="error2" color="red">${error2}</font>
    <font id="error3" color="red"></font>
</div>
<script type="text/javascript">
    var endTime= new Date('2021-02-11 00:00:00'),endSeconds=endTime.getTime();
    var d=h=m=s=0;
    var id=setInterval(seckill,1000);
    function seckill(){
    var nowTime=new Date();
    remaining=parseInt((endSeconds-nowTime.getTime())/1000);
    if(remaining>0){
    d=parseInt(remaining/86400);
    h=parseInt((remaining/3600)%24);
    m=parseInt((remaining/60)%60);
    s=parseInt(remaining%60);

    d=d<10?'0'+d:d;
    h=h<10?'0'+h:h;
    m=m<10?'0'+m:m;
    s=s<10?'0'+s:s;
    }
    else{
    clearInterval(id);
    d=h=m=s='00';

    }
    document.getElementById('d').innerHTML=d+'天';
    document.getElementById('h').innerHTML=h+'时';
    document.getElementById('m').innerHTML=m+'分';
    document.getElementById('s').innerHTML=s+'秒';
    }
   </script>
</body>
</html>
