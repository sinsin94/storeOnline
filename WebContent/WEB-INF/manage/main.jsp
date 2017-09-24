<%@page import="com.store.util.PageBean"%>

<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>乐购书城——后台管理</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	<script type="text/javascript">
		function checkForm(form) {
			if (form.key.value == "") {
				alert("请输入查询条件!");
				form.key.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
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
									<td width="70%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">考生成绩查询 &gt;&gt;&gt;</span>
									</td>
									<td align="right"><img src="${pageContext.request.contextPath }/Images/m_ico1.gif"
										width="5" height="9">&nbsp;当前管理员：${user.realName }&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<form action="StudentAction_search.do" method="post" id="stuScoreForm"  onsubmit="return checkForm(this)">
								<table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td align="left" valign="middle">&nbsp;查询条件： 
											<select name="queryIf">
													<option value="stuNo">准考证号</option>
													<option value="subjectName">考试课程</option>
											</select> &nbsp;关键字：
											<input name="key" />&nbsp;&nbsp; 
											<input type="submit" class="btn_grey" value="查询" />
										</td>
									</tr>
								</table>
							</form>

							<table width="98%" border="1" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
								bordercolorlight="#67A8DB">
								<tr align="center">
									<td width="21%" height="27" bgcolor="#B2D6F1">订单编号</td>
									<td width="26%" bgcolor="#B2D6F1">消费者姓名</td>
									<td width="22%" bgcolor="#B2D6F1">产品ID</td>
									<td width="11%" bgcolor="#B2D6F1">手机号码</td>
									<td width="11%" bgcolor="#B2D6F1">地址</td>
									<td width="9%" bgcolor="#B2D6F1">价格</td>
								</tr>
								
			
								<s:iterator id="cusOrders"  value="#request.cusOrders"  >
									<tr align="center">
										
										<td><s:property  value="orderId" /></td>
										<td><s:property  value="customerName"/></td>
										<td><s:date name="orderTime" format="yyyy-MM-dd" /></td> 
										<td><s:property  value="phone"/></td>
										<td><s:property  value="orderAddress"/></td>
									    <td><s:property  value="totalPrice"/></td>
									</tr>
								 </s:iterator>
							</table>
				
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>
