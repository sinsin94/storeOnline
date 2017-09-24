<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
	<title>�ֹ���ǡ�����̨����</title>
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
									<td width="70%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">��ַ��Ϣ���� &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5" height="9">
										��ǰ����Ա��${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
				
							<s:form action="AddressAction_delete.do" namespace="/manager" id="addressForm" method="post">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center" bgcolor="#A8D8FC">
											<td width="10%" height="30" bgcolor="#B2D6F1">��ַID</td>
											<td width="15%" height="30" bgcolor="#B2D6F1">�ռ���</td>
											<td width="15%" bgcolor="#B2D6F1">��ϵ�绰</td>
											<td width="15%" bgcolor="#B2D6F1">ʡ</td>
											<td width="10%" bgcolor="#B2D6F1">��</td>
											<td width="14%" bgcolor="#B2D6F1">����</td>
											<td width="6%" bgcolor="#B2D6F1">��ϸ��ַ</td>
											
										</tr>
								<s:iterator id="address"  value="#request.addressList"  status="sta" >
									<tr align="center">		
									    <s:set name="addressID" value='addressId'/>	
									   	<td><s:property  value="#sta.index+1"/></td>									    
									    <td><s:property  value="receiver" /></td>							
										<td><s:property  value="contactUserPhone" /></td>
										<td><s:property  value="province"/></td>
										<td><s:property  value="city"/></td>
										<td><s:property  value="area"/></td>
										<td><s:property  value="detailAddress"/></td>
								 
									</tr>
								 </s:iterator>
										
								</table>
								
								
								<table>
									<%
										PageBean pageBean=(PageBean)request.getAttribute("pageBean");
										String urlPath=request.getContextPath()+"/manager/AddressAction_index.do";
										
									%>
									<tr>
										 <td width="16%" align="left">�ܼ�¼����<%=pageBean.getTotalResult() %>��</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">��ҳ&nbsp;|</td>
								             <td width="12%" align="center">��һҳ&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','addressForm')">��ҳ&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','addressForm')">��һҳ&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">��һҳ&nbsp;|</td>
								             <td width="8%" align="center">ĩҳ</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','addressForm')">��һҳ&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','addressForm')">ĩҳ</a></td>
							             <%} %>
							             <td width="8%" align="center">��<%=pageBean.getPageNo() %>ҳ</td>
							             <td width="8%" align="center">��<%=pageBean.getSumPage() %>ҳ</td>
							             <td width="20%" align="right">����<input size="1" type="text" name="goPage" >ҳ
							             <a href="#" onClick="gotopage('','go','addressForm')">ȷ��</a></td>
							             
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
