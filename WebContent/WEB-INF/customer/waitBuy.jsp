<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>ȷ�ϸ���</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/wait_buy.css">

    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script  charset="utf-8" src="${pageContext.request.contextPath }/js/waitBuy.js"></script>
    <script src="${pageContext.request.contextPath }/js/jsAddress.js" type="text/javascript"></script>
  
    
    
</head>


<body>

<div class="wait_address">

 <h2>ѡ���ջ���ַ</h2>

 <div class="address_list">
  <s:iterator id="add"  value="#request.waitAddressList1">
    <div class="address-datail addr-def">
    	<div class="address_in">
	    	<div class="address_one">
	    	   <span><s:property  value="province" /></span>
	    	   <span class="span-b"><s:property  value="city" /></span>
	    	   <span class="receiver">(<s:property  value="receiver" /> ��)</span>
	    	</div>
	    	<div class="address_two">
	    	   <span class="province"><s:property  value="province" /></span>
	    	   <span class="city"><s:property  value="city" /></span>
	    	   <span class="area"><s:property  value="area" /></span>
	    	   <span class="detailAddress"><s:property  value="detailAddress" /> <s:property  value="contactUserPhone" /></span>
	    	</div>
	    	<div class="address_modifytoolbar">
	    		<a class="modify">�޸�</a>
	    	</div>    	
    	</div>
    	<div class="default-bar">Ĭ�ϵ�ַ</div>
    
    </div>
    </s:iterator>
   <s:iterator id="add"  value="#request.waitAddressList2">
       <div class="address-datail ">
   	   <div class="address_in">
	    	<div class="address_one">
	    	   <span><s:property  value="province" /></span>
	    	   <span class="span-b"><s:property  value="city" /></span>
	    	   <span class="receiver">(<s:property  value="receiver" /> ��)</span>
	    	</div>
	    	<div class="address_two">
	    	   <span class="province"><s:property  value="province" /></span>
	    	   <span class="city"><s:property  value="city" /></span>
	    	   <span class="area"><s:property  value="area" /></span>
	    	   <span class="detailAddress"><s:property  value="detailAddress" /> <s:property  value="contactUserPhone" /></span>
	    	</div>
	    	<div class="address_modifytoolbar">
	    		<a class="modify invisible">�޸�</a>
	    	</div>
    	</div>
    	<div class="default-bar invisible">Ĭ�ϵ�ַ</div>
    </div>
	</s:iterator>
	

 </div>

