
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>�������߿���</title>
	
	 <link type="text/css" href="${pageContext.request.contextPath }/css/register.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js" charset="UTF-8"></script>

</head>
<script type="text/javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("�������¼����!");form.name.focus();return false;
	}

	if(form.pwd.value==""){
		alert("�������¼����!");form.pwd.focus();return false;
	}
	if(form.pwd.value.length<6 || form.pwd.value.length>20){
		alert("����������벻�Ϸ�������������6λ������С�ڵ�20λ!");form.pwd.focus();return false;
	}
	if(form.confimpwd.value==""){
		alert("��ȷ�ϵ�¼����!");form.confimpwd.focus();return false;
	}		
	if(form.pwd.value!=form.confimpwd.value){
		alert("����������ĵ�¼���벻һ�£�����������!");form.pwd.focus();return false;
	}
	if(form.question.value==""){
		alert("�������ܱ����⣡");form.cardNo.focus();return false;
	}
	if(form.answer.value==""){
		alert("�������ܱ��𰸣�");form.cardNo.focus();return false;
	}

	if(form.cardNo.value==""){
		alert("���������֤�ţ�");form.cardNo.focus();return false;
	}
	if(form.cardNo.value.length!=18){
		alert("������Ϸ������֤�ţ�����Ϊ18λ����");form.cardNo.focus();return false;
	}
	if(!isCardNo(form.cardNo.value))
	{
		alert("������Ϸ������֤��!");
		return false;
	}
	var str=form.cardNo.value;
	for(var i=0;i<str.length-1;i++)
	{
	   if(isNaN(str[i]))
	   {
		   
		   alert("������Ϸ������֤��!");
		   form.cardNo.focus();
		   return false;
	   }
	   
	}
	var str1=str[17];
	if(str1>='0' && str1<='9' || str1=='X')
	{
		return true;
	}
	 alert("������Ϸ������֤��!");
	   form.cardNo.focus();
	return false;
	
}
</script>
<body>
 <div class="top1">happing-��</div>
  <div class="register_name">�û�ע��</div>  
   <div style="color:red;width:170px;height:36px;position:fixed;left: 59%;top: 49%;margin:-137px 0 0 -108px ;">
  		    <span>    
				<s:actionerror/>
  				
	 		</span>
    </div> 
     <div class="inputBox">
     <s:form action="FrontCustomerAction_register.do"  namespace="/customer" method="post" onsubmit="return checkForm(this)">
        <p>
            <span>�û���</span>
            <input name="name" value="<s:property  value="name" />" type="text"  placeholder="�������û���">
        </p>
        <div id="error" style="display:none">
            <s:actionerror/>
       </div>
      
        <p>
            <span>����</span>
            <input name="pwd" type="password" value="<s:property  value="name" />"   placeholder="����������">
        </p>
         <p>
            <span>ȷ������</span>
            <input id="confimpwd" size="20" type="password" value="<s:property  value="pwd" />" placeholder="��ȷ�� ����">
         </p>
         <p>
            <span >�ֻ�����</span>
            <input name="phone" size="40" type="text" value="<s:property  value="phone" />" placeholder="�������ֻ�����">
         </p>
         <p>
            <span >��ʾ����</span>
            <input name="question" size="40" type="text" value="<s:property  value="question" />" placeholder="�������ܱ�����">
         </p>
         <p>
            <span >�����</span>
            <input name="answer" size="40" type="text" value="<s:property  value="answer" />" placeholder="�������ܱ���">
         </p>
         <p>
            <span>��֤��</span>
            <input type="text" class="rgst-code vali_phone" placeholder="������֤��">
            <b id="checkCode" style="background-color:#b5b5b5">Bmzk</b>
            <a class='change_code' href='javascript:void(0);'>�����壿��һ��</a>
         </p>
        <p>
            <span >���֤����</span>
            <input name="cardNo" size="40" type="text" value="<s:property  value="cardNo" />" placeholder="�������֤����">
        </p>

        
        <div class="login_certain">
        <input class="register" type="submit" class="btn_grey" value="����" />&nbsp;
        </div >
        <p style="padding-left:210px">�����˺�,<a href="login.html">��¼</a>&nbsp; <a href='index.html'>��һ��</a></p>
         </s:form>
    </div>
 
</body>
</html>
