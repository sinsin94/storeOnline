<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div>
	<div class="topbarbgcolor clearfix">
		<div class="wrapper clearfix">
			<ul class="quickMenu fl clearfix">
				<li>
					<s:a namespace="/customer" action="FrontProductAction_index.do">��ӭ�������ֹ�</</s:a>
				</li>
				<li>
					<a href="javascript:window.location.href='${pageContext.request.contextPath }/index.jsp' ">���¼</a>
				</li>
				<li>
					<a>���ע��</a>
				</li>
			</ul>
			<ul class="fr topNav">
				<li>
						<s:a namespace="/customer" action="FrontCustomerAction_Myorder.do">�ҵĶ���</</s:a>
				</li>
				<li>
					<s:a namespace="/customer" action="FrontProductAction_frontCart.do">�ҵĹ��ﳵ</</s:a>
				</li>
				<li>
					<s:a namespace="/customer" action="FrontProductAction_collectionProduct.do">�ҵ��ղ�</</s:a> 
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_CustomerInfo.do?customerId=${customer.customerId}">������Ϣ</a>
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
	   			<input type="submit" id="searchTermLabel" class="searchBtn" value="����">
	   		</div>
	   </s:form>
	</div>
</div>
<!--ͷ�� end-->

<!--����-->
<div class="mainnav">
   <div class="wrapper pr clearfix">
   		<div class="categorys fl pr">
   			<div class="categorysTitle">
   				<a>ȫ����Ʒ����</a>	
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
   					<!-- <li><a>С˵</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>ͯ��</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>ѧϰ����</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>�ٶ����</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>��ѧ</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>��������Ӱ</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li>
   					
   					<li><a>�Ƽ�</a>
   						<ul>
	   						<li><a href="#">�ֵ���С˵</a></li>
	   						<li><a href="#">��������</a></li>
	   						<li><a href="#">���С˵</a></li>
	   						<li><a href="#">�ഺС˵</a></li>
   						</ul>
   					</li> -->
   					
   				</ul>
   			</div>

   		</div>
   		<div class="categoryslist">
   				<ul>
   					<li>���ջ᳡</li>
   					<li>����ר��</li>
   					<li>��Ʒͯ��</li>
   					<li>��Сѧ����</li>
   					<li>���ڻ᳡</li>
   				</ul>   			
   			</div> 
   		<div class="container fl"></div>
   </div>
</div>
    