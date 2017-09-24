
$(document).ready(function(){
	
	//获取星级
	var starNum=$(".starNum").val();
	for(var i=0;i<=starNum;i++){
		$('.hahah').find("span").eq(i).addClass("gold");		
	}
	changeNum();
	
	$(".go_collect").click(function(){
		alert("已加入收藏夹");
	})
	
		$(".add_cart").click(function(){
		alert("已加入购物车");
	})
    //图片轮播
	
	
	 //首页banner轮播
    var banner=setInterval(bannerMove,3000);
    $('.idx-imgsproduct-num a').hover(function(){
        clearInterval(banner);
    },function(){
        banner=setInterval(bannerMove,3000);
    });

    $('.idx-imgsproduct-num a').click(function(){
        var index= $('.idx-imgsproduct-num a').index($(this));
        $(this).addClass('cur').siblings('a').removeClass('cur');
        $('.ks-imagezoom-wrap').stop().eq(index).fadeIn(500).siblings('a').fadeOut(500);
    });
    function bannerMove(){
        var index,let=$('.idx-product-img').length;
        for(var i=0;i<let;i++){
            if($('.idx-product-img').eq(i).is(':visible')){
                index=i;
            }
        }
        if(index==let-1){
            $('.idx-product-img').eq(0).fadeIn(500).siblings('a').fadeOut(500);
            $('.idx-imgs-num a').eq(0).addClass('cur').siblings('a').removeClass('cur');
            return;
        }
        $('.idx-product-img').eq(index+1).fadeIn(500).siblings('a').fadeOut(500);
        $('.idx-imgs-num a').eq(index+1).addClass('cur').siblings('a').removeClass('cur');
        return;
    };
	
	
	
})


// 点击加号 减号
function changeNum(){
	var buyNum = Number($('.mui-amount-input').val());
	$(".mui-amount-increase").click(function(){
		//alert(buyNum);
		buyNum += 1;
		
		$('.mui-amount-input').val(buyNum);
	});
	$('.mui-amount-decrease').click(function(){
		if($('.mui-amount-input').val() == '0'){
			//alert('已经没有了，不能再减了！');
			return false;
		}else{
			buyNum -= 1;
			$('.mui-amount-input').val(buyNum);
		}
	});
}