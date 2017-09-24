// ��������
var Hup={
	// ����Ajax����
	createXmlHttpRequest:function createXmlHttpRequest() {
		var xmlreq = false;
		if (window.XMLHttpRequest) {
			xmlreq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e1) {
				try {
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					alert(e2);
				}
			}
		}
		return xmlreq;
	},

	// ������Ӧ����
	getReadyStateHandler : function getReadyStateHandler(req) {

		return function() {

			if (req.readyState == 4) {

				if (req.status == 200) {
					//alert(req.responseText);
					var ele=document.getElementsByTagName("html");
					//console.info(ele);
				    ele[0].innerHTML = req.responseText;
				} else {
					alert("HTTP error: " + req.status);
					return false;
				}
			}
		};
	},

	// ��֯���е�����
	getParams2Str : function getParams2Str(sForm) {

		var strDiv = "";

		try {
			var objForm = document.forms[sForm];
			if (!objForm)
				return strDiv;
			var elt, sName, sValue;
			for ( var fld = 0; fld < objForm.elements.length; fld++) {
				elt = objForm.elements[fld];// ��ȡ���е�inputԪ��
				sName = elt.name;// ����
				sValue = "" + elt.value;// ֵ
				// ��װ����
				if (fld == objForm.elements.length - 1)
					strDiv = strDiv + sName + "=" + sValue + "";
				else
					strDiv = strDiv + sName + "=" + sValue + "&";
			}
			// alert(strDiv);
		} catch (ex) {
			return strDiv;
		}
		return strDiv;
	},

	submitActionWithForm : function(action, sForm) {
		// ����Ajax����
		var req =this.createXmlHttpRequest();
		// ����Ajax���¼������������շ�������Ӧ������
		var handlerFunction = this.getReadyStateHandler(req);
		req.onreadystatechange =handlerFunction;
		// �����ӣ�false��ͬ��������ȴ�ֵ�������֮�󣬲�����ִ��
		req.open("POST", action, false);
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		// �����������������������(���е�����)
		var str = this.getParams2Str(sForm);
		req.send(str);
	}
};