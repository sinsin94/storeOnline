<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>�ҵĹ��ﳵ</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/wait_buy.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
   
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script charset="utf-8"  src="${pageContext.request.contextPath }/js/cart.js"></script>
    <script src="${pageContext.request.contextPath }/js/jsAddress.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="top.jsp"%>
    <div class="cart_list clearfix">
       <div class="cart_top home">�����ҳ</div>
       <div class="cart_top all">ȫ����Ʒ</div>
       <div class="cart_top inventory">������</div>
   </div>
    <div style="width:1142px;height:56px;margin: auto;">
    	<div class="pramra-list" style="width: 187px;" >���̱���</div>
    	<div class="pramra-list" style="width: 332px;">��Ʒ����</div>
    	<div class="pramra-list" style="width: 235px;">����</div>
    	<div class="pramra-list" style="width: 181px;">����</div>

    	<div class="pramra-list" style="width: 181px;">С��</div>
    </div>
    
     <div id="productDetails" style="margin-left: 95px;">
           <s:iterator id="frocartproduct"  value="#request.cartProducts"  >
            <div class="product_display_detail ">
               <input type="checkbox" name="CartProductIdArray" class="CartProductIdArray" value=<s:property  value="ProductId" /> />
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
                    <li class="product_price" style="margin-left: 70px"><span class="product_sinpleprice_span"><s:property  value="currentPrice" /></span>Ԫ</li>
                    <li class="product_num numCount">
                        <span class="operate left" data_price="<s:property  value="currentPrice" />">-</span>
                        <input class="amount" value="1">
                        <span class="operate right" data_price="<s:property  value="currentPrice" />">+</span>
                    </li>
                    <li class="product_price"><span data_price="<s:property  value="currentPrice" />" class="all_product_price_xiao"></span>Ԫ</li>
                     <li><a  href="${pageContext.request.contextPath }/customer/FrontProductAction_cardelete.do?ProductId=<s:property  value='ProductId'/>">ɾ��</a></li>
                </ul>
            </div>
            </s:iterator>

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
    <div class="coupons bottom60 clearfix">
        <ul>
           
           
          
            <li class="clearfix">
                <button class="fr border5 cur-p" id="addOrder">����</button>
            </li>
        </ul>
    </div>
   


</body>
</html>