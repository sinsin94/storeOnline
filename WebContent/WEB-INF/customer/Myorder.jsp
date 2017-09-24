<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>��������</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customer_center.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Myorder.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/user_center.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsAddress.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>

</head>
<style>
   .layer{position:fixed;background:#000;height:100%;width:100%;opacity:0;left:0; top:0; z-index:6;}
   .pic{position:fixed;top:0;right:0;left:0;bottom:0;margin:auto;}
   .wlgz_point{   
	    border-left: 2px dashed red;
	    padding-left: 5px;
	    position: relative;
	    margin-top: 5px;
   }
   .wlgz_point::after {
   		content: " ";
		position: absolute;
		top: 8px;
		left: -6px;
		width: 10px;
		height: 10px;
		border-radius: 50% 50%;
		background-color: rgb(66, 20, 20);
   }
   
   
  <style>
   hahah{width:90%;max-width:200px;margin:0 auto;}
    h2{text-align:center;margin-top:5em;}
    .chrome{margin-bottom:4em;}
    .chrome>input{position:relative;margin-right:1em;border:0;background:transparent;color:gold;-webkit-transition:color .8s;
      transition:color .8s;}
    .chrome>input:nth-of-type(1){display:none;}
    .chrome>input:before{position:absolute;content:"��";left:0;top:0;font-size:32px;height:100%;width:100%;background:#FFF;cursor:pointer;}
    .chrome>input:checked~input{color:#666;}

    .all>input{opacity:0;position:absolute;width:2em;height:2em;margin:0;cursor:pointer;}
    .all>input:nth-of-type(1),
    .all>span:nth-of-type(1){display:none;}
    .all>span{font-size:2em;color:gold;
      -webkit-transition:color .8s;
      transition:color .8s;
    }
    .all>input:checked~span{color:#666;}
    .all>input:checked+span{color:gold;}
  </style>
   
</style>

<body class="asdf">
<!---->
<%@ include file="top.jsp"%>
<div style="width: 100%;height: 551px;background: #FAFAFA;">
	<%@ include file="center_left.jsp"%>
	<div id="ajaxDiv" class="vipcenterrightbox">	
		<div class="nav-wrap">
			<ul id="example-one" class="group">
				<li id="first" class="current_page_item"><a href="javascript:void(0)" onclick="getOrdersByStatus('all')">ȫ������ </a><i class="interval">|</i>
				</li>
				<li id="second" name="myorder"><a href="javascript:void(0)" onclick="getOrdersByStatus('M')">���ύ<i class="interval">|</i> </a>
				</li>
				<li id="third" name="myorder"><a href="javascript:void(0)" onclick="getOrdersByStatus('C')">��֧��<i class="interval">|</i> </a>
				</li>
				<li id="forth" name="myorder"><a href="javascript:void(0)" onclick="getOrdersByStatus('S')">�ѷ��� <i class="interval">|</i> </a>
				</li>
				<li id="fifth" name="myorder"><a href="javascript:void(0)" onclick="getOrdersByStatus('F')">����� <i class="interval">|</i> </a>
				</li>
				<div class="clear"></div>
			<li id="magic-line" style="width: 109px; left: 0px; overflow: hidden;"></li></ul>
		</div>
		<div class="ordersearchoo clearfix">
			<input id="starttime" value="" type="hidden"> <input id="endtime" value="" type="hidden"> <a href="javascript:void(0)" onclick="totalpay()" class="totalpay"></a> <span class="ordersearchoo-span">����������</span> <input class="ordersearchoo-input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')||\'%y-%M-%d\'}'})" readonly="readonly" id="startDate" value="" type="text">
			<span class="ordersearchoo-span ml5 mr5">TO</span> <input class="ordersearchoo-input" onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'%y-%M-%d'})" readonly="readonly" id="endDate" value="" type="text">
			<select id="orderStatus" class="ordersearchoo-morde">
				<option selected="selected" value="all">ȫ��״̬</option>
				<option value="Z">�����˿������</option>
				<option value="X">��ȡ��</option>
				<option value="M">���ύ</option>
				<option value="C">��֧��</option>
				<option value="S">�ѷ���</option>
				<option value="F">�����</option>
				<option value="D">������</option>
				<option value="Y">�ѷ���</option>
				<option value="B">�ѱ���</option>
				<option value="Q">�ѹر�</option>
				<option value="K">���˿�</option>
				<option value="W">���˿�</option>
				<option value="E">ȡ��ʧ��</option>	
			</select> <a class="orderSer ml10" href="javascript:void(0)" onclick="getOrdersByStatusAndTime()">����</a>
		</div>
		<div class="v2_icontent_list" id="contentlist">
			<table class="producttable">
				<tbody>
					<tr>
						<th class="firstbody" width="260px">��Ʒ��Ϣ</th>
						<th style="width: 81px;">���ۣ�Ԫ��</th>
						<th style="width: 51px;">����</th>
						<th style="width: 91px;">�����ܽ��</th>
						<th style="width: 91px;">����״̬</th>
						<th style="width: 84px;" class="lasttbody">���ײ���</th>
					</tr>
				</tbody>
			</table>
			<!-- �㵥���� -->
			 <div id="productDetails">
		         
		        <s:iterator id="all"  value="#request.allcustomerorder"  >
		        
		            <div class="product_display_detail">
		                <ul class="clearfix">
		                 <s:iterator id="all"  value="#request.product"  >
		                    <s:set name="productID" value='ProductId'/>
		                    <li  date_bookId="<s:property  value="#productID" />" date_title="<s:property  value="details" />" date_img="<s:property  value="PictureOne" />">            
		                        <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureOne" />" /><!--��Ʒ����ͼ��СΪ100*100-->
		                    </li>
		                    <li date_title="<s:property  value="title" />" date_name="<s:property  value="productName" />" date_author="<s:property  value="author" />">
		                    	<span class="product_price_span"><s:property  value="currentPrice" />Ԫ</span>
		                    </li>
		                 </s:iterator>
		                    <li date_img="<s:property  value="PictureOne" />"><span class="product_price_span"><s:property  value="bookNum" /></span>��</li>                   
		                    <li class="product_price"><span class="product_price_span"><s:property  value="totalPrice" /></span>Ԫ</li>
		                    <li class="product_price">��֧��</li>                    
		                    <li  class="click_comment">����</li>    
		                </ul>
		                
		            </div>
		            
		          </s:iterator>
		
		      </div>
		
		</div>

    <div class="commentBox">
		<div style="position: absolute;font-size: 19px;margin: 27px 12px 12px 50px;">�鼮����</div>
		
			<div class="product_comment ">
	                <ul class="clearfix">                	
	                    <li>
	                        <img class="img"  ><!--��Ʒ����ͼ��СΪ100*100-->
	                    </li>
	                    <li class="ellipsis">
	                        <p ><span>��Ʒ���飺</span><span class="product_name"></span></p>
	                        <p class="product_attr">
	                            <span>������</span><span class="book_name"></span>                          
	                        </p>
	                        <p>
	                         <span>���ߣ�</span> <span class="book_author"></span>
	                        </p>                      
	                    </li>                   
	                </ul>
	          </div>
          <div style="position: absolute;margin: 190px 0 0 50px;">
          	<span>�Ǽ�����:</span><span></span>
	          <form class="hahah">
				    <p class="all" style="display: inline-block;">
				      <input type="radio" name="b" value="0" checked="checked" />
				      <span>��</span>
				      <input class="starNumInput" type="radio" name="b" value="1" />
				      <span>��</span>
				      <input class="starNumInput" type="radio" name="b" value="2" />
				      <span>��</span>
				      <input class="starNumInput" type="radio" name="b" value="3" />
				      <span>��</span>
				      <input class="starNumInput" type="radio" name="b" value="4" />
				      <span>��</span>
				      <input class="starNumInput" type="radio" name="b" value="5" />
				      <span>��</span>
		   		   </p>    
	         </form>          
          </div>
          
          <s:form class='addr-form' action="FrontCustomerAction_saveComment.do" namespace="/customer" method="post" >
          <input type="hidden" class="starNum" name="starNum" >
          <input type="hidden" name="bookId" class="bookId">
           <div class='form-text' style="position: absolute;margin: 255px 0 0 50px;"> 
		       <textarea class="comment_text" style="border: 1px solid #aaa;" name="newComment" id='detailAddress' placeholder='�������������'></textarea>		         			
		   </div> 
		   <input type="submit" class='bc new_comment_save' value="����"/>
         
          </s:form>
	

	</div>   
  
  
  </div>

</div>



</body>
</html>