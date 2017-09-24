<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
	<title>乐购书城——后台管理</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/commonfuc.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/function.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxRequest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
</head>
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
									<td width="70%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">订单管理 &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5" height="9">
										当前管理员：${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="96%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="80%" height="27" align="right">
										<img src="${pageContext.request.contextPath }/images/add.gif" width="19" height="18">&nbsp;</td>
									<td width="13%">
										<s:a namespace="/manager" action="ProductAction_add.do">添加产品信息</s:a>
									</td>
								</tr>
							</table>
							<s:form action="ProductAction_delete.do" namespace="/manager" id="productForm" method="post">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center" bgcolor="#A8D8FC">
											<td width="10%" height="30" bgcolor="#B2D6F1">订单ID</td>
											<td width="15%" height="30" bgcolor="#B2D6F1">消费者</td>
											<td width="15%" bgcolor="#B2D6F1">书名</td>
											<td width="10%" bgcolor="#B2D6F1">数量</td>
											<td width="15%" bgcolor="#B2D6F1">总价</td>
											<td width="10%" bgcolor="#B2D6F1">收货地址</td>											
											<td width="14%" bgcolor="#B2D6F1">下单时间</td>

										</tr>
								<s:iterator id="order"  value="#request.cusOrders" status="orde" >
									<tr align="center">		
									    <s:set name="orderId" value='orderId'/>	
									    <td><s:property  value="#orde.index+1"/></td>	
									    <td><s:property  value="customerName" /></td>
									    <td><s:property  value="bookName" /></td>	
									      <td><s:property  value="bookNum" /></td>							
										<td><s:property  value="totalPrice" /></td>
										<td><s:property  value="orderAddress"/></td>
										<td><s:property  value="orderTime"/></td>
		 
									</tr>
								 </s:iterator>
										
								</table>
								
								
								<table>
									<%
										PageBean pageBean=(PageBean)request.getAttribute("pageBean");
										String urlPath=request.getContextPath()+"/manager/ProductAction_index.do";
										
									%>
									<tr>
										 <td width="16%" align="left">总记录数：<%=pageBean.getTotalResult() %>条</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">首页&nbsp;|</td>
								             <td width="12%" align="center">上一页&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','productForm')">首页&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','productForm')">上一页&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">下一页&nbsp;|</td>
								             <td width="8%" align="center">末页</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','productForm')">下一页&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','productForm')">末页</a></td>
							             <%} %>
							             <td width="8%" align="center">第<%=pageBean.getPageNo() %>页</td>
							             <td width="8%" align="center">共<%=pageBean.getSumPage() %>页</td>
							             <td width="20%" align="right">至第<input size="1" type="text" name="goPage" >页
							             <a href="#" onClick="gotopage('','go','productForm')">确定</a></td>
							             
							             <td><input type="hidden" name="pageNO" value="<%=pageBean.getPageNo() %>" ></td> 
							             <td><input type="hidden" name="prevpageNO" value="<%=pageBean.getPageNo()-1 %>"></td>
							             <td><input type="hidden" name="nextpageNO" value="<%=pageBean.getPageNo()+1 %>"></td>
							             <td><input type="hidden" name="sumPage" value="<%=pageBean.getSumPage() %>" ></td>
							             <td><input type="hidden" name="pageSize" value="<%=pageBean.getPageSize()%>" ></td> 
									</tr>
								</table>
								
							</s:form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>
