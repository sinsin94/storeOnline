<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>网络在线考试——后台管理</title>
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
									<td width="78%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">产品信息管理 &gt; 添加产品 &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5" height="9">
										&nbsp;当前管理员：${user.realName } &nbsp;
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
										<td height="30" align="left" style="padding:5px;">所属二级分类：</td>
										<td align="left">
										<select name="secondCategoryId" >
										   <s:iterator   value="#request.productlist"  >										    									
											<option value=<s:property  value="secondCategoryId" />><s:property  value="secondCateName" /></option>							    										   
									       </s:iterator>
								    	</select>
										</td>
									</tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">书名：</td>
										<td width="73%" align="left">
											<input name="productName" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">小图1：</td>
										<td width="73%" align="left">
											<input name="PictureOne" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">小图2：</td>
										<td width="73%" align="left">
											<input name="PictureTwo" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">小图3：</td>
										<td width="73%" align="left">
											<input name="PictureThree" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">小图4：</td>
										<td width="73%" align="left">
											<input name="PictureFour" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">小图5：</td>
										<td width="73%" align="left">
											<input name="PictureFive" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">大图：</td>
										<td width="73%" align="left">
											<input name="Picturebig" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">出版商：</td>
										<td width="73%" align="left">
											<input name="publisher" size="25">
										</td>
									<tr>						
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">作者：</td>
										<td width="73%" align="left">
											<input name="author" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">商品详情：</td>
										<td width="73%" align="left">
											<input name="details" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">库存：</td>
										<td width="73%" align="left">
											<input name="inventory" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">商品编号：</td>
										<td width="73%" align="left">
											<input name="productNum" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">当前价格：</td>
										<td width="73%" align="left">
											<input name="currentPrice" size="25">
										</td>
									<tr>
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">市场价格：</td>
										<td width="73%" align="left">
											<input name="marketPrice" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">所送积分：</td>
										<td width="73%" align="left">
											<input name="points" size="25">
										</td>
									<tr>
									
									
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">已售数量：</td>
										<td width="73%" align="left">
											<input name="productUsed" size="25">
										</td>
									<tr>
									
		
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey"value="保存" /> &nbsp; 
											<input type="reset" class="btn_grey" value="取消" /> &nbsp;
											<input type="button" class="btn_grey" value="返回" onclick="javascript:window.location.href='${pageContext.request.contextPath }/manager/QuestionAction_index.do' "/>
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
