$(document).ready(function(){
	//点击提交订单	
	 changeNum();	 
	 //根据价格判断优惠价是否可用
	 var obj=document.getElementById('couponObjInfo');
	 var index=obj.length; //select表单的长度
	 for(var i=0;i<=index-1;i++){
		 var val = obj.options[i].value;	
		 var aa= val.split(",");
		 var a=aa[0];//优惠劵金额
		 var b=aa[1];//满额
		// alert(b);
		 var c=Number($(".all_product_price").text());
		 if(c<b)
		   {			
			 obj.options[i].disabled=true;		
		   }else{
			//   alert(123);
			   obj.options[i].disabled=false;			   
		   }		
	 }

     //价格初始化，总金额
	  //书金额
	  var bookprice=Number($(".all_product_price").text());
	  //快递金额
	  var expressprice=Number($("#courier").text());	
	  //优惠劵		 
	  var couponprice= Number($("#preferential").text());//0
	  //积分
	  //var points= $("#pointsChange").text()
	  //向隐藏框内值
	  $("#actualPay").text(bookprice+expressprice-couponprice);
	  var totalprice= $("#actualPay").text();
	  $("#totalprice").val(totalprice);
	  $("#bookNum").val($(".amount").val());	  
	  //初始化地址
	  $(".addr-def").addClass("addcss");
		var province =$(".addr-def").find(".province").text();
		var city =$(".addr-def").find(".city").text();
		var area =$(".addr-def").find(".area").text();
		var detailAddress =$(".addr-def").find(".detailAddress").text();
		var receiver=$(".addr-def").find(".receiver").text();
		$('#addrecieve').val(province+city+area+detailAddress+receiver);
	  //点击优惠券,价格变化
	  $('#couponObjInfo').click(function(){
		  var options=$("#couponObjInfo option:selected"); 		
		     var val = options.val();	
			 var aa= val.split(",");
			 var a=aa[0];//优惠劵金额
			 var b=aa[1];//满额			
		  $("#preferential").text(a);
          //书金额
		  var bookprice=Number($(".all_product_price").text());
		  //快递金额
		  var expressprice=Number($("#courier").text());
		 
		  //优惠劵		 
		  var couponprice= Number($("#preferential").text());
		  //积分
		  //var points= $("#pointsChange").text()
		  $("#actualPay").text(bookprice+expressprice-couponprice);
		  var totalprice= $("#actualPay").text();
		  $("#totalprice").val(totalprice);
		  
		 
	  });	
	  //点击快递金额
	  
	  
	  
	  //积分
	  var points=$("#pointsAmount").text()  
	  $("#pointsChange").text(points/10);

	  $('.cancel_save').click(function(){
		  $(".myPjTc1").css({"display":""});
		  $(".myBjHs").css({"display":""});
		  
	  });
     //总金额
	  
	  //$("#actualPay").text();
	  
	  $(".change_address").click(function(){
			
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
		//选择地址
		 $(".address-datail").click(function(){
			 $(this).addClass("addcss");
			 $(this).siblings(".address-datail").removeClass("addcss");
			var province =$(this).find(".province").text();
			var city =$(this).find(".city").text();
			var area =$(this).find(".area").text();
			var detailAddress =$(this).find(".detailAddress").text();
			var receiver=$(this).find(".receiver").text();

			$('#addrecieve').val(province+city+area+detailAddress+receiver);
		})
})
function myAd(){
	// 对地址插件进行初始化
    addressInit('province', 'city', 'area');
		  $('.myPjTc1 input').val('');
		  $('.myPjTc1 textarea').val('');
		  $(".myPjTc1").css({"display":"block"});
		  $(".myBjHs").css({"display":"block"});
		}
//点击加号 减号
function changeNum(){
	//书单价
	var price=$(".product_price_span").text();
	//书数量
	var buyNum = Number($('.amount').val());
	//纯书总价
	var totalprice=buyNum*price;
	$('.all_product_price').text(totalprice);
	$("#all_product_price").text($(".all_product_price").text());
	$(".all_product_acount").text($(".amount").val());
	$(".right").click(function(){
	//邮费金额的判断
		   var num=$(".all_product_acount").text();
		   if(num<8){
			   $("#courier").text(10);
		   }else{
			   $("#courier").text(12);
		   }
		buyNum += 1;
		$('.amount').val(buyNum);	
		var price=$(".product_price_span").text();
		var totalprice=buyNum*price;
		$('.all_product_price').text(totalprice);
		$("#all_product_price").text($(".all_product_price").text());
		$(".all_product_acount").text($(".amount").val());
		 //根据价格判断优惠价是否可用
		 var obj=document.getElementById('couponObjInfo');
		 var index=obj.length; //select表单的长度
		 for(var i=0;i<=index-1;i++){
			 var val = obj.options[i].value;	
			 var aa= val.split(",");
			 var a=aa[0];//优惠劵金额
			 var b=aa[1];//满额
			// alert(b);
			 var c=Number($(".all_product_price").text());
			 if(c<b)
			   {			
				 obj.options[i].disabled=true;		
			   }else{
				//   alert(123);
				   obj.options[i].disabled=false;
				   
			   }
			
		 }

		$("#bookNum").val($(".amount").val());
		  //书金额
		  var bookprice=Number($(".all_product_price").text());
		  //快递金额
		  var expressprice=Number($("#courier").text());		
		  //优惠劵		 
		  var couponprice= Number($("#preferential").text());
		  //积分
		  //var points= $("#pointsChange").text()
		  $("#actualPay").text(bookprice+expressprice-couponprice);
		  $("#actualPay").text(bookprice+expressprice-couponprice);
		  var totalprice= $("#actualPay").text();
		  $("#totalprice").val(totalprice);
		  $('#couponObjInfo').click(function(){
			  var options=$("#couponObjInfo option:selected"); 
				
			     var val = options.val();	
				 var aa= val.split(",");
				 var a=aa[0];//优惠劵金额
				 var b=aa[1];//满额
		
			  $("#preferential").text(a);
	          //总金额
			  //书金额
			  var bookprice=Number($(".all_product_price").text());
			  //快递金额
			  var expressprice=Number($("#courier").text());
			  //优惠劵		 
			  var couponprice= Number($("#preferential").text());
			  //积分
			  var points= Number($("#pointsChange").text());
			 // $("#actualPay").text(bookprice+expressprice+couponprice+points);
			  $("#actualPay").text(bookprice+expressprice-couponprice);
			  var totalprice= $("#actualPay").text();
			  $("#totalprice").val(totalprice);
			
		  });	  
	});
	$(".left").click(function(){
		//邮费金额的判断
			   var num=$(".all_product_acount").text();
			   if(num<8){
				   $("#courier").text(10);
			   }else{
				   $("#courier").text(12);
			   }
			   if($('.amount').val() == '0'){
					alert('已经没有了，不能再减了！');
					return false;
			   }else{

			buyNum -= 1;
			   }
			$('.amount').val(buyNum);	
			var price=$(".product_price_span").text();
			var totalprice=buyNum*price;
			$('.all_product_price').text(totalprice);
			$("#all_product_price").text($(".all_product_price").text());
			$(".all_product_acount").text($(".amount").val());
			 //根据价格判断优惠价是否可用
			 var obj=document.getElementById('couponObjInfo');
			 var index=obj.length; //select表单的长度
			 for(var i=0;i<=index-1;i++){
				 var val = obj.options[i].value;	
				 var aa= val.split(",");
				 var a=aa[0];//优惠劵金额
				 var b=aa[1];//满额
				// alert(b);
				 var c=Number($(".all_product_price").text());
				 if(c<b)
				   {			
					 obj.options[i].disabled=true;		
				   }else{
					//   alert(123);
					   obj.options[i].disabled=false;
					   
				   }
				
			 }

			$("#bookNum").val($(".amount").val());
			  //书金额
			  var bookprice=Number($(".all_product_price").text());
			  //快递金额
			  var expressprice=Number($("#courier").text());		
			  //优惠劵		 
			  var couponprice= Number($("#preferential").text());
			  //积分
			  //var points= $("#pointsChange").text()
			  $("#actualPay").text(bookprice+expressprice-couponprice);
			  $("#actualPay").text(bookprice+expressprice-couponprice);
			  var totalprice= $("#actualPay").text();
			  $("#totalprice").val(totalprice);
			  $('#couponObjInfo').click(function(){
				  var options=$("#couponObjInfo option:selected"); 
					
				     var val = options.val();	

					 var aa= val.split(",");
					 var a=aa[0];//优惠劵金额
					 var b=aa[1];//满额
					
					
				  $("#preferential").text(a);
		          //总金额
				  //书金额
				  var bookprice=Number($(".all_product_price").text());
				  //快递金额
				  var expressprice=Number($("#courier").text());
				  //优惠劵		 
				  var couponprice= Number($("#preferential").text());
				  //积分
				  var points= Number($("#pointsChange").text());
				 // $("#actualPay").text(bookprice+expressprice+couponprice+points);
				  $("#actualPay").text(bookprice+expressprice-couponprice);
				  var totalprice= $("#actualPay").text();
				  $("#totalprice").val(totalprice);
				
			  });	  
		});
}