<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	if (session.getAttribute("customer") == null) {
		response.sendRedirect(path + "/index.jsp");
	}
%>
<html>
<head>
	<title>�ֹ����</title>
	
<!-- <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/goods.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pagination.css">     
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/index.js"></script>
    <script   charset="utf-8" src="${pageContext.request.contextPath }/js/productPageInfo.js"></script>
    <script src="${pageContext.request.contextPath }/js/js.js"></script>
	
</head>
 <style>
   hahah{width:90%;max-width:200px;margin:0 auto;}
    h2{text-align:center;margin-top:5em;}
    .chrome{margin-bottom:4em;}
    .chrome>input{position:relative;margin-right:1em;border:0;background:transparent;color:gold;-webkit-transition:color .8s;
      transition:color .8s;}
    .chrome>input:nth-of-type(1){display:none;}
    .chrome>input:before{position:absolute;content:"��";left:0;top:0;font-size:32px;height:100%;width:100%;background:#FFF;cursor:pointer;}
  /*   .chrome>input:checked~input{color:#666;} */
    .all>input{opacity:0;position:absolute;width:2em;height:2em;margin:0;cursor:pointer;}
    .all>input:nth-of-type(1),
    .all>span:nth-of-type(1){display:none;}
    .all>span{font-size:2em;
      -webkit-transition:color .8s;
      transition:color .8s;
    }
    
  </style>
<body>

	<%@ include file="top.jsp"%>
	
	<div class="top_title clearfix">
    <div class="head_left">
    <div class="idx-product ">
 
     <div class="idx-imgs">
   
        
	    <a href="javascript:void(0);" class='idx-product-img'> <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureTwo" />" /></a>
        <a href="javascript:void(0);" class='idx-product-img'> <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureThree" />" /></a>
        <a href="javascript:void(0);" class='idx-product-img'> <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureFour" />" /></a>
	    <a href="javascript:void(0);" class='idx-product-img'> <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureFive" />" /></a>
 
    </div>  
    <div class="idx-imgsproduct-num">
   
      <div class="idx-smallimg">
    	 <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureTwo" />" />
      </div>
      <div class="idx-smallimg">
    	 <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureThree" />" />
      </div>
      <div class="idx-smallimg">
    	 <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureFour" />" />
      </div>
      <div class="idx-smallimg">
    	 <img src="${pageContext.request.contextPath }/images/<s:property  value="PictureFive" />" />
      </div>
    
     
    </div>

    </div>
      <div class="right_w">
            <div class="right_w_one go_collect"> <a href="${pageContext.request.contextPath }/customer/FrontProductAction_collection.do?ProductId=<s:property  value="ProductId" />">�ղز�Ʒ</a></div>
            <div class="right_w_two"><a href="#">����</a></div>
      </div>
    </div>
    <div class="head_right">
    <div class="biao_t"><h3><s:property  value="details" /></h3></div>
    <div class="headed_wen">
        <p>
        <span><span class="_q">��<span id="sale_price"><s:property  value="currentPrice" /></span></span></span>
        <span>�г��ۼ�</span>
        <s id="market_price">��<s:property  value="marketPrice" /></s>
        </p>
    </div>
     <div class="pin_p">
             <div class="pin_p_he">���ߣ�<span style="color:#c40000"><s:property  value="author" /></span></div>
             <div class="pin_p_he">�����̣�<span style="color:#c40000;"><s:property  value="publisher" /></span></div>
            
             
     </div>
        <div class="pin_jia_x">
          <div class="pin_jia_y">������<span style="color:#c40000;margin-left: 8px;margin-right: 80px;"><s:property  value="productUsed" /></span>|</div>
          <div class="pin_jia_y">�û�����<span style="color:#c40000;margin-left: 8px;margin-right: 80px;"><s:property  value="commentNumer" /></span>|</div>
          <div class="pin_jia_y">���ͻ���<span style="color:#c40000;margin-left: 8px;"><s:property  value="points" /></span></div> 
        </div>
        <div class="gou_s">
          <%--  <div class="shu_liang">
                <span>����������</span>
                <img class="jian" src='images/da_07.png' height="26" width="26">
                <div class="s_l" id='buy_num'>1</div>
                <!-- <input type="number" class="s_l" id='buy_num' value="1"> -->
                <img class="jia" src='images/5_09.png' height="28" width="28">
            </div> --%>
            
            <div class="tb-sku">       								        										                	
				<dl class="tb-amount tm-clear">
				    <dd id="J_Amount" style="margin-top: 29px;margin-left: 27px;">
						<span>����</span>
						<span class="tb-amount-widget mui-amount-wrap">
							<input class="tb-text mui-amount-input" value="1" maxlength="8" title="�����빺����" type="text">
							<span class="mui-amount-btn">
								<span class="mui-amount-increase">+</span>
								<span class="mui-amount-decrease">-</span>
							</span>
							<span class="mui-amount-unit">��</span>
						</span>
						<em id="J_EmStock" class="tb-hidden" style="display: inline;">���<s:property  value="inventory" />��</em>
						<span id="J_StockTips"></span>
					</dd>
				</dl>     	
			</div>
            <div class="li_ji_m">
                <a class="button_one _n buy_now"  href="${pageContext.request.contextPath }/customer/FrontProductAction_waitinfo.do?ProductId=<s:property  value="ProductId" />">��������</a>
                <a class="button_two _n add_cart" href="${pageContext.request.contextPath }/customer/FrontProductAction_cart.do?ProductId=<s:property  value="ProductId" />">���빺�ﳵ</a>
            </div>         
        </div>       
    </div> 
</div> 
<div class="table_right">
        <div class="tab_menu">
            <div class="selected">
                <div class="xian_q detail_tab">��Ʒ����</div>
                <div class="comment_tab">��Ʒ����</div>
                <div class="trade_tab">�ɽ���¼</div>
            </div>
       </div>
        <div class="tab_box clearfix">
            <div class="tab_one clearfix">
		          <div class="product_parameter">
		              <p class="parameter_p"><b>ͼ�������</b></p>
		              <ul>
		              	  <li>��Ʒ���ƣ�<s:property  value="productName" /></li>
		              	  <li>���ߣ�<s:property  value="author" /></li>
		              	  <li>���������ƣ�<s:property  value="publisher" /></li>
		              	  <li>����ʱ�䣺1993-2-6</li>
		              	  <li>���ۣ�<s:property  value="currentPrice" /></li>
		              	  <li>ISBN��ţ� 9787544270878</li>
		              </ul>
		          </div>
           		 <img class="Picturebig" src="${pageContext.request.contextPath }/images/<s:property  value="Picturebig" />" />
            </div>
            <div class="tab_two clearfix">
                <div class="comment_detail">
	                 <s:iterator id="comment"  value="#request.FrontCommentList">
				    	  <div class="xiao_f">
							    <form class="hahah" style="width: 148px;float: left;height: 12px;">
								    <p class="all" style="display: inline-block;">
								     <input type="text" class="starNum" name="starNum" value="<s:property  value="starNum" />" checked="checked" />
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
			                   <span class="shi_jian"><s:property  value="commentTime" /></span>
			                   <span class="ximg_ming"><s:property  value="customerName" /></span>
			                 </div>
			                 <div class="mai_jia_p">
			                      <p><s:property  value="content" /></p>
			                 </div>
			 
	                 </s:iterator>                  
                </div>                
                <div class="jl-page comment_page">
                    <a href="#" class="page-btn comment_last">��һҳ</a>
                    <span class='num_box'></span>
                    <!-- <a href="#" class="page-num">1</a>
                    <a href="#" class="page-num">2</a>
                    <a href="#" class="page-num">3</a>
                    <a href="#" class="page-fh">...</a> -->
                    <a href="#" class="page-btn comment_next">��һҳ</a>
                    <input type="text" id="totalpage" style="display:none">
                </div>
        </div>
            <div class="tab_three clearfix">
                <div class="jiao_yi">
                    <ul>
                        <li>���</li>
                        <li>��Ʒ����</li>
                        <li>��Ʒ����</li>
                        <li>�ɽ��۸�</li>
                        <li>�ɽ�ʱ��</li>
                        <li>�ɽ�״̬</li>
                    </ul>
                </div>
                <div class="jl-con trade_detail clearfix">
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                    <div class="j_zhuantai">
                        <ul>
                            <li>С��</li>
                            <li>�๦��һ���</li>
                            <li>1</li>
                            <li>100</li>
                            <li class="time">2016-04-30&nbsp;12:00:00</li>
                            <li>�ɽ�</li>
                        </ul>
                    </div>
                </div>


                <div class="jl-page trade_page">
                    <a href="#" class="page-btn trade_last">��һҳ</a>
                    <span class="trade_box"></span>
                    <!-- <a href="#" class="page-num">1</a>
                    <a href="#" class="page-num">2</a>
                    <a href="#" class="page-num">3</a>
                    <a href="#" class="page-fh">...</a> -->
                    <a href="#" class="page-btn trade_next">��һҳ</a>
                    <input type="text" id="totalpage1" style="display:none;">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
