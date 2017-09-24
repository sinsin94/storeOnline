<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<div class="myContain clearfix">
  
   <div class="mygreehead"  style="cursor: point;"> 
   </div>
   
    <div class="myGr myKd">
        <div class="myGrLeft myFloat">
            <ul class="myGrLeftUl">
               
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>我的订单</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_Myorder.do">全部订单</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>我的资产</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href='javascript:void(0);'>我的积分</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href='javascript:void(0);'>我的优惠券</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href='javascript:void(0);'>我的分销</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>我的资料</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_CustomerInfo.do?customerId=${customer.customerId}">个人信息</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_resetPwd.do?customerId=${customer.customerId}" >修改密码</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href='complete_info.html'>完善信息</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>我的收藏</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href="${pageContext.request.contextPath }/customer/FrontProductAction_collectionProduct.do" >我的收藏</a> </li>
            </ul>
   
        </div>
        <div class="myGrRight myFloat">
            <!--<div class='myNdz' onclick='myAd()'>使用新地址</div>-->

        </div>
    </div>
</div>