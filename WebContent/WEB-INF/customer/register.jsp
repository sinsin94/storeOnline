
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>网络在线考试</title>
	
	 <link type="text/css" href="${pageContext.request.contextPath }/css/register.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js" charset="UTF-8"></script>

</head>
<script type="text/javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("请输入登录名字!");form.name.focus();return false;
	}

	if(form.pwd.value==""){
		alert("请输入登录密码!");form.pwd.focus();return false;
	}
	if(form.pwd.value.length<6 || form.pwd.value.length>20){
		alert("您输入的密码不合法，密码必须大于6位，并且小于等20位!");form.pwd.focus();return false;
	}
	if(form.confimpwd.value==""){
		alert("请确认登录密码!");form.confimpwd.focus();return false;
	}		
	if(form.pwd.value!=form.confimpwd.value){
		alert("您两次输入的登录密码不一致，请重新输入!");form.pwd.focus();return false;
	}
	if(form.question.value==""){
		alert("请输入密保问题！");form.cardNo.focus();return false;
	}
	if(form.answer.value==""){
		alert("请输入密保答案！");form.cardNo.focus();return false;
	}

	if(form.cardNo.value==""){
		alert("请输入身份证号！");form.cardNo.focus();return false;
	}
	if(form.cardNo.value.length!=18){
		alert("请输入合法的身份证号，必须为18位数！");form.cardNo.focus();return false;
	}
	if(!isCardNo(form.cardNo.value))
	{
		alert("请输入合法的身份证号!");
		return false;
	}
	var str=form.cardNo.value;
	for(var i=0;i<str.length-1;i++)
	{
	   if(isNaN(str[i]))
	   {
		   
		   alert("请输入合法的身份证号!");
		   form.cardNo.focus();
		   return false;
	   }
	   
	}
	var str1=str[17];
	if(str1>='0' && str1<='9' || str1=='X')
	{
		return true;
	}
	 alert("请输入合法的身份证号!");
	   form.cardNo.focus();
	return false;
	
}
</script>
<body>
 <div class="top1">happing-购</div>
  <div class="register_name">用户注册</div>  
   <div style="color:red;width:170px;height:36px;position:fixed;left: 59%;top: 49%;margin:-137px 0 0 -108px ;">
  		    <span>    
				<s:actionerror/>
  				
	 		</span>
    </div> 
     <div class="inputBox">
     <s:form action="FrontCustomerAction_register.do"  namespace="/customer" method="post" onsubmit="return checkForm(this)">
        <p>
            <span>用户名</span>
            <input name="name" value="<s:property  value="name" />" type="text"  placeholder="请输入用户名">
        </p>
        <div id="error" style="display:none">
            <s:actionerror/>
       </div>
      
        <p>
            <span>密码</span>
            <input name="pwd" type="password" value="<s:property  value="name" />"   placeholder="请输入密码">
        </p>
         <p>
            <span>确认密码</span>
            <input id="confimpwd" size="20" type="password" value="<s:property  value="pwd" />" placeholder="请确认 密码">
         </p>
         <p>
            <span >手机号码</span>
            <input name="phone" size="40" type="text" value="<s:property  value="phone" />" placeholder="请输入手机号码">
         </p>
         <p>
            <span >提示问题</span>
            <input name="question" size="40" type="text" value="<s:property  value="question" />" placeholder="请输入密保问题">
         </p>
         <p>
            <span >问题答案</span>
            <input name="answer" size="40" type="text" value="<s:property  value="answer" />" placeholder="请输入密保答案">
         </p>
         <p>
            <span>验证码</span>
            <input type="text" class="rgst-code vali_phone" placeholder="输入验证码">
            <b id="checkCode" style="background-color:#b5b5b5">Bmzk</b>
            <a class='change_code' href='javascript:void(0);'>看不清？换一张</a>
         </p>
        <p>
            <span >身份证号码</span>
            <input name="cardNo" size="40" type="text" value="<s:property  value="cardNo" />" placeholder="输入身份证号码">
        </p>

        
        <div class="login_certain">
        <input class="register" type="submit" class="btn_grey" value="保存" />&nbsp;
        </div >
        <p style="padding-left:210px">已有账号,<a href="login.html">登录</a>&nbsp; <a href='index.html'>逛一逛</a></p>
         </s:form>
    </div>
 
</body>
</html>
