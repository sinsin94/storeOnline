<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/customer_center.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Myorder.css">
  <%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customerInfoCenter.css"> --%>
   
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/customerinfocenter.js"></script>
     <script src="${pageContext.request.contextPath }/js/address.js"></script>
    <script src="${pageContext.request.contextPath }/js/jsAddress.js"></script>
    
    
</head>


<body>
<!---->
<%@ include file="top.jsp"%>

<div style="width: 100%;height: 551px;background: #FAFAFA;">
	<%@ include file="center_left.jsp"%>
	<div id="ajaxDiv" class="vipcenterrightbox">	
		<div style="width: 100%;height: 33px;background-color: brown;color: white;line-height: 33px;font-size: larger;">&nbsp;&nbsp;&nbsp;&nbsp;修改密码
		</div>
		<div class="infoTable">	 
			<s:form action="FrontCustomerAction_resetPwd.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">
				<table width="57%" border="0" cellpadding="0" cellspacing="0"
					bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
					bordercolorlight="#FFFFFF" style="margin-left: 58px;margin-top: 29px;">
					<tr>
						<input type="hidden" name="customerId" value="<s:property  value="customerId" />" />
						<input type="hidden" name="name" value="<s:property  value="name" />" />
						
							<td height="30" align="left" style="font-size: larger;font-style: italic;">原始密码：
							</td>
							<td align="left">	
							<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="password" name="password"  size="20" >		
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="hidden" name="password1"  size="20" >
							</td>
					</tr>
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">新密码：</td>
							<td width="84%" align="left">										
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="password" name="pwdChange" size="20"/>
							</td>
					</tr>
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">新密码：</td>
							<td width="84%" align="left">											
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="password" name="pwdChangeAgine"  size="20"/> 
							</td>
					</tr>
					<tr>
							<td height="65" align="left" style="padding:5px;">&nbsp;</td>
							<td>
								<input type="submit" class="btn_grey" value="保存" />&nbsp; 
								<input type="reset" class="btn_grey" value="取消" /> &nbsp;
								<input type="button" class="btn_grey" value="返回" onclick="history.back(-1)" />
							</td>
					</tr>
				</table>
			</s:form>							
		</div>

 	</div>   
  </div>
	<script src="js/user_center.js"></script>
	<script src="js/jsAddress.js" type="text/javascript"></script>

</body>
</html>