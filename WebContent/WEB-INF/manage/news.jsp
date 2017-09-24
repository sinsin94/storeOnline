<%@page import="com.store.util.PageBean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
	<title>乐购书城——后台管理</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/index1.css"  />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/commonfuc.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/manager.js"></script>
</head>

<script type="text/javascript">
	function check(form) {
		
		
		//alert(categoryName);
		if (form.title.value == "") {
			alert("请输入title!");
			form.title.focus();
			return;
		}
		if (confirm("确定要添加吗？")) {
			form.submit();
		}
		
		

	}
</script>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" valign="top" bgcolor="#FFFFFF">
				<table width="99%" height="487" border="0" cellpadding="0" cellspacing="0" align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="70%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">banner信息管理 &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif"width="5" height="9">
										当前管理员：${user.realName }&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="96%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="85%" height="27" align="right">
										<img src="${pageContext.request.contextPath }/images/add.gif" width="19" height="18">&nbsp;
									</td>
									<td width="15%">
										<a class="add_page">添加公告</a>
									</td>
								</tr>
							</table>
							<s:form action="NewsAction_delete.do" namespace="/manager" method="post" id="newsForm">
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
									<tr align="center" bgcolor="#A8D8FC">
										<td width="10%" height="26" bgcolor="#B2D6F1">ID</td>
										<td width="40%" bgcolor="#B2D6F1">title</td>
										<td width="40%" bgcolor="#B2D6F1">details</td>										
										<td width="10%" bgcolor="#B2D6F1">选项</td>
									</tr>
									<s:iterator id="ban"  value="newsList"   status="sta">
									<tr align="center">
										
										<td ><s:property  value="#sta.index+1"/></td>
										<td ><s:property  value="title" /></td>
										<td ><s:property  value="allcontent" /></td>
										<td ><input type="checkbox" name="delIdArray"  value=<s:property  value="id" /> /></td>
									
									</tr>
								    </s:iterator>									
								</table>
								
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%" height="24">&nbsp;</td>
										<td width="40%" align="right">
											<input name="checkbox"
											type="checkbox" class="noborder"
											onClick="CheckAll(newsForm.delIdArray,newsForm.checkbox)">
											[全选/反选] 
											[<a style="color:red;cursor:hand;"
												onClick="checkdel(newsForm.delIdArray,newsForm)">删除</a>]
											<div id="ch">
												<input id="delIdArray" type="checkbox" class="noborder" value="0">
											</div>
										</td>
										<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->
										<script language="javascript">
											ch.style.display = "none";
										</script>
									</tr>
								</table>
								<table>
									<%
										PageBean pageBean=(PageBean)request.getAttribute("pageBean");
										String urlPath=request.getContextPath()+"/manager/NewsAction_index.do";
										
									%>
									<tr>
										 <td width="16%" align="left">总记录数：<%=pageBean.getTotalResult() %>条</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="9%" align="center">首页&nbsp;|</td>
								             <td width="12%" align="center">上一页&nbsp;|</td>
							             <%}else{ %>
								             <td width="9%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','start','newsForm')">首页&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','prev','newsForm')">上一页&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">下一页&nbsp;|</td>
								             <td width="8%" align="center">末页</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','next','newsForm')">下一页&nbsp;|</a></td>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('<%=urlPath %>','end','newsForm')">末页</a></td>
							             <%} %>
							             <td width="8%" align="center">第<%=pageBean.getPageNo() %>页</td>
							             <td width="8%" align="center">共<%=pageBean.getSumPage() %>页</td>
							             <td width="20%" align="right">至第<input size="1" type="text" name="goPage" >页
							             <a href="#" onClick="gotopage('','go','newsForm')">确定</a></td>
							             
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
            <p class="login_head1" >添加公告</p>
            <div class="clear1"></div>
            
				<form action="NewsAction_add.do" method="post" id="newsForm_add">
					<table height="77" border="0" cellpadding="0" cellspacing="0">
						<tr>
							
							<td width="167" height="30" align="right">title：</td>
								<td  width="167" class="entry">
								<input id="title" name="title" type="text" size="25">
							</td>
						</tr>
						<tr>
							
							<td width="167" height="30" align="right">内容：</td>
								<td  width="167" class="entry">
								<input id="allcontent" name="allcontent" type="text" size="25">
							</td>
						</tr>
						
						<tr>
							<td height="47" align="center">&nbsp;</td>
							<td>
								<input type="button"class="btn_grey" value="保存" onclick="check(newsForm_add)" /> &nbsp; 
								<input type="button" class="btn_grey close" value="关闭" />&nbsp; 
							</td>
						</tr>
					</table>
			     </form>         
          </div>      
      </div>

</body>
</html>
