$(document).ready(function(){
	
	$(".home").click(function(){
		
		window.location. href="../customer/FrontProductAction_allproduct.do";
		//<a href="${pageContext.request.contextPath }/customer/FrontCustomerAction_CustomerInfo.do?customerId=${customer.customerId}">个人信息</a>
	});
	//价格初始化
	$('.all_product_price_xiao').each(function(){		
		var price=$(this).attr("data_price");
		$(this).text(price);		
	});
	

/*	$('.all_product_price_xiao').each(function(){
		
			
		amountPrice+=Number($(this).text());
		
	});*/
	//计算总价格 首先要判断是否选中书籍
	$('.CartProductIdArray').click(function(){
		var amountPrice=0;
		$('.CartProductIdArray').each(function(){
			if($(this).is(":checked"))
				{
					var dfs=$(this).siblings("ul").find(".all_product_price_xiao").text();
					//salert(dfs);
					amountPrice+=Number($(this).siblings("ul").find(".all_product_price_xiao").text());
				}	
		
	});
	$("#all_product_price").text(amountPrice);
	})

	 changeNum();
	 
	 
	 
		$("#addOrder").click(function(){
			if($('.CartProductIdArray:checked').length==0){
				alert('请选择商品！');
				return false;
			}else{
				//跳转到购物页面
			}
		});	  
})
	
	
//点击加号 减号
function changeNum(){
	
	$(".right").click(function(){
		
		var obj = $(this);
		var price=$(this).attr("data_price");
		var buyNum = Number($(this).siblings('.amount').val());
		buyNum += 1;
		$(this).siblings('.amount').val(buyNum);		
		var totalprice=buyNum*price;
	
		$(this).parent().siblings('.product_price').find(".all_product_price_xiao").text(totalprice);
		
		var amountPrice=0;
		$('.CartProductIdArray').each(function(){
			
			if($(this).is(":checked"))
				{
					var dfs=$(this).siblings("ul").find(".all_product_price_xiao").text();
					//salert(dfs);
					amountPrice+=Number($(this).siblings("ul").find(".all_product_price_xiao").text());
				}	
		
	});
		$("#all_product_price").text(amountPrice);
	});
	$('.left').click(function(){
		var obj = $(this);
		var price=$(this).attr("data_price");
		if($(this).siblings('.amount').val()=='1'){
			alert("已经是最后一个了");
			return false;
		}else{
			var buyNum = Number($(this).siblings('.amount').val());
			buyNum -= 1;
			$(this).siblings('.amount').val(buyNum);
			var totalprice=buyNum*price;
			$(this).parent().siblings('.product_price').find(".all_product_price_xiao").text(totalprice);
			//$(this).siblings('.all_product_price_xiao').text(totalprice);
			//$("#all_product_price_xiao").text($(".all_product_price_xiao").text());
			//$(".all_product_acount").text($(".amount").val());
			var amountPrice=0;
			$('.CartProductIdArray').each(function(){
				
				if($(this).is(":checked"))
					{
						var dfs=$(this).siblings("ul").find(".all_product_price_xiao").text();
						//salert(dfs);
						amountPrice+=Number($(this).siblings("ul").find(".all_product_price_xiao").text());
					}	
			
		});
			$("#all_product_price").text(amountPrice);
			//$("#all_product_price").text(amountPrice);
		}
	});
	
}