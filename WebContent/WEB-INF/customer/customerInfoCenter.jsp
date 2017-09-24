<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head lang="en">
   
    <title>��������</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/customer_center.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/home.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Myorder.css">
  <%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customerInfoCenter.css"> --%>
   
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/customerinfocenter.js"></script>
     <script src="${pageContext.request.contextPath }/js/address.js"></script>
    <script src="${pageContext.request.contextPath }/js/jsAddress.js"></script>
    <script src="${pageContext.request.contextPath }/js/user_center.js"></script>
	
    
    
</head>


<body>
<!---->
<%@ include file="top.jsp"%>

<div style="width: 100%;height: 551px;background: #FAFAFA;">
	<%@ include file="center_left.jsp"%>
	<div id="ajaxDiv" class="vipcenterrightbox">	
		<div style="width: 100%;height: 33px;background-color: brown;color: white;line-height: 33px;font-size: larger;">&nbsp;&nbsp;&nbsp;&nbsp;�ҵ���Ϣ
		</div>
		<div class="infoTable">	 
			<s:form action="FrontCustomerAction_CustomerInfo.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">
				<table width="57%" border="0" cellpadding="0" cellspacing="0"
					bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
					bordercolorlight="#FFFFFF" style="margin-left: 58px;margin-top: 29px;">
					<tr>
						<input type="hidden" name="customerId" value="<s:property  value="customerId" />" />
							<td height="30" align="left" style="font-size: larger;font-style: italic;">�û����ƣ�</td>
								<td align="left">
							
									<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="name" value="<s:property  value="name" />" size="20" readonly="readonly"> *
								</td>
					</tr>
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">��ʾ���⣺</td>
							<td width="84%" align="left">										
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="question" value="<s:property  value="question" />" size="20"/> �����ҵ����գ� *
							</td>
					</tr>
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">����𰸣�</td>
							<td width="84%" align="left">											
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="answer" value="<s:property  value="answer" />" size="20"/> ����10��4�գ�*
							</td>
					</tr>
									
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">���֤�ţ�</td>
							<td width="84%" align="left">										
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="cardNo" value="<s:property  value="cardNo" />" size="40" readonly="readonly">*
							</td>
					</tr>
									
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">email��</td>
							<td width="84%" align="left">									
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="email" value="<s:property  value="email" />" size="40" >*
							</td>
					</tr>
					<tr align="center">
							<td width="23%" height="30" align="left" style="font-size: larger;font-style: italic;">�绰��</td>
							<td width="84%" align="left">								
								<input style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" type="text" name="phone" value="<s:property  value="phone" />" size="40" >*
								<input type="hidden" style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;" name="pwd" value="<s:property  value="pwd" />" size="40" readonly="readonly">
								<input  type="hidden" style="width: 145px;height: 28px;padding-left: 3px;border: 1px solid #e6e6e6;border-radius: 5px;margin-top: 10px;"  name="address" value="<s:property  value="address" />" size="40" readonly="readonly">
							</td>
					</tr>
									
		
					<tr align="right">
							<td width="100%" colspan="2">
							<s:actionerror/>
							</td>
					</tr>
					<tr>
							<td height="65" align="left" style="padding:5px;">&nbsp;</td>
							<td>
								<input type="submit" class="btn_grey" value="����" />&nbsp; 
								<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
								<input type="button" class="btn_grey" value="����" onclick="history.back(-1)" />
							</td>
					</tr>
				</table>
			</s:form>							
		</div>
		<div style="width: 100%;height: 33px;background-color: brown;color: white;line-height: 33px;font-size: larger;">&nbsp;&nbsp;&nbsp;&nbsp;�ҵĵ�ַ
		</div>
		<!-- ��ַ����ʾ -->		
		<div class="myAddress">
		 <s:iterator id="Frontaddress"  value="#request.FrontAddressList"  >
			<div class="myAdresslist">
				<s:set name="AddressID" value='addressId'/>
				<span class="receiver"><s:property  value="receiver" /></span>
				<span class="contactUserPhone"><s:property  value="contactUserPhone" /></span>
				<span class="contactAddress"><s:property  value="province" /><s:property  value="city" /><s:property  value="area" /><s:property  value="detailAddress" /></span>				
				 <a class="change_address" date_id=<s:property  value='#AddressID' /> data_receiver=<s:property  value='receiver' /> date_contactUserPhone=<s:property  value='contactUserPhone' /> date_province=<s:property  value='province' /> date_city=<s:property  value='city' /> date_area=<s:property  value='area' /> date_detailAddress=<s:property  value='detailAddress' />>�޸�</a> 
		         <a class="change_address" href="${pageContext.request.contextPath }/customer/FrontCustomerAction_addressdelete.do?addressId=<s:property  value='#AddressID' />">ɾ��</a>                                                         
			</div>
		</s:iterator> 
		</div>
		<div class="infoTable">
			<div class='myNdz' onclick='myAd()'>ʹ���µ�ַ</div>
			  <div class='myBjHs'></div>
		      	<div class='myPjTc1'>
		         <div class='dizi'> 
		    		 <h3>����д��ַ</h3>
		    		  
		      		 <s:form class='addr-form' action="FrontAddressAction_saveNewAddress.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">	
		      		 	    <input type="hidden" name="customerId" value="<s:property  value="customerId" />" />  
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
		      			 <input type="submit" class='bc new_add_save' value="����"/>
		       			 <a  class='bc cancel_save'>ȡ��</a> 
		  			 </s:form>			
		       </div>
		    </div>
		</div>	 
		
		
	<div class='dizi' style="display:none"> 
		    		 <h3>���޸ĵ�ַ</h3>
		    		  
		      		 <s:form class='addr-form' action="FrontAddressAction_modifyAddress.do" namespace="/customer" method="post" onsubmit="return checkForm(this)">	
		      		 	      
		     			 <div class='addr-person'> <label>�ջ��ˣ�</label>
		         			 <input id="change_receiver" class='shuru contactPer' type='text' placeholder='�ջ���' /> 
		         			
		         		 </div> 
		     			 <div class='addr-person'>
		         			 <label>�ֻ��ţ�</label> <input id="change_contactUserPhone" class='shuru contactNum' type='text' placeholder='���ֻ�����'/>
		     			 </div> 
		     			 <div class='addr-person'> 
		         			 <label>��ַ��</label>
		       			    <select name="province" id='province'> </select>
		                    <select name="city" id='city'> </select>
		          			 <select name="area" id='area' style='margin:0;'></select>
		                 </div> 
		      			 <div class='form-text'> 
		         			 <textarea name="detailAddress" class='form-control' id='change_detailAddress' placeholder='�������µĵ�ַ'></textarea>
		         			
		     			 </div> 
		      			 <input type="submit" class='bc new_add_save' value="����"/>
		       			 <a  class='bc cancel_save'>ȡ��</a> 
		  			 </s:form>			
		       </div>
		        
 	</div>   
  </div>
	

</body>
</html>