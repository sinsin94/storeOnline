<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>�������߿��ԡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function checkForm(form) {
		
		
	}
	
	
</script>
<body>
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
									<td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">��Ʒ��Ϣ���� &gt; ��Ӳ�Ʒ &gt;&gt;&gt;</span>
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
							<s:form action="ProductAction_add.do" namespace="/manager" method="post" onsubmit="return checkForm(this)">
								<table width="85%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">						
									<tr>
										<td height="30" align="left" style="padding:5px;">�����������ࣺ</td>
										<td align="left">
										<select name="secondCategoryId" >
										   <s:iterator   value="#request.productlist"  >										    									
											<option value=<s:property  value="secondCategoryId" />><s:property  value="secondCateName" /></option>							    										   
									       </s:iterator>
								    	</select>
										</td>
									</tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">������</td>
										<td width="73%" align="left">
											<input name="productName" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">Сͼ1��</td>
										<td width="73%" align="left">
											<input name="PictureOne" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">Сͼ2��</td>
										<td width="73%" align="left">
											<input name="PictureTwo" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">Сͼ3��</td>
										<td width="73%" align="left">
											<input name="PictureThree" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">Сͼ4��</td>
										<td width="73%" align="left">
											<input name="PictureFour" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">Сͼ5��</td>
										<td width="73%" align="left">
											<input name="PictureFive" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��ͼ��</td>
										<td width="73%" align="left">
											<input name="Picturebig" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">�����̣�</td>
										<td width="73%" align="left">
											<input name="publisher" size="25">
										</td>
									<tr>						
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">���ߣ�</td>
										<td width="73%" align="left">
											<input name="author" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��Ʒ���飺</td>
										<td width="73%" align="left">
											<input name="details" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��棺</td>
										<td width="73%" align="left">
											<input name="inventory" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��Ʒ��ţ�</td>
										<td width="73%" align="left">
											<input name="productNum" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">��ǰ�۸�</td>
										<td width="73%" align="left">
											<input name="currentPrice" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">�г��۸�</td>
										<td width="73%" align="left">
											<input name="marketPrice" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">���ͻ��֣�</td>
										<td width="73%" align="left">
											<input name="points" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">����������</td>
										<td width="73%" align="left">
											<input name="productUsed" size="25">
										</td>
									<tr>
									
		
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey"value="����" /> &nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
											<input type="button" class="btn_grey" value="����" onclick="javascript:window.location.href='${pageContext.request.contextPath }/manager/QuestionAction_index.do' "/>
										</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>

</body>
</html>
