$(document).ready(function(){
	  $('.cancel_save').click(function(){
		  $(".myPjTc1").css({"display":""});
		  $(".myBjHs").css({"display":""});
		  
	  });  
	  $(".change_address").click(function(){
		  $(".dizi").css({"display":"block"});
		  addressInit('province', 'city', 'area');
			var id=$(this).attr("date_id");
			var receiver=$(this).attr("data_receiver");
			var contactUserPhone=$(this).attr("date_contactUserPhone");
			var province=$(this).attr("date_province");
			var city=$(this).attr("date_city");
			var area=$(this).attr("date_area");
			var detailAddress=$(this).attr("date_detailAddress");			
			$('#change_receiver').val(receiver);
		})
		 $(".cancel_save").click(function(){
			 $(".dizi").css({"display":"none"});
		 })	
})
	function myAd(){
	// 对地址插件进行初始化
    addressInit('province', 'city', 'area');
		  $(".myPjTc1").css({"display":"block"});
		  $(".myBjHs").css({"display":"block"});
		}