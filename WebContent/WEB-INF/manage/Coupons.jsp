<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
	<title>�ֹ���ǡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/index1.css"  />	
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/manager.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/commonfuc.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/function.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxRequest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
</head>
<script type="text/javascript">
	function check(form) {
		
		if (form.couponsName.value == "") {
			alert("�������Ż�����!");
			form.userName.focus();
			return;
		}
		
		if (form.biginTime.value == "") {
			alert("�����뿪ʼʱ��!");
			form.userName.focus();
			return;
		}
		if (form.endTime.value == "") {
			alert("���������ʱ��!");
			form.password.focus();
			return;
		}
		if (form.money.value == "") {
			alert("����������ʹ��!");
			form.confimpassword.focus();
			return;
		}
		
		if (form.cusMoney.value =="") {
			alert("��������ý��");
			form.confimpassword.focus();
			return;
		}
		if (confirm("ȷ��Ҫ�����")) {
			form.submit();
		}
		
		

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
									<td width="70%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">�Ż�ȯ���� &gt;&gt;&gt;</span>
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
									<td width="80%" height="27" align="right">
										<img src="${pageContext.request.contextPath }/images/add.gif" width="19" height="18">&nbsp;</td>
									<td width="13%">
										<a class="add_coupons">����Ż���Ϣ<a>
									</td>
								</tr>
							</table>
							<s:form action="CouponsAction_delete.do" namespace="/manager" id="couponsForm" method="post">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center" bgcolor="#A8D8FC">
											<td width="10%" height="30" bgcolor="#B2D6F1">����</td>
											<td width="15%" height="30" bgcolor="#B2D6F1">�Ż�ȯ����</td>
											<td width="15%" bgcolor="#B2D6F1">��ʼʱ��</td>
											<td width="15%" bgcolor="#B2D6F1">����ʱ��</td>
											<td width="10%" bgcolor="#B2D6F1">����</td>
											<td width="14%" bgcolor="#B2D6F1">���ý��</td>
											<td width="6%" bgcolor="#B2D6F1">�޸�</td>
											<td width="6%" bgcolor="#B2D6F1">ѡ��</td>
										</tr>
								<s:iterator id="pro"  value="#request.couponslist" status="sta" >
									<tr align="center">		
									    <s:set name="couponID" value='couponId'/>	
									    <td><s:property  value="#sta.index+1"/></td>
									    <td><s:property  value="couponsName" /></td>			    
									    <td><s:property  value="biginTime" /></td>							
										<td><s:property  value="endTime" /></td>
										<td><s:property  value="money"/></td>
										<td><s:property  value="cusMoney"/></td>
									    <td>
											<a href="${pageContext.request.contextPath }/manager/CouponsAction_update.do?couponId=<s:property  value='#couponID'/>">�޸�</a>
									    </td>  
										<td><input type="checkbox" name="delIdArray" value=<s:property  value="couponId" />></td>
									    
									</tr>
								 </s:iterator>
										
								</table>
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%" height="24">&nbsp;</td>
										<td width="40%" align="right">
											<input name="checkbox"
												type="checkbox" class="noborder"
												onClick="CheckAll(couponsForm.delIdArray,couponsForm.checkbox)">
											[ȫѡ/��ѡ] [
											<a style="color:red;cursor:hand;"
											onClick="checkdel(couponsForm.delIdArray,couponsForm)">ɾ��</a>]
											<div id="ch" style="display: none;">
												<input id="delIdArray" type="checkbox" class="noborder" value="0">
											</div>
										</td>
									</tr>
								</table>
								
								<table>
									<%
										PageBean pageBean=(PageBean)request.getAttribute("pageBean");
										String urlPath=request.getContextPath()+"/manager/QuestionAction_index.do";
										
									%>
									<tr>
										 <td width="16%" align="left">�ܼ�¼����<%=pageBean.getTotalResult() %>��</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">��ҳ&nbsp;|</td>
								             <td width="12%" align="center">��һҳ&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','couponsForm')">��ҳ&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','couponsForm')">��һҳ&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">��һҳ&nbsp;|</td>
								             <td width="8%" align="center">ĩҳ</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','couponsForm')">��һҳ&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','couponsForm')">ĩҳ</a></td>
							             <%} %>
							             <td width="8%" align="center">��<%=pageBean.getPageNo() %>ҳ</td>
							             <td width="8%" align="center">��<%=pageBean.getSumPage() %>ҳ</td>
							             <td width="20%" align="right">����<input size="1" type="text" name="goPage" >ҳ
							             <a href="#" onClick="gotopage('','go','couponsForm')">ȷ��</a></td>
							             
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
	 <div class="total_add" >
        <div class="denglu1">
            <p class="login_head1" >����Ż�ȯ</p>
            <div class="clear1"></div>
            
				<form action="CouponsAction_add.do" method="post" id="couponsForm_add">
					<table height="77" border="0" cellpadding="0" cellspacing="0">
						<tr>
							
							<td width="167" height="30" align="right">�Ż�ȯ���ƣ�</td>
							<td  width="167" class="entry">
								<input id="couponsName" name="couponsName" type="text" size="25">
							</td>
						</tr>
						<tr>
							
							<td width="167" height="30" align="right">��ʼʱ�䣺</td>
							<td  width="167" class="entry">
								<input id="biginTime" name="biginTime" type="text" size="25">
							</td>
						</tr>
						<tr>	
							<td width="167" height="30" align="right">��ֹʱ�䣺</td>
							<td  width="167" class="entry">
								<input id="endTime" name="endTime" type="text" size="25">
							</td>
						</tr>
						<tr>							
							<td width="167" height="30" align="right">����ʹ�ã�</td>
							<td  width="167" class="entry">
								<input id="money" name="money" type="text" size="25">
							</td>
						</tr>
						<tr>							
							<td width="167" height="30" align="right">���ý�</td>
							<td  width="167" class="entry">
								<input id="cusMoney" name="cusMoney" type="text" size="25">
							</td>
						</tr>
						<tr>
							<td height="47" align="center">&nbsp;</td>
							<td>
								<input type="button"class="btn_grey" value="����" onclick="check(couponsForm_add)" /> &nbsp; 
								<input type="button" class="btn_grey close" value="�ر�" />&nbsp; 
							</td>
						</tr>
					</table>
			     </form>         
          </div>      
      </div>

</body>
</html>
