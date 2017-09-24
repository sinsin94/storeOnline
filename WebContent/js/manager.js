/**
 * 
 */
$(document).ready(function(){
	
	
//点击添加用户	
	
	
	$(".change").click(function(){

		$('.total').slideDown();
		$(".tablemain").addClass("opa");		
		
		var id=$(this).attr("data_id");
		var username=$(this).attr("data_name");
		var realName=$(this).attr("data_realName");
		var password=$(this).attr("data_psw");
		
		
		$('#userid').val(id);
		$('#realname').val(realName);
		$('#username').val(username);
		$('#password').val(password);
		$('#confimpassword').val(password);
		
	});
	
	$(".close").click(function(){

		$('.total').slideUp();
		$('.total_add').slideUp();
		$(".tablemain").removeClass("opa");		
		
	});
		

	$(".add").click(function(){

		$('.total_add').slideDown();
		$(".tablemain").addClass("opa");		
		
	});
	

	$(".add_page").click(function(){
      // alert("fffffffffffffffffffffff");
		$('.total_add').slideDown();
		$(".tablemain").addClass("opa");		
		
	});
	
	$(".add_coupons").click(function(){
	      // alert("fffffffffffffffffffffff");
			$('.total_add').slideDown();
			$(".tablemain").addClass("opa");		
			
		});
	$(".add_banner").click(function(){
	      //alert("fffffffffffffffffffffff");
			$('.total_add').slideDown();
			$(".tablemain").addClass("opa");		
			
		});
	
	
	
	
	
	$(".change_taoti").click(function(){

		$('.total').slideDown();
		$(".tablemain").addClass("opa");		
		
		var id=$(this).attr("data_id");
		var taotiname=$(this).attr("data_taotiname");
		var sub_name=$(this).attr("data_subname");
		
		
		
		$('#userid').val(id);
		$('#taoti_name').val(taotiname);
		$('#sub_name').val(sub_name);
		
		
	});
	
	
	

});

