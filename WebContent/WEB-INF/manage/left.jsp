<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="29" bgcolor="#5898C8"><span class="word_white">&nbsp;��վ��̨����</span>
		</td>
	</tr>
	<tr>
		<td height="4"></td>
	</tr>
</table>
<table width="100%" height="441" border="0" cellpadding="0"
	cellspacing="0" class="tableBorder">
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td width="75%" align="left" class="tableBorder_B">
			<s:a action="UserAction_manager.do" namespace="/manager">����Ա��Ϣ����</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="CustomerAction_index.do">��������Ϣ����</</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="CustomerAction_order.do">�����߶�����ѯ</s:a>
		</td>
	</tr>
	
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="CategoryAction_index.do">һ���������</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="SecondCategoryAction_index.do">�����������</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="ProductAction_index.do">��Ʒ��Ϣ����</s:a>
		</td>
	</tr>
	
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="AddressAction_index.do">��ַ��Ϣ����</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="CouponsAction_index.do">�Ż�ȯ��Ϣ����</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="BannersAction_index.do">banner��Ϣ����</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="NewsAction_index.do">���Ź������</s:a>
		</td>
	</tr>
	<tr>
		<td width="25%" height="32" align="right" class="tableBorder_B">
			<img src="${pageContext.request.contextPath }/images/m_ico.gif" width="11" height="11" />&nbsp;
		</td>
		<td height="32" colspan="2" align="left" class="tableBorder_B">
			<s:a namespace="/manager" action="UserAction_logout.do">�˳���̨����</</s:a>
		</td>
	</tr>
	<tr>
		<td height="217" align="right">&nbsp;</td>
		<td height="217" colspan="2" align="left">&nbsp;</td>
	</tr>
</table>
