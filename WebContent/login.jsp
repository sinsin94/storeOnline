<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
	<title>�������߿��ԡ�����̨��¼</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	  <link type="text/css" href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet">
	<script type="text/javascript">
		function check(form){
			if (form.userName.value==""){
				alert("���������Ա����!");
				form.userName.focus();
				return false;
			}
			if (form.password.value==""){
				alert("����������!");
				form.password.focus();
				return false;
			}	
		}
	</script>


<script language="javascript">
	
	function window_close() {
		if (confirm("��ȷ��Ҫ�رձ�ҳ��")) {
			window.opener = null;
			window.open('', '_self');
			window.close();
		} else {
		}
	}
</script>
</head>
<body>

   <div class="top1">happing-��</div>
	<!--    ������Ϣ -->
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
				<div class="infor">����Ա��¼</div>
				<div class="field username-field">
				   <input name="userName" type="text" class="name_text" placeholder="���������Ա����">
				</div>
				<div class="field password-field">
				 	<input name="password" type="password" class="password_text" placeholder="���������Ա����">
				</div>
				<div class="login_certain">
				 	<input value="��¼" type="submit"/> 
				</div>
				<div class="field1 lable">
				<a href="${pageContext.request.contextPath }/index.jsp" class="word_orange">����</a>
				
				</div>
				
			</form> 

	   </table>
	  </div>
	</div>

</body>
</html>
