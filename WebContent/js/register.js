
//注册
$(document).ready(function(){
   
	//生产成验证码
	 createCode();
	
    
	 $(".register").click(function(){
		 
		if($(".rgst-code").val() == ""){
			var msg="";
            msg += "验证码不能为空！\n";
            $(".rgst-code").focus();
            alert(msg);
            return false;
        }else if($('.rgst-code').val().toUpperCase() != $('#checkCode').text().toUpperCase()){           
		      msg += "验证码输入错误，请重新输入！！\n";
            $('.rgst-code').focus();
            alert(msg);
            createCode();
            return false;
        }		
		return true;
		
	   });
	
		
	 $(".change_code").click(function(){
	    createCode();
	 });
});

//生成验证码
var code;
function createCode() 
{
 code = "";
 var codeLength = 4; //验证码的长度
 var checkCode = document.getElementById("checkCode");
 var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
 for(var i = 0; i < codeLength; i++) 
 {
  var charNum = Math.floor(Math.random() * 52);
  code += codeChars[charNum];
 }
 if(checkCode) 
 {
  checkCode.className = "code";
  checkCode.innerHTML = code;
 }
}
