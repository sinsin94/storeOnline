<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>确认付款</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/wait_buy.css">

    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script  charset="utf-8" src="${pageContext.request.contextPath }/js/waitBuy.js"></script>
    <script src="${pageContext.request.contextPath }/js/jsAddress.js" type="text/javascript"></script>
  
    
    
</head>


<body>

<div class="wait_address">

 <h2>选择收货地址</h2>

 <div class="address_list">
  <s:iterator id="add"  value="#request.waitAddressList1">
    <div class="address-datail addr-def">
    	<div class="address_in">
	    	<div class="address_one">
	    	   <span><s:property  value="province" /></span>
	    	   <span class="span-b"><s:property  value="city" /></span>
	    	   <span class="receiver">(<s:property  value="receiver" /> 收)</span>
	    	</div>
	    	<div class="address_two">
	    	   <span class="province"><s:property  value="province" /></span>
	    	   <span class="city"><s:property  value="city" /></span>
	    	   <span class="area"><s:property  value="area" /></span>
	    	   <span class="detailAddress"><s:property  value="detailAddress" /> <s:property  value="contactUserPhone" /></span>
	    	</div>
	    	<div class="address_modifytoolbar">
	    		<a class="modify">修改</a>
	    	</div>    	
    	</div>
    	<div class="default-bar">默认地址</div>
    
    </div>
    </s:iterator>
   <s:iterator id="add"  value="#request.waitAddressList2">
       <div class="address-datail ">
   	   <div class="address_in">
	    	<div class="address_one">
	    	   <span><s:property  value="province" /></span>
	    	   <span class="span-b"><s:property  value="city" /></span>
	    	   <span class="receiver">(<s:property  value="receiver" /> 收)</span>
	    	</div>
	    	<div class="address_two">
	    	   <span class="province"><s:property  value="province" /></span>
	    	   <span class="city"><s:property  value="city" /></span>
	    	   <span class="area"><s:property  value="area" /></span>
	    	   <span class="detailAddress"><s:property  value="detailAddress" /> <s:property  value="contactUserPhone" /></span>
	    	</div>
	    	<div class="address_modifytoolbar">
	    		<a class="modify invisible">修改</a>
	    	</div>
    	</div>
    	<div class="default-bar invisible">默认地址</div>
    </div>
	</s:iterator>
	

 </div>

<div class="infoTable">
			<div class='myNdz' style="margin-top: 14px;" onclick='myAd()'>使用新地址</div>
			  <div class='myBjHs'></div>
		      	<div class='myPjTc1'>
		         <div class='dizi'> 
		    		 <h3>请填写地址</h3>
		    		  
		      		 <s:form class='addr-form' action="FrontAddressAction_saveNewAddress.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">	
		      		 	      
		     			 <div class='addr-person'> <label>收货人：</label>
		         			 <input name="receiver" class='shuru contactPer' type='text' placeholder='收货人' /> 
		         			
		         		 </div> 
		     			 <div class='addr-person'>
		         			 <label>手机号：</label> <input name="contactUserPhone" class='shuru contactNum' type='text' placeholder='新手机号码'/>
		     			 </div> 
		     			 <div class='addr-person'> 
		         			 <label>地址：</label>
		       			     <select name="province" id='province'> </select>
		                     <select name="city" id='city'> </select>
		          			 <select name="area" id='area' style='margin:0;'></select>
		                 </div> 
		                 
		                 
		      			 <div class='form-text'> 
		         			 <textarea name="detailAddress" class='form-control' id='detailAddress' placeholder='请输入新的地址'></textarea>
		         			
		     			 </div> 
		      			 <input type="submit" class='bc new_add_save' placeholder="保存"/>
		       			 <a  class='bc cancel_save'>取消</a> 
		  			 </s:form>			
		       </div>
		    </div>
		</div>
   </div>
   <div class="receive_info clearfix">
        <p>确认订单信息：</p>     
   </div> 
    <div style="width:1142px;height:56px;margin: auto;">
    	<div class="pramra-list" style="width: 187px;" >店铺宝贝</div>
    	<div class="pramra-list" style="width: 332px;">商品属性</div>
    	<div class="pramra-list" style="width: 235px;">单价</div>
    	<div class="pramra-list" style="width: 181px;">数量</div>
    	<div class="pramra-list" style="width: 181px;">小计</div>
    </div>    
     <div id="productDetails" style="margin-left: 95px;">
            <div class="product_display_detail ">
                <ul class="clearfix">
                	
                    <li>
                        <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureOne" />" /><!--商品缩略图大小为100*100-->
                    </li>
                    <li class="ellipsis">
                        <p class="product_name"><s:property  value="details" /></p>
                        <p class="product_attr">
                            <span>书名：<s:property  value="productName" /></span>
                            <span>作者：<s:property  value="author" /></span>                         
                        </p>
                        <p class="product_attr">
                            <span>出版商：<s:property  value="publisher" /></span>
                            
                        </p>
                    </li>
                    <li class="product_price" style="margin-left: 70px"><span class="product_price_span"><s:property  value="currentPrice" /></span>元</li>
                    <li class="product_num numCount">
                        <span class="operate left">-</span>
                        <input class="amount" value="1">
                        <span class="operate right">+</span>
                    </li>
                    <li class="product_price"><span class="all_product_price"></span>元</li>
                </ul>
            </div>

            </div>
      <!--商品结算区-->
    <div class="product_acount clearfix" style="margin-top: 2px">
        <div class="fl product_acount_1" style="width: 1202px">
            <p class="fr">
                已选 <em><span class="all_product_acount"></span></em>件
                &emsp;合计:<em>￥<span id="all_product_price">0</span></em>
            </p>
        </div>
    </div>
    <!--提交订单-->
  <s:form  namespace="/customer"  action="FrontProductAction_submitOrder.do"  method="post" >
    <div class="coupons bottom60 clearfix">
        <ul>
            <li class="clearfix">
                <div class="fr">
                    <label>优惠券:</label>
                    <select class="border5" id="couponObjInfo">
                        <option id="1" value="0,0">无</option>
                         <s:iterator id="cou"  value="#request.CouponsList"  >
                       	 <option id="<s:property  value="couponId" />" value="<s:property  value="cusMoney" />,<s:property  value="money" />"><s:property  value="couponsName" /></option>
                        </s:iterator>
                         <option id="1" value="1,10">无</option>
                    </select>
                    <em>-<span id="preferential">0</span>元</em>
                </div>
            </li>
            <li class="clearfix">
                <div class="fr" style="margin-left: 110px;width: 50px;height: 28px">
                    <div id="div1" class="open1">
                        <div id="div2" class="open2"></div>
                    </div>
                </div>
                <p class="fr">积分:   可用积分<span id="pointsAmount">100</span>抵<span id="pointsChange">1</span>元</p>
            </li>
            <li class="clearfix">
                <p class="fr">实付款（含运费）:<em style="margin-left: 0px">￥<span  id="actualPay">108</span></em></p>
            </li>
            <li class="clearfix">
            <input type="hidden"  name="totalprice" id="totalprice">
            <input type="hidden"  name="productId" value="<s:property  value="ProductId" />"/> 
            <input type="hidden"  name="bookNum" id="bookNum">            
            <input type="hidden" name="addrecieve" id="addrecieve">
            <!-- <input type="submit"  value="提交" />  -->
            <button type="submit"  class="fr border5 cur-p" id="addOrder">提交订单</button>
            </li>
        </ul>
    </div>
   </s:form>


</body>
</html>