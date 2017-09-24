<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/index.js"></script>
<title>乐购书城</title>
</head>

<body style="background:#f7f7f7">
<!-- 头部-->
<%@ include file="top.jsp"%>


<!--导航 end-->

    <!-- 主体商品 -->
         
            <div class="top-nav">
         		 <div class="top-nav-content">
	            		<ul>
	            		      <li>
	            		      	<div>所有分类 ></div>	            		     
	            		      </li>
	            		  </ul>
	            		</div>
            		</div>
          
            <div class="book-parameter">
            	<div class="book-category">书籍分类</div>
            	<div class="book-category-detail">
            		<ul>
            		
            			<s:iterator id=""  value="#request.FrontCategoryList"  >
            			<li><a  href="${pageContext.request.contextPath }/customer/FrontProductAction_categoryProduct.do?id=<s:property  value='id'/>"><s:property  value="categoryName" /></a></li>
            			<%--  <li><s:property  value="categoryName" /></li> --%>
            			</s:iterator>
            		  
            		</ul>
            	</div>
            
            </div> 
            
       		<div class="col-main-all">
						<s:iterator id="pro"  value="#request.FrontProductList"  >
						       	<div class="good_show">
						       	  <s:set name="productID" value='ProductId'/>	
						       			<dl class="item" >
						 					<dt class="photo">
						 					<a  class="J_TGoldData" href="${pageContext.request.contextPath }/customer/FrontProductAction_productPageInfo.do?ProductId=<s:property  value='#productID'/>">
                             
												<img alt="【<span class=H><s:property  value="details" /></span>"  src="${pageContext.request.contextPath }/images/<s:property  value="PictureOne" />">
											</a> 
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
       

 
    
<!--主体 end-->
<!--侧边栏-->
<div class="floatdiv">
    <a href="#" class="floatdiv-kf">客服</a>
    <a href="#" class="floatdiv-icon">
        <img src="images/ys-fix-icon01.png">

    </a>
    <a href="user_center.html" class="floatdiv-icon"><img src="images/ys-fix-icon02.png"></a>
    <a href="shopping_car.html" class="floatdiv-icon">
        <img src="images/ys-fix-icon03.png">
        <span class='cart_num'>5</span>
    </a>
    <a href="#" class="floatdiv-back">
        <img src="images/ys-fix-icon04.png">
        <span>返回</span>
    </a>
    <img class="floatdiv-erweima" src="images/icon_erweima.jpg">
</div>
<!--侧边栏 end-->

<!--页脚-->

<!--页脚 end-->

</body>
</html>