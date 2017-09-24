/**
 * Created by administraots on 2016/5/14.
 */
$(document).ready(function(){
  


	
	$('.categorysTitle').hover(function() {
		$(this).siblings(".categorysCon").addClass('subhover');
		$(this).parent().hover(function() {
		}, function() {
			$(".categorysCon").slideUp();
		});
	}, function() {
		$(this).siblings(".categorysCon").removeClass('subhover');
	}).click(function() {
		$(this).parent().find('ul.subnav').slideDown('slow');
	});
 
	// 鼠标移动到含有下拉菜单的li标签上时
	$('#nav2 li').hover(function() {
		$(this).find('span').addClass('subhover').end()
			   .find('ul.subnav').slideDown('slow');
	}, function() {
		$(this).find('span').removeClass('subhover').end()
			   .find('ul.subnav').slideUp('fast');
	});
    //首页banner轮播
    var banner=setInterval(bannerMove,3000);
    $('.idx-imgs-num a').hover(function(){
        clearInterval(banner);
    },function(){
        banner=setInterval(bannerMove,3000);
    });

    $('.idx-imgs-num a').click(function(){
        var index= $('.idx-imgs-num a').index($(this));
        $(this).addClass('cur').siblings('a').removeClass('cur');
        $('.idx-banner-img').stop().eq(index).fadeIn(500).siblings('a').fadeOut(500);
    });
    function bannerMove(){
        var index,let=$('.idx-banner-img').length;
        for(var i=0;i<let;i++){
            if($('.idx-banner-img').eq(i).is(':visible')){
                index=i;
            }
        }
        if(index==let-1){
            $('.idx-banner-img').eq(0).fadeIn(500).siblings('a').fadeOut(500);
            $('.idx-imgs-num a').eq(0).addClass('cur').siblings('a').removeClass('cur');
            return;
        }
        $('.idx-banner-img').eq(index+1).fadeIn(500).siblings('a').fadeOut(500);
        $('.idx-imgs-num a').eq(index+1).addClass('cur').siblings('a').removeClass('cur');
        return;
    };

   
   

});


