//table切换效果
$(function(){
    var $div_li=$("div.selected div");
    $div_li.mousemove(function(){
        $(this).addClass("xian_q")            //当前<li>元素高亮
            .siblings().removeClass("xian_q");  //去掉其它同辈<li>元素的高亮
        var index=$div_li.index(this);  // 获取当前点击的<li>元素 在 全部li元素中的索引。
        $(".tab_box > div")   	//选取子节点。不选取子节点的话，会引起错误。如果里面还有div
            .eq(index).show()   //显示 <li>元素对应的<div>元素
            .siblings().hide(); //隐藏其它几个同辈的<div>元素
    }).hover(function(){
        $(this).addClass("hover");
    },function(){
        $(this).removeClass("hover");
    });
});
$(function(){
    $(".x_img").mousemove(function(){
        $(this).addClass("xiao_y").siblings().removeClass("xiao_y");//加class样式
         var index1=$(".x_img").index(this);
        $(".left_img").eq(index1).show().siblings().hide();//显示隐藏
    });
});

$(function(){
    var ai=$(".you_right>.li_ji_ling");
          ai.click(function(){
           var ta=$(this).text("立即使用");
           $(".b_j_you").eq(0).css("background","url('images/lq.png')no-repeat")
    })
});
//第二张
$(function(){
    var zi=$(".you_right>.li_ji_ling_two");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(1).css("background","url('images/lq.png')no-repeat")
    })
});
//
$(function(){
    var zi=$(".you_right>.li_ji_ling_san");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(2).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_si");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(3).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_wu");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(4).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_liu");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(5).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_qi");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(6).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_ba");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(7).css("background","url('images/lq.png')no-repeat")
    })
});
$(function(){
    var zi=$(".you_right>.li_ji_ling_jiu");
    zi.click(function(){
        var da=$(this).text("立即使用");
        $(".b_j_you").eq(8).css("background","url('images/lq.png')no-repeat")
    })
});




