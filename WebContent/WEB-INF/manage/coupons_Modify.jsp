<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>�������߿��ԡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
</head>

<body >
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="70%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">�Ż�ȯ���� &gt; �޸��Ż�ȯ &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5" height="9">
										&nbsp;��ǰ����Ա��${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table> 
							<s:form action="" namespace="" method="post" onsubmit="return checkForm(this)">
								<table width="85%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
					
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">�Ż�ȯ���ƣ�</td>
										<td width="73%" align="left">
											
											<s:textfield name="couponsName" size="25"/>
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��ʼʱ�䣺</td>
										<td width="73%" align="left">
											
											<s:textfield name="biginTime" size="25"/>
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">����ʱ�䣺</td>
										<td width="73%" align="left">
											
											<s:textfield name="endTime" size="25"/>
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">����ʹ�ã�</td>
										<td width="73%" align="left">
											
											<s:textfield name="money" size="25"/>
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">���ý�</td>
										<td width="73%" align="left">
											
											<s:textfield name="cusMoney" size="25"/>
										</td>
									<tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey"value="����" /> &nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
											<input type="button" class="btn_grey" value="����" onclick="history.back(-1)" />
										</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<input type="hidden" id="rightAnswer1" value="<s:property  value="rightAnswer" />"/>
	
</body>



</html>
