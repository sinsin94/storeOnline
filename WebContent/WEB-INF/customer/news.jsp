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
		<div class="news" style=" overflow: hidden;width: 20%;border: 1px solid #CA94A2;background-color: white;margin: 51px 73px;height: 282px;;float:left">
       		   <div style="width: 100%;height: 30px;color: white;background-color: brown;font-size: 16px;line-height: 30px;text-align: center;">公告</div>
				<ul>
				
				<s:iterator id="news" value="#request.frontNewsList">
					<li><a  class="J_TGoldData" href="${pageContext.request.contextPath }/customer/FrontProductAction_News.do?NewsId=<s:property  value='id'/>"><s:property  value="title" /></a></li>
				</s:iterator>
					
				</ul>       		
       		</div>
	<div id="ajaxDiv" class="vipcenterrightbox">	
	<s:iterator id="news" value="#request.frontNewsListonly">
		<div style="width: 100%;height: 30px;text-align: center;font-size: 20px;margin-top: 24px;margin-bottom: 16px;"><s:property  value="title" /></div>
		<div style="width: 80%;margin: auto;font-size: 15px;"><s:property  value="allcontent" /></div>
    </s:iterator>

		
		
		
		
 	</div>   
  </div>
	<script src="js/user_center.js"></script>
	<script src="js/jsAddress.js" type="text/javascript"></script>

</body>
</html>