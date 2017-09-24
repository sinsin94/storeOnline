<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
	<title>网络在线考试——后台登录</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	  <link type="text/css" href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet">
	<script type="text/javascript">
		function check(form){
			if (form.userName.value==""){
				alert("请输入管理员名称!");
				form.userName.focus();
				return false;
			}
			if (form.password.value==""){
				alert("请输入密码!");
				form.password.focus();
				return false;
			}	
		}
	</script>


<script language="javascript">
	
	function window_close() {
		if (confirm("您确定要关闭本页吗？")) {
			window.opener = null;
			window.open('', '_self');
			window.close();
		} else {
		}
	}
</script>
</head>
<body>

   <div class="top1">happing-购</div>
	<!--    错误信息 -->
<%--    <div style="color:red;width:170px;height:36px;position:fixed;left:50%;top:50%;margin:-137px 0 0 -108px ;">
  		    <span>    
				<s:actionerror/>
  				
	 		</span>
    </div> --%>
    
   <div class="login admin">
        <div style="height:85px"></div>
		<div class="login_botton">
		<table class="login_table"> 
		
		
			<form action="${pageContext.request.contextPath }/LoginAction_admin.do" method="post"  onsubmit="return check(this)">
				<div class="infor">管理员登录</div>
				<div class="field username-field">
				   <input name="userName" type="text" class="name_text" placeholder="请输入管理员名称">
				</div>
				<div class="field password-field">
				 	<input name="password" type="password" class="password_text" placeholder="请输入管理员密码">
				</div>
				<div class="login_certain">
				 	<input value="登录" type="submit"/> 
				</div>
				<div class="field1 lable">
				<a href="${pageContext.request.contextPath }/index.jsp" class="word_orange">返回</a>
				
				</div>
				
			</form> 

	   </table>
	  </div>
	</div>

</body>
</html>
