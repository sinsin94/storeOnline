<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>�ֹ���ǡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	 <link rel="stylesheet" type="text/css" href="../css/index1.css"  />
	  <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	  <script type="text/javascript" src="../js/manager.js"></script>
</head>
<script type="text/javascript">
	function check(form) {
		if (form.userName.value == "") {
			alert("���������Ա����!");
			form.userName.focus();
			return;
		}
		
		if (form.realName.value == "") {
			alert("���������Ա����!");
			form.userName.focus();
			return;
		}
		if (form.password.value == "") {
			alert("���������Ա����!");
			form.password.focus();
			return;
		}
		if (form.confimpassword.value == "") {
			alert("��ȷ�Ϲ���Ա����!");
			form.confimpassword.focus();
			return;
		}
		
		if (form.confimpassword.value != form.password.value) {
			alert("����������Ĺ���Ա���벻һ�£�����������!");
			form.confimpassword.focus();
			return;
		}
		if (form.password.value.length<6||form.password.value.length>20) {
			alert("����������벻�Ϸ�������������6λ������С�ڵ�20λ!");
			form.password.focus();
			return;
		}
		//�жϵ�ǰ�༭�û������Ƿ��޸�������
	   
		form.submit();
	
		//�رմ���	 
	//	refreshOpener();
	}
</script>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="176" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" align="right" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="70%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">����Ա��Ϣ���� &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/images/m_ico1.gif" width="5" height="9">
										��ǰ����Ա��${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="92%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%" height="30" align="right">
										<img src="${pageContext.request.contextPath }/images/add.gif" width="19" height="18">&nbsp;
									</td>
									<td width="15%">
										<a class="add">��ӹ���Ա</a>
									</td>
								</tr>
							</table>
							<table width="91%" border="1" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
								bordercolorlight="#67A8DB">
								<tr align="center" bgcolor="#A8D8FC">
									<td width="42%" height="26" bgcolor="#B2D6F1">��¼��</td>
									<td width="42%" height="26" bgcolor="#B2D6F1">����Ա����</td>
									<td width="8%" bgcolor="#B2D6F1">�޸�</td>
									<td width="8%" bgcolor="#B2D6F1">ɾ��</td>
									
								</tr>
								
								<s:iterator id="admin"  value="#request.users">
									<tr align="center">
										<s:set name="adminID" value='id'/>
										<td><s:property  value="userName"/></td>
										<td><s:property  value="realName"/></td>
									
										<td>
											<!--  <a href="#" onclick="window.open('${pageContext.request.contextPath }/manager/UserAction_edit.do?id=<s:property  value='#adminID'/>','','height=220,width=320')">�޸�</a>-->
											<a class="change" data_id=<s:property  value='#adminID'/> data_name=<s:property  value='userName'/> data_realname=<s:property  value='realName'/>  data_psw=<s:property  value='password'/>>�޸�</a></td>
										</td>
										<td>
											<a href="javascript:if(confirm('ȷʵҪɾ����?'))location='UserAction_delete.do?id=<s:property  value="#adminID" />'" >ɾ��</a>
										</td>
									
									</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	 
	 
	 <div class="total"  >

				 <div class="denglu">
				 	<p class="login_head">����Ա��Ϣ�޸�</p>
           			 <div class="clear"></div>
           			 
				    <s:form action="UserAction_update.do" namespace="/manager" method="post" id="managerForm" >
					    <table>
							<tr>
								<td width="167" height="30" align="right">��¼&nbsp;�˻���</td>
								<td  width="167" class="entry">
									<s:hidden name="id" readonly="true" id="userid"/>
									<input name="userName" id="username" readonly="true"/>											
								</td>
						   </tr>
					    	<tr>
								<td width="167" height="30" align="right">����Ա���ƣ�</td>
								<td  width="167" class="entry">
									<input name="realName" id="realname" />
								</td>
							</tr>
							<tr>
								<td width="167" height="30" align="right">����Ա���룺</td>
								<td  width="167" class="entry">
									<input type="password" name="password" showPassword="true" id="password"/>
									<input type="hidden" name="ischange" value="<s:property  value="password"/>">
								</td>
							</tr>
							<tr>
								<td width="167" height="30" align="right">ȷ��  ���룺</td>
								<td  width="167" class="entry">
									<input  type="password" name="confimpassword" showPassword="true" id="confimpassword"/>
								</td>
							</tr>
							<tr>
								<td height="30" align="center">&nbsp;</td>
								<td>
									<input type="button" class="btn_grey" value="����"	onclick="check(managerForm)" /> &nbsp; 
									<input type="button" class="btn_grey close" value="�ر�"  />
								</td>
							</tr>
						</table>
			  	</s:form>
								
        </div>	
	 </div>
	 
     <div class="total_add" >
        <div class="denglu1">
            <p class="login_head1" >��ӹ���Ա</p>
            <div class="clear1"></div>
            
				<form action="${pageContext.request.contextPath }/manager/UserAction_doAdd.do" method="post" id="managerForm_add" >
			      	<table height="116" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td  height="30" align="right">��¼&nbsp;�˻���</td>
							<td width="167" class="entry">
							<input name="userName" type="text"/>
							</td>
						</tr>
						<tr>
							<td width="167" height="30" align="right">����Ա���ƣ�</td>
							<td width="167" class="entry">
								<input name="realName" type="text"/>
							</td>
						</tr>
						<tr>
							<td width="167" height="30" align="right">����Ա���룺</td>
							<td  width="167" class="entry">
								<input name="password" type="password" />
							</td>
						</tr>
						<tr>
							<td width="167" height="30" align="right">ȷ��   ���룺</td>
							<td  width="167" class="entry">
								<input name="confimpassword" type="password" />
							</td>
						</tr>
						<tr>
							<td height="30" align="center">&nbsp;</td>
							<td>
								<input type="button"  class="btn_grey" value="����"  onclick="check(managerForm_add)" /> &nbsp; 
								<input type="button" class="btn_grey close" value="�ر�" />
							</td>
						</tr>
					</table>
				</form>
         
                
        </div>
    </div>
	<%-- <%@ include file="copyright.jsp"%> --%>
</body>
</html>
