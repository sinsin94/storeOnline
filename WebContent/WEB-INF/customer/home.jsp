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

<!--主体部分主页banner-->
<div class="idx-banner">
    <div class="idx-imgs">
	    <s:iterator id="bann"  value="#request.FrontBannersList">
	        <a href="javascript:void(0);" class='idx-banner-img'> <img src="${pageContext.request.contextPath }/images/<s:property  value="BannerOne"/>"></a>
		</s:iterator>

    </div>
    <div class="idx-imgs-num">
	     <s:iterator id="bann"  value="#request.FrontBannersList">
	    	<a href="javascript:void(0);" class="cur"></a>
	     </s:iterator>
    </div>

  
</div>


    <!-- 优惠券 -->
<div> 
    <div class="conponbox"></div>
    <s:iterator id="cou"  value="#request.FrontCouponsList"  >
		<div class="stamp stamp02">
			<div class="par"><p><s:property  value="couponsName" /></p><sub class="sign">￥</sub><span><s:property  value="cusMoney" /></span><sub>优惠券</sub><p>订单满<s:property  value="money" />元</p></div>
			<div class="copy">副券<p><s:property  value="biginTime" /><br><s:property  value="endTime" /></p></div>
			<i></i>
		</div>  
    </s:iterator>   	
	
</div>   

    <!-- 主体商品 -->
    <div class="main-box">
            <div class="empty-box"></div>
       		<div class="col-right">
       			<div class="categoryname">图书分类</div>
       			
       			<div>
       			 <s:iterator id="nav"  value="#request.FrontCategoryList"> 
	       			<div class="category"><s:property  value="categoryName" /></div>
	       			  <ul class="second">
	       			    <s:iterator  value="#request.secondcategorys" >
	       			  	  <li><a  href="${pageContext.request.contextPath }/customer/FrontProductAction_categoryProduct.do?id=<s:property  value='id'/>">
	       			  	           <s:property  value="secondCategoryName" /></a></li>
	       			  	</s:iterator>
	       			  	  
	       			  </ul>
	       	    </s:iterator>
	       			</div>
       		</div>
       		<div class="col-main">
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
       		<div class="col-left">
       		
       		<div class="news">
       		   <div style="width: 100%;height: 30px;color: white;background-color: brown;font-size: 16px;line-height: 30px;text-align: center;">公告</div>
				<ul>
				
				<s:iterator id="news" value="#request.frontNewsList">
					<li style="font-size: 15px;width: 100%;height: 25px;line-height: 25px;border-bottom: 1px solid brown;text-align: center;width: 100%; overflow: hidden; text-overflow:ellipsis; white-space: nowrap;"><a  class="J_TGoldData" href="${pageContext.request.contextPath }/customer/FrontProductAction_News.do?NewsId=<s:property  value='id'/>"><s:property  value="title" /></a></li>
				</s:iterator>
					
				</ul>       		
       		</div>
       	     	
       		</div>
      

    </div>
    
   



<!--主体 end-->
<!--侧边栏-->
<div class="floatdiv">
    <a href="#" class="floatdiv-kf">客服</a>
    <a href="#" class="floatdiv-icon">

    </a>
    <a href="user_center.html" class="floatdiv-icon"></a>
    <a href="shopping_car.html" class="floatdiv-icon">
       
        <span class='cart_num'>5</span>
    </a>
    <a href="#" class="floatdiv-back">
       
        <span>返回</span>
    </a>
</div>
<!--侧边栏 end-->

<!--页脚-->
<div class="footer">

</div>
<!--页脚 end-->

</body>
</html>