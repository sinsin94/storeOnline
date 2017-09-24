<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div>
	<div class="topbarbgcolor clearfix">
		<div class="wrapper clearfix">
			<ul class="quickMenu fl clearfix">
				<li>
					<s:a namespace="/customer" action="FrontProductAction_index.do">欢迎，来的乐购</</s:a>
				</li>
				<li>
					<a href="javascript:window.location.href='${pageContext.request.contextPath }/index.jsp' ">请登录</a>
				</li>
				<li>
					<a>免费注册</a>
				</li>
			</ul>
			<ul class="fr topNav">
				<li>
						<s:a namespace="/customer" action="FrontCustomerAction_Myorder.do">我的订单</</s:a>
				</li>
				<li>
					<s:a namespace="/customer" action="FrontProductAction_frontCart.do">我的购物车</</s:a>
				</li>
				<li>
					<s:a namespace="/customer" action="FrontProductAction_collectionProduct.do">我的收藏</</s:a> 
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_CustomerInfo.do?customerId=${customer.customerId}">个人信息</a>
				</li>
			</ul>
		</div>
	</div>

</div>

<div class="header">
	<div>
	   <s:form id="searchBox" namespace="/customer"  action="FrontProductAction_search.do"  method="post" >
	   		<div id="searchTermWrapper" class="search clearfix">
	   		
	   			<input id="searchTermWrapper" class="searchText" name="key">
	   			<input type="submit" id="searchTermLabel" class="searchBtn" value="搜索">
	   		</div>
	   </s:form>
	</div>
</div>
<!--头部 end-->

<!--导航-->
<div class="mainnav">
   <div class="wrapper pr clearfix">
   		<div class="categorys fl pr">
   			<div class="categorysTitle">
   				<a>全部商品分类</a>	
   				 <ul class="nav" id="nav2">
   				    <s:iterator id="nav"  value="#request.FrontCategoryList">
   				    
	   				    <li>
	   				     <s:set name="id" value='id'/>	
	   				        <a><s:property  value="categoryName" /></a>
	   						<ul>	
	   						  <s:iterator  value="#request.secondcategorys" >
		   						<li><a  href="${pageContext.request.contextPath }/customer/FrontProductAction_categoryProduct.do?id=<s:property  value='id'/>"><s:property  value="secondCategoryName" /></a></li>
		   					  </s:iterator> 
	   						
	   						 <%--  <s:iterator value="#request.FrontSecondCategoryList" >
		   						<li><a href="#"><s:property  value="secondCategoryName" /></a></li>
		   					  </s:iterator> --%>
	   						</ul>
	   					</li>
   					</s:iterator>
   					<!-- <li><a>小说</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>童书</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>学习考试</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>少儿早教</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>文学</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>艺术与摄影</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li>
   					
   					<li><a>科技</a>
   						<ul>
	   						<li><a href="#">现当代小说</a></li>
	   						<li><a href="#">世界名著</a></li>
	   						<li><a href="#">情感小说</a></li>
	   						<li><a href="#">青春小说</a></li>
   						</ul>
   					</li> -->
   					
   				</ul>
   			</div>

   		</div>
   		<div class="categoryslist">
   				<ul>
   					<li>文艺会场</li>
   					<li>备考专区</li>
   					<li>精品童书</li>
   					<li>中小学辅导</li>
   					<li>大众会场</li>
   				</ul>   			
   			</div> 
   		<div class="container fl"></div>
   </div>
</div>
    