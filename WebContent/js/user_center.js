$(document).ready(function(){
	//点击书籍进行评论
	$(".click_comment").click(function(){
		//获取书籍图片
		var img=$(this).parent().find("li").eq(0).attr("date_img");
		var newimg="../images/"+img;
		//获取书籍详情
		var title=$(this).parent().find("li").eq(0).attr("date_title");
		//获取书籍名字
		var name=$(this).parent().find("li").eq(1).attr("date_name");
		//获取书籍作者
		var author=$(this).parent().find("li").eq(1).attr("date_author");
		
		//图书Id
		var bookid=$(this).parent().find("li").eq(0).attr("date_bookId");
		
		$(".product_comment img").attr('src',newimg);	
		$(".product_name").text(title);
		$(".book_name").text(name);
		$(".book_author").text(author);
		$('.commentBox').slideDown();
		$(".bookId").val(bookid);
		$(".starNum").val(0);
		$(".starNumInput").click(function(){
		
		$(".starNum").val($(this).val());
		})
		//$(".commentBox").addClass("background_alert");
		
		//弹出框背景变淡
		 // $("body*:not('.commentBox')").addClass("background_alert");
		//$("body").not(".commentBox").addClass("background_alert");
		//$(".commentBox").removeClass("background_alert");
		
	})
	
	
	  
	
})
	