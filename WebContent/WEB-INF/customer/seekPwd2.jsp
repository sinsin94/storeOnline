<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>网络在线考试</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	

	if(form.pwd.value.length<6 || form.pwd.value.length>20){
		alert("您输入的密码不合法，密码必须大于6位，并且小于等20位!");
		form.pwd.focus();
		return false;
	}
	
}
</script>
<body>
	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="131" background="${pageContext.request.contextPath }/images/m_top.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="474" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="word_grey">&nbsp;
									<img src="${pageContext.request.contextPath }/images/f_ico.gif"
										width="8" height="8"> 当前位置：→ <span class="word_darkGrey">找回密码
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5"
										height="9">&nbsp;
										<a href="${pageContext.request.contextPath }/index.jsp">返回首页</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="257" align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table> 
							<s:form  action="FrontCustomerAction_getpwd.do?step=4" namespace="/customer" method="post" onsubmit="return checkForm(this)">
								<table width="57%" height="69" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="17%">
											<img src="${pageContext.request.contextPath }/images/step3.gif" width="73" height="30">
										</td>
										<td width="83%" class="word_orange1"><span
											style="padding:5px;">输入重新设置密码</span>
										</td>
									</tr>
								</table>
									<input type="hidden" name="customerId" value="<s:property  value="customerId" />" >
								<table width="57%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr align="center">
										<td width="22%" height="30" align="left" style="padding:5px;">新密码：</td>
										<td width="78%" align="left">
											<input type="password" name="pwd" size="40" /> 
											<span class="word_orange1"> *</span>
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="下一步" />&nbsp; 
											<input type="reset" class="btn_grey" value="取消" /> &nbsp;
										</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
					<tr>
						<td height="141" align="right" valign="top"><img
							src="${pageContext.request.contextPath }/images/seedPwd.gif" width="139" height="153">
						</td>
					</tr>
				</table></td>
		</tr>
	</table>

</body>
</html>
