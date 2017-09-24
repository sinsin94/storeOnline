<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>我的收藏</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/wait_buy.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
   
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/cart.js"></script>
  
      <script src="${pageContext.request.contextPath }/js/collection.js" type="text/javascript"></script>
</head>
<body>
 <%@ include file="top.jsp"%>

   <div class="col-main">
						<s:iterator id="collection"  value="#request.collectionProducts"  >
						       	<div class="good_show">
						       	   <s:set name="productID" value='ProductId'/>	
						       			<dl class="item" >
						 					<dt class="collectionphoto photo" style="position: relative;">
						 					
                             
												<img class="collectionimg" alt="【<span class=H><s:property  value="details" /></span>"  src="${pageContext.request.contextPath }/images/<s:property  value="PictureOne" />">
											  <div class="hover-delete" data-deleteid="<s:property  value='#productID'/>">删除</div> 
											     <%--   <div class="hover-delete"><a href="${pageContext.request.contextPath }/customer/FrontProductAction_productPage.do?ProductId=<s:property  value='#productID'/>">删除</a></div>  --%>
											
											</dt>
											
											<dd class="detail"> 
												<a class="item-name J_TGoldData details">
													【<span class="H"><s:property  value="details" /></span>】
												 </a>		
						 					  <div class="attribute">
												<div class="cprice-area">
												
													<span class="symbol" style="font-size: 16px;"> ￥</span>

													<span class="c-price" style="color: coral;font-size: 16px;"><s:property  value="currentPrice" /></span>
													
												    <span class="symbol" style="color:#9F9F9F;font-size: 16px;"> ￥</span>
													<span class="c-price" style="color:#9F9F9F;text-decoration: line-through;"><s:property  value="marketPrice" /></span>
		
										    	</div>        
						  	   			    	<div class="sale-area">总销量：<span class="sale-num"><s:property  value="productUsed" /></span>   
						       		 		    </div> 
						                     </div> 
						             	   </dd>
						             	
									
										</dl>   
								</div>   
						</s:iterator>   
						
							
       		</div>
     


</body>
</html>