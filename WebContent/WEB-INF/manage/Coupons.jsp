<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
	<title>乐购书城——后台管理</title>
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
			alert("请输入优惠名称!");
			form.userName.focus();
			return;
		}
		
		if (form.biginTime.value == "") {
			alert("请输入开始时间!");
			form.userName.focus();
			return;
		}
		if (form.endTime.value == "") {
			alert("请输入结束时间!");
			form.password.focus();
			return;
		}
		if (form.money.value == "") {
			alert("请输入满额使用!");
			form.confimpassword.focus();
			return;
		}
		
		if (form.cusMoney.value =="") {
			alert("请输入抵用金额");
			form.confimpassword.focus();
			return;
		}
		if (confirm("确定要添加吗？")) {
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
									<td width="70%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">优惠券管理 &gt;&gt;&gt;</span>
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
										<a class="add_coupons">添加优惠信息<a>
									</td>
								</tr>
							</table>
							<s:form action="CouponsAction_delete.do" namespace="/manager" id="couponsForm" method="post">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center" bgcolor="#A8D8FC">
											<td width="10%" height="30" bgcolor="#B2D6F1">序列</td>
											<td width="15%" height="30" bgcolor="#B2D6F1">优惠券名称</td>
											<td width="15%" bgcolor="#B2D6F1">起始时间</td>
											<td width="15%" bgcolor="#B2D6F1">结束时间</td>
											<td width="10%" bgcolor="#B2D6F1">满额</td>
											<td width="14%" bgcolor="#B2D6F1">抵用金额</td>
											<td width="6%" bgcolor="#B2D6F1">修改</td>
											<td width="6%" bgcolor="#B2D6F1">选项</td>
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
											<a href="${pageContext.request.contextPath }/manager/CouponsAction_update.do?couponId=<s:property  value='#couponID'/>">修改</a>
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
											[全选/反选] [
											<a style="color:red;cursor:hand;"
											onClick="checkdel(couponsForm.delIdArray,couponsForm)">删除</a>]
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
										 <td width="16%" align="left">总记录数：<%=pageBean.getTotalResult() %>条</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">首页&nbsp;|</td>
								             <td width="12%" align="center">上一页&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','couponsForm')">首页&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','couponsForm')">上一页&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">下一页&nbsp;|</td>
								             <td width="8%" align="center">末页</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','couponsForm')">下一页&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','couponsForm')">末页</a></td>
							             <%} %>
							             <td width="8%" align="center">第<%=pageBean.getPageNo() %>页</td>
							             <td width="8%" align="center">共<%=pageBean.getSumPage() %>页</td>
							             <td width="20%" align="right">至第<input size="1" type="text" name="goPage" >页
							             <a href="#" onClick="gotopage('','go','couponsForm')">确定</a></td>
							             
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
            <p class="login_head1" >添加优惠券</p>
            <div class="clear1"></div>
            
				<form action="CouponsAction_add.do" method="post" id="couponsForm_add">
					<table height="77" border="0" cellpadding="0" cellspacing="0">
						<tr>
							
							<td width="167" height="30" align="right">优惠券名称：</td>
							<td  width="167" class="entry">
								<input id="couponsName" name="couponsName" type="text" size="25">
							</td>
						</tr>
						<tr>
							
							<td width="167" height="30" align="right">开始时间：</td>
							<td  width="167" class="entry">
								<input id="biginTime" name="biginTime" type="text" size="25">
							</td>
						</tr>
						<tr>	
							<td width="167" height="30" align="right">截止时间：</td>
							<td  width="167" class="entry">
								<input id="endTime" name="endTime" type="text" size="25">
							</td>
						</tr>
						<tr>							
							<td width="167" height="30" align="right">满额使用：</td>
							<td  width="167" class="entry">
								<input id="money" name="money" type="text" size="25">
							</td>
						</tr>
						<tr>							
							<td width="167" height="30" align="right">抵用金额：</td>
							<td  width="167" class="entry">
								<input id="cusMoney" name="cusMoney" type="text" size="25">
							</td>
						</tr>
						<tr>
							<td height="47" align="center">&nbsp;</td>
							<td>
								<input type="button"class="btn_grey" value="保存" onclick="check(couponsForm_add)" /> &nbsp; 
								<input type="button" class="btn_grey close" value="关闭" />&nbsp; 
							</td>
						</tr>
					</table>
			     </form>         
          </div>      
      </div>

</body>
</html>
