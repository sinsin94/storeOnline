<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>�ֹ���ǡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/commonfuc.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/function.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxRequest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
	 <link rel="stylesheet" type="text/css" href="../css/index.css"  />
	<%-- 
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/manager.js"></script> --%>
</head>

<script type="text/javascript">
	function checkForm(form){
		if(form.name.value==""){
			alert("�����������������!");
			form.name.focus();
			return false;
		}
	}
</script>
<body>
	<%@ include file="top.jsp"%>
	
	<table class="tablemain" width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%></td>
			<td width="602" valign="top" bgcolor="#FFFFFF">
				<table width="99%" height="487" border="0" cellpadding="0" cellspacing="0" align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="70%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">����������� &gt;&gt;&gt;</span>
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
							<table width="96%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="85%" height="27" align="right"><img
										src="${pageContext.request.contextPath }/images/add.gif" width="19" height="18">&nbsp;</td>
									<td width="15%">
										<s:a namespace="/manager" action="SecondCategoryAction_add.do">��Ӷ�������</s:a>
									</td>
								</tr>
							</table>
							<s:form action="SecondCategoryAction_delete.do" namespace="/manager" method="post" id="secondcategoryForm">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center">
											<td width="29%" height="30" bgcolor="#B2D6F1">������������</td>
											<td width="25%" bgcolor="#B2D6F1">����һ������</td>
											<td width="32%" bgcolor="#B2D6F1">����ʱ��</td>
											<td width="7%" bgcolor="#B2D6F1">�޸�</td>
											<td width="7%" bgcolor="#B2D6F1">ѡ��</td>
										</tr>
										
								<s:iterator id="secondcategory"  value="#request.secondcategory">
								<tr align="center">
									<s:set name="secondCategoryID" value='id'/>
									<td><s:property  value="secondCategoryName"/></td>
									<td><s:property  value="firstCategoryName"/></td>
									<td><s:date name="createTime" format="yyyy-MM-dd" /></td> 
									<td>
										 <a href="${pageContext.request.contextPath }/manager/SecondCategoryAction_update.do?id=<s:property  value='#secondCategoryID'/>">�޸�</a> 
										
									</td>
									
									<td><input type="checkbox" name="delIdArray" id="dddd" value=<s:property  value="id" /> /></td>
									
									
								</tr>
								 </s:iterator>
										
								</table>
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%" height="24">&nbsp;</td>
										<td width="40%" align="right">
											<input name="checkbox"
											type="checkbox" class="noborder"
											onClick="CheckAll(secondcategoryForm.delIdArray,secondcategoryForm.checkbox)">
											[ȫѡ/��ѡ] 
											[<a style="color:red;cursor:hand;"
												onClick="checkdel(secondcategoryForm.delIdArray,secondcategoryForm)">ɾ��</a>]
											<div id="ch" style="display:none;">
												<input id="delIdArray" type="checkbox" class="noborder"
													value="0">
											</div>
										</td>
									</tr>
								</table>
								<table>
									<%
										
										PageBean pageBean=(PageBean)request.getAttribute("pageBean");
										String urlPath=request.getContextPath()+"/manager/SecondCategoryAction_index.do";
										
									%>
									<tr>
										 <td width="16%" align="left">�ܼ�¼����<%=pageBean.getTotalResult() %>��</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">��ҳ&nbsp;|</td>
								             <td width="12%" align="center">��һҳ&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','secondcategoryForm')">��ҳ&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','secondcategoryForm')">��һҳ&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">��һҳ&nbsp;|</td>
								             <td width="8%" align="center">ĩҳ</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','secondcategoryForm')">��һҳ&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','secondcategoryForm')">ĩҳ</a></td>
							             <%} %>
							             <td width="8%" align="center">��<%=pageBean.getPageNo() %>ҳ</td>
							             <td width="8%" align="center">��<%=pageBean.getSumPage() %>ҳ</td>
							             <td width="20%" align="right">����<input size="1" type="text" name="goPage" >ҳ
							             <a href="#" onClick="gotopage('','go','secondcategoryForm')">ȷ��</a></td>
							             
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
