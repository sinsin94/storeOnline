function LTrim(str) 
{ 
	var i; 
	for(i=0;i<str.length;i++) 
	{ 
	if(str.charAt(i)!=" "&&str.charAt(i)!="?")break; 
	} 
	str=str.substring(i,str.length); 
	return str; 
} 

function RTrim(str) 
{ 
	var i; 
	for(i=str.length-1;i>=0;i--) 
	{ 
		if(str.charAt(i)!=" "&&str.charAt(i)!="?")break; 
	} 
	str=str.substring(0,i+1); 
	return str; 
} 
//��ȥ���ҿո�
function Trim(str) 
{ 
	return LTrim(RTrim(str)); 
} 
// �˳�ϵͳ
function quit(){
	if(confirm("���Ҫ�˳�ϵͳ��?")){
		window.location.href="logout.jsp";
	}
}

// �������
function checkNumber(theObj)
{
	if(typeof(theObj.value)!="undefined"&&theObj.value!=""&&!isNaN(theObj.value))
	{
		return true;
	}
	return false;
}

// �رնԻ���
function refreshOpener(){

    // opener.location.href=sHref;
    opener.location.reload();
    window.close();
}
