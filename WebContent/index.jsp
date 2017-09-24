<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <link type="text/css"  href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet">
<head>
	<title>网络购物系统</title>
	
	

	<script type="text/javascript">
		function check(form){
			if (form.stuNo.value==""){
				alert("请输入登录名字!");
				form.stuNo.focus();
				return false;
			}
			if (form.pwd.value==""){
				alert("请输入密码!");
				form.pwd.focus();
				return false;
			}
		}
		</script>
</head>
<body>

   <div class="top1">happing-购</div>
	<!--    错误信息 -->
   <div style="color:red;width:170px;height:36px;position:fixed;left: 74%;top: 55%;margin:-137px 0 0 -108px ;">
  		    <span>    
				<s:actionerror/>
  				
	 		</span>
    </div> 
    
   <div class="login customer">
        <div style="height:85px"></div>
		<div class="login_botton">
		<table class="login_table"> 
		
		
			<form action="${pageContext.request.contextPath }/LoginAction_customer.do" method="post"  onsubmit="return check(this)">
				<div class="infor">密码登录</div>
				<div class="field username-field">
				   <input name="name" type="text" class="name_text" placeholder="请输入登录名">
				</div>
				<div class="field password-field">
				 	<input name="pwd" type="password" class="password_text" placeholder="请输入登录密码">
				</div>
				<div class="login_certain">
				 	<input value="登录" type="submit"/> 
				</div>
				<div class="field1 lable">
				<a href="${pageContext.request.contextPath }/login.jsp" class="word_orange">进入后台</a>
				<a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_getpwd.do?step=1" class="word_orange">忘记密码</a>
				<a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_register.do" class="word_orange">免费注册</a>	
				</div>
				
			</form> 

	   </table>
	  </div>
	</div>

</body>
</html>