<div class="infoTable">
			<div class='myNdz' style="margin-top: 14px;" onclick='myAd()'>ʹ���µ�ַ</div>
			  <div class='myBjHs'></div>
		      	<div class='myPjTc1'>
		         <div class='dizi'> 
		    		 <h3>����д��ַ</h3>
		    		  
		      		 <s:form class='addr-form' action="FrontAddressAction_saveNewAddress.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">	
		      		 	      
		     			 <div class='addr-person'> <label>�ջ��ˣ�</label>
		         			 <input name="receiver" class='shuru contactPer' type='text' placeholder='�ջ���' /> 
		         			
		         		 </div> 
		     			 <div class='addr-person'>
		         			 <label>�ֻ��ţ�</label> <input name="contactUserPhone" class='shuru contactNum' type='text' placeholder='���ֻ�����'/>
		     			 </div> 
		     			 <div class='addr-person'> 
		         			 <label>��ַ��</label>
		       			     <select name="province" id='province'> </select>
		                     <select name="city" id='city'> </select>
		          			 <select name="area" id='area' style='margin:0;'></select>
		                 </div> 
		                 
		                 
		      			 <div class='form-text'> 
		         			 <textarea name="detailAddress" class='form-control' id='detailAddress' placeholder='�������µĵ�ַ'></textarea>
		         			
		     			 </div> 
		      			 <input type="submit" class='bc new_add_save' placeholder="����"/>
		       			 <a  class='bc cancel_save'>ȡ��</a> 
		  			 </s:form>			
		       </div>
		    </div>
		</div>
   </div>
   <div class="receive_info clearfix">
        <p>ȷ�϶�����Ϣ��</p>     
   </div> 
    <div style="width:1142px;height:56px;margin: auto;">
    	<div class="pramra-list" style="width: 187px;" >���̱���</div>
    	<div class="pramra-list" style="width: 332px;">��Ʒ����</div>
    	<div class="pramra-list" style="width: 235px;">����</div>
    	<div class="pramra-list" style="width: 181px;">����</div>
    	<div class="pramra-list" style="width: 181px;">С��</div>
    </div>    
     <div id="productDetails" style="margin-left: 95px;">
            <div class="product_display_detail ">
                <ul class="clearfix">
                	
                    <li>
                        <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureOne" />" /><!--��Ʒ����ͼ��СΪ100*100-->
                    </li>
                    <li class="ellipsis">
                        <p class="product_name"><s:property  value="details" /></p>
                        <p class="product_attr">
                            <span>������<s:property  value="productName" /></span>
                            <span>���ߣ�<s:property  value="author" /></span>                         
                        </p>
                        <p class="product_attr">
                            <span>�����̣�<s:property  value="publisher" /></span>
                            
                        </p>
                    </li>
                    <li class="product_price" style="margin-left: 70px"><span class="product_price_span"><s:property  value="currentPrice" /></span>Ԫ</li>
                    <li class="product_num numCount">
                        <span class="operate left">-</span>
                        <input class="amount" value="1">
                        <span class="operate right">+</span>
                    </li>
                    <li class="product_price"><span class="all_product_price"></span>Ԫ</li>
                </ul>
            </div>

            </div>
      <!--��Ʒ������-->
    <div class="product_acount clearfix" style="margin-top: 2px">
        <div class="fl product_acount_1" style="width: 1202px">
            <p class="fr">
                ��ѡ <em><span class="all_product_acount"></span></em>��
                &emsp;�ϼ�:<em>��<span id="all_product_price">0</span></em>
            </p>
        </div>
    </div>
    <!--�ύ����-->
  <s:form  namespace="/customer"  action="FrontProductAction_submitOrder.do"  method="post" >
    <div class="coupons bottom60 clearfix">
        <ul>
            <li class="clearfix">
                <div class="fr">
                    <label>�Ż�ȯ:</label>
                    <select class="border5" id="couponObjInfo">
                        <option id="1" value="0,0">��</option>
                         <s:iterator id="cou"  value="#request.CouponsList"  >
                       	 <option id="<s:property  value="couponId" />" value="<s:property  value="cusMoney" />,<s:property  value="money" />"><s:property  value="couponsName" /></option>
                        </s:iterator>
                         <option id="1" value="1,10">��</option>
                    </select>
                    <em>-<span id="preferential">0</span>Ԫ</em>
                </div>
            </li>
            <li class="clearfix">
                <div class="fr" style="margin-left: 110px;width: 50px;height: 28px">
                    <div id="div1" class="open1">
                        <div id="div2" class="open2"></div>
                    </div>
                </div>
                <p class="fr">����:   ���û���<span id="pointsAmount">100</span>��<span id="pointsChange">1</span>Ԫ</p>
            </li>
            <li class="clearfix">
                <p class="fr">ʵ������˷ѣ�:<em style="margin-left: 0px">��<span  id="actualPay">108</span></em></p>
            </li>
            <li class="clearfix">
            <input type="hidden"  name="totalprice" id="totalprice">
            <input type="hidden"  name="productId" value="<s:property  value="ProductId" />"/> 
            <input type="hidden"  name="bookNum" id="bookNum">            
            <input type="hidden" name="addrecieve" id="addrecieve">
            <!-- <input type="submit"  value="�ύ" />  -->
            <button type="submit"  class="fr border5 cur-p" id="addOrder">�ύ����</button>
            </li>
        </ul>
    </div>
   </s:form>


</body>
</html>