<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<div class="myContain clearfix">
  
   <div class="mygreehead"  style="cursor: point;"> 
   </div>
   
    <div class="myGr myKd">
        <div class="myGrLeft myFloat">
            <ul class="myGrLeftUl">
               
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>�ҵĶ���</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_Myorder.do">ȫ������</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>�ҵ��ʲ�</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href='javascript:void(0);'>�ҵĻ���</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href='javascript:void(0);'>�ҵ��Ż�ȯ</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href='javascript:void(0);'>�ҵķ���</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>�ҵ�����</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_CustomerInfo.do?customerId=${customer.customerId}">������Ϣ</a></li>
                <li class="myGrLeftUlColor1 myJz myXhx"><a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_resetPwd.do?customerId=${customer.customerId}" >�޸�����</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href='complete_info.html'>������Ϣ</a></li>
                <li class="myGrLeftUlColor  myJz"><a href='javascript:void(0);'>�ҵ��ղ�</a></li>
                <li class="myGrLeftUlColor1 myJz"><a href="${pageContext.request.contextPath }/customer/FrontProductAction_collectionProduct.do" >�ҵ��ղ�</a> </li>
            </ul>
   
        </div>
        <div class="myGrRight myFloat">
            <!--<div class='myNdz' onclick='myAd()'>ʹ���µ�ַ</div>-->

        </div>
    </div>
</div>