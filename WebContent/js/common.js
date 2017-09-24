/**
 * Created by administraots on 2016/5/14.
 */

var storeUrl = "../../yishangshopBG/admin/images/store/";//楼层图片地址
var productUrl = "../../yishangshopBG/admin/images/product/";//商品图片地址
var productDetailUrl = "../../yishangshopBG/admin/images/product/productDetail/";//五张商品大图地址
var enterpriseUrl = "../../yishangshopBG/admin/images/enterprise/";//logo、二维码等配置图片位置
var bannerUrl = "../../yishangshopBG/admin/images/banner/";//BANNER图片位置
var bannerHtmlUrl = "../../yishangshopBG/admin/webPage/";//BANNER页面位置
var headerUrl = "../../yishangshopBG/admin/images/userImage/";//用户头像路径
var commentUrl = "../../yishangshopBG/admin/images/eval/";//评价图片位置
var userNick = "";//登录后的顶部昵称
var userPhone = "";//登录后的用户电话
var logo = "";//公司logo
var name = "";//公司名称
var phone = "";//联系电话
var clock = '';
var nums = 30;
var btn;

//支付宝支付账户信息
var alipay_seller_email = "guoyushan@yishangkeji.cn";//支付宝收款账号
var alipay_subject="移商科技";
// 定时器
function sendCode(thisBtn)
{
    btn = thisBtn;
    btn.disabled=true; //将按钮置为不可点击
    btn.style.backgroundColor='#fff';
    btn.style.color='#d8d8d8';
    btn.style.borderColor='#d8d8d8';
    btn.value = nums+'s';
    clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop()
{
    nums--;
    if(nums > 0){
        btn.value = nums+'s';
    }else{
        clearInterval(clock); //清除js定时器
        btn.value='重新获取';
        btn.disabled = false;
        btn.style.backgroundColor='#fff';
        btn.style.color='#fe5002';
        btn.style.borderColor='#fe5002';
        nums = 30; //重置时间
    }
}




//获取地址栏传递的参数
function searchData(){
    var searchStr = window.location.search.substring(1);
    var searchObject = {};
    if(searchStr.indexOf("&") != -1){
        var searchArr = searchStr.split("&");
        $.each(searchArr,function(key,val){
            var arr = val.split("=");
            searchObject[arr[0]] = arr[1];
        }); 
    }else{
        var searchArr = searchStr.split("=");
        searchObject[searchArr[0]] = searchArr[1];
    }
    return searchObject;
}


//弹出窗口垂直居中
function showDiv(obj,bj){
  $(obj).show();
  $(bj).show();
  center(obj);
  $(window).scroll(function(){
    center(obj);
  });
  $(window).resize(function(){
    center(obj);
  }); 
  $('.myGb').click(function(){
    $(obj).hide();
    $(bj).hide();
  })
}
function center(obj){
  var windowHeight = $(window).height();//获取当前窗口高度   
  var windowWidth = $(window).width();//获取当前窗口宽度 
  var popupHeight = $(obj).height();   
  var popupWidth = $(obj).width();   

  $(obj).css({   
    "position": "absolute",   
    "top": (windowHeight-popupHeight)/2+$(document).scrollTop(),   
    "left": (windowWidth-popupWidth)/2   
  });  
}

//上传图片
function loadImg(obj){
    var src = obj.files[0];//获取文件
    var reader = new FileReader();
  reader.onloadend = function(e){
    var showCanvas = obj.parentNode.querySelector('.loadimg_showcanvas');
    var show_ctx = showCanvas.getContext('2d');         
        show_ctx.clearRect(0,0,100,100);//清空画布
        var show_img = new Image();//预览画布效果
        show_img.onload=function(){
            var x,y,px,py;
            if(show_img.width >= show_img.height){
                x = 100;
                y = show_img.height*100/show_img.width;
                px = 0;
                py = 100/2 - y/2;
            }else{
                y = 100;
                x = show_img.width*100/show_img.height;
                py = 0;
                px = 100/2 - x/2
            }
            show_ctx.drawImage(show_img,0,0,show_img.width,show_img.height,px,py,x,y);
        };
        show_img.src = e.target.result;     

    obj.parentNode.style.background = 'rgba(255,255,255,0)';
    obj.parentNode.querySelector('.loadimg_base64').value=encodeURIComponent(e.target.result);
    // alert('这'+obj.parentNode.querySelector('.loadimg_base64').value);
    };
    reader.readAsDataURL(src);
    // alert($('.loadimg_base64').val());
}

//上传头像
function loadHeader(obj){
    // $(obj).siblings('img').removeAttr('src');
    var src = obj.files[0];//获取文件
    var reader = new FileReader();
    reader.onloadend = function(e){
        var showCanvas = obj.parentNode.querySelector('.loadimg_showcanvas');
        var show_ctx = showCanvas.getContext('2d');
        show_ctx.clearRect(0,0,100,100);//清空画布
        var show_img = new Image();//预览画布效果
        show_img.onload = function() {
            show_ctx.drawImage(show_img,0,0,100,100);
        };
        show_img.src = e.target.result;
        obj.parentNode.style.background = 'rgba(255,255,255,0)';
        obj.parentNode.querySelector('.loadimg_base64').value=encodeURIComponent(e.target.result);
    };
    reader.readAsDataURL(src);
    // alert($('.loadimg_base64').val());
}
// 获取图片
function defaultImg(id,src){
    // alert('defaultimg');
    var obj = document.querySelector("#"+id);//canvas DOM
    var show_img = new Image();
    obj.getContext('2d').clearRect(0,0,100,100);
    show_img.onload=function(){
        // alert('onload');
        var x,y,px,py;
        if(show_img.width >= show_img.height){
            x = 100;
            y = show_img.height*100/show_img.width;
            px = 0;
            py = 100/2 - y/2;
        }else{
            y = 100;
            x = show_img.width*100/show_img.height;
            py = 0;
            px = 100/2 - x/2
        }
        obj.getContext('2d').clearRect(0,0,100,100);
        // setTimeout(function(){
        //  obj.getContext('2d').drawImage(show_img,0,0,show_img.width,show_img.height,px,py,x,y);
        // },2000);
        obj.getContext('2d').drawImage(show_img,0,0,show_img.width,show_img.height,px,py,x,y);
        // setTimeout(function(){
        //  var str = encodeURIComponent(obj.toDataURL("image/png"));
        //  // alert('试试'+str);
        //  obj.parentNode.querySelector('.loadimg_base64').value = str;
        // },2000);
    }
    // alert('wanchegn');
    show_img.src = src;
}




// 有商品分类的地方右边框与商品分类高度相同
function getHeight(){
    var flHeight = $('.fl-con').height();
    $('.fl-con-secd').css('minHeight',flHeight);
    $('.ys-spsx-con').css('minHeight',flHeight);
    // $('.ys-spsx-con').hide();
}

$(document).ready(function(){
    // getHeight();
    //全部商品页checkbox
    $(".spsx-checkbox").click(function(){
        if($(this).find("input").is(":checked")){
            $(this).addClass("select");
        }else{
            $(this).removeClass("select");
        }
    })
});
$(function(){
    $('.cart_num').text(0);
	getHeadFootInfo();
    /****
        添加页面跳转
    ***/
    // 完善信息后点击提交
    $('.sub_info').click(function(){
        window.location.href='user_center.html';
    });
    // 我的收藏点击商品名
    // $('.myScLi2').click(function(){
    //     window.location.href='goods_details.html';
    // })
    
});

function getHeadFootInfo(){
    // 获取页头，页脚，侧边栏等配置信息 
    $.ajax({
        'url':'enterpriseHandle.action',
        'type':'post',
        'async':false,
        'data':{
            'action':"getEnterpriseInfo"
        },
        success:function(result){
            if(result.mes == '操作成功'){
                logo = enterpriseUrl+result.propertyObj[0];
                name = result.propertyObj[1];
                if(result.propertyObj[4]!=null){
                    phone = result.propertyObj[4];
                }
                getHead(logo,name);
                if(result.propertyObj[8] == '' || result.propertyObj[8] == null){
                    beforeLogin(phone);
                }else{
                    userNick = result.propertyObj[6];
                    userPhone = result.propertyObj[7];
                    afterLogin(userNick,phone,userPhone);
                }

                // 侧边栏
                $('.floatdiv').empty().append(
                    '<a href="#" class="floatdiv-kf">客服</a>'+
                    '<a href="#" class="floatdiv-icon">'+
                      /*  '<img class="show_erweima" src="images/ys-fix-icon01.png">'+*/

                    '</a>'+
                    '<a href="user_center.html" class="floatdiv-icon"><img src="images/ys-fix-icon02.png"></a>'+
                    '<a href="shopping_car.html" class="floatdiv-icon">'+
                        '<img src="images/ys-fix-icon03.png">'+
                        '<span class="cart_num">5</span>'+
                    '</a>'+
                    '<a href="#top" class="floatdiv-back">'+
                        '<img src="images/ys-fix-icon04.png">'+
                        '<span>返回</span>'+
                    '</a>'+
                    '<img class="floatdiv-erweima" style="display:none" src="'+enterpriseUrl+result.propertyObj[3]+'">'
                );
                // 获取侧边栏购物车内数量
                getCar();
                // 鼠标悬浮显示二维码
                $('.show_erweima').hover(function(){
                    $('.floatdiv-erweima').show();
                },function(){
                    $('.floatdiv-erweima').hide();
                });

                // 页脚
                $('.footer').empty().append(
                    '<div class="footer-con clearfix">'+
                        // '<div class="footer-gz">'+
                        //     '<img src="'+enterpriseUrl+result.propertyObj[3]+'">'+
                        //     '<p>'+result.propertyObj[2]+'</p>'+
                        // '</div>'+
                        // '<div class="footer-ul">'+
                        //     '<ul class="footer-li">'+
                        //         '<li class="list-tit">新手指南</li>'+
                        //         '<li><a href="#">用户须知</a></li>'+
                        //         '<li><a href="#">会员注册</a></li>'+
                        //         '<li><a href="#">账户功能</a></li>'+
                        //         '<li><a href="#">我的留言</a></li>'+
                        //     '</ul>'+
                        //     '<ul class="footer-li">'+
                        //         '<li class="list-tit">购物流程</li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //     '</ul>'+
                        //     '<ul class="footer-li">'+
                        //         '<li class="list-tit">物流配送</li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //     '</ul>'+
                        //     '<ul class="footer-li">'+
                        //         '<li class="list-tit">售后服务</li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //     '</ul>'+
                        //     '<ul class="footer-li">'+
                        //         '<li class="list-tit">特色服务</li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //     '</ul>'+
                        //     '<ul class="footer-li" style="margin:0;">'+
                        //         '<li class="list-tit">关于三顾</li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //         '<li><a href="#">公司信息</a></li>'+
                        //     '</ul>'+
                        // '</div>'+
                    '</div>'+

                    '<div class="footer-state">'+
                        '<p class="footer_detail">'+
                            // '2005-2016 三顾办公商城 版权所有，并保留所有权利。 '+
                            '<span class="footer_info"></span>'+
                            // '成都市三顾商贸有限公司 公司地址：成都市成华区龙潭工业园成致路18号 订购热线：028-66679999 E-mail: kf@sangu.cn'+
                        '</p>'+
                        // '<p>'+
                        //    ' <a href="#">办公用品清单</a><span>|</span>'+
                        //     '<a href="#">办公文具</a><span>|</span>'+
                        //     '<a href="#">办公生活用品</a><span>|</span>'+
                        //     '<a href="#">防护用品</a><span>|</span>'+
                        //     '<a href="#">电脑及配件</a><span>|</span>'+
                        //     '<a href="#">数码产品</a><span>|</span>'+
                        //     '<a href="#">办公设备</a><span>|</span>'+
                        //     '<a href="#">办公耗材</a><span>|</span>'+
                        //     '<a href="#">办公家具</a><span>|</span>'+
                        //     '<a href="#">商务礼品</a><span>|</span>'+
                        //     '<a href="#">办公电器</a><span>|</span>'+
                        //     '<a href="#">网站地图</a><span>|</span>'+
                        //     '<a href="#">北京办公用品</a>'+
                        // '</p>'+
                        '<p>ICP备案证书号:蜀ICP备11010899号</p>'+
                    '</div>'
                );
                if(result.propertyObj[5] != null &&result.propertyObj[5].length>0){
                    var info = result.propertyObj[5];
                    $('.footer_info').empty();
                    for(var i=0;i<info.length;i++){
                        $('.footer_info').append(info[i][1]+":"+info[i][2]+"&nbsp;&nbsp;");
                    }
                }


            }else{
                alert(result.mes);
                return false;
            }
        }


    });

}


// 未登录时顶部显示
function beforeLogin(phone){
    // 未登录顶部个人信息条
    $('.top-banner').empty().append(
        "<a name='top'></a>"+
        "<div class='top-banner-con'>"+
            "<div class='banner-lf lf'>"+
            "<span>亲，请<a href='login.html' class='orange'>登录</a></span></span>"+
                "<a href='register.html' class='top-out go-regist'>免费注册</a>"+
            "</div>"+
            "<div class='banner-rt rt'>"+
                "<span>官方网站</span>"+
                "<span style='margin-left:35px;''>联系电话："+phone+"</span>"+
                "<a href='user_center.html' class='top-psn'>个人中心</a>"+
            "</div>"+
        "</div>"
    );
}


// 登录后顶部显示
function afterLogin(userNick,phone,userPhone){
    // 登录后顶部个人信息条
    $('.top-banner').empty().append(
        "<a name='top'></a>"+
        "<div class='top-banner-con'>"+
            "<div class='banner-lf lf'>"+
            "<span><span id='username' data_phone='"+userPhone+"'>"+userNick+"</span>，欢迎您！</span>"+
                "<a href='javascript:void(0);' class='top-out'>退出</a>"+
            "</div>"+
            "<div class='banner-rt rt'>"+
                "<span>官方网站</span>"+
                "<span style='margin-left:35px;''>联系电话："+phone+"</span>"+
                "<a href='user_center.html' class='top-psn'>个人中心</a>"+
            "</div>"+
        "</div>"
    );
    $('.top-out').click(function(){
        logOut();
    });
}
//获取页头logo等信息
function getHead(logo,name){
    // 头部搜索框
    $('.header').empty().append(
        "<div class='header-con'>"+
        "<a href='index.html' class='logo'><img src='"+logo+"'><span class='company_name'>"+name+"</span></a>"+

            '<div class="header-sear">'+
                '<div class="sear-box">'+
                    '<input type="text" class="sear-txt" placeholder="请输入检索条件">'+
                    '<a href="#" class="sear-btn">搜索</a>'+
                '</div>'+
                // '<div class="sear-wz">'+
                //     '<a href="search_goods.html" style="padding:0;">多功能一体机</a>'+
                //     '<a href="search_goods.html">指纹识别机</a>'+
                //     '<a href="search_goods.html">A3打印纸</a>'+
                //     '<a href="search_goods.html">A3彩色打印纸</a>'+
                //     '<a href="search_goods.html">指纹识别机</a>'+
                //     '<a href="search_goods.html">指纹识别机</a>'+
                // '</div>'+
            '</div>'+

            '<a href="shopping_car.html" class="header-cart">购物车'+
                '<span class="cart_num">2</span>'+
            '</a>'+

        '</div>'
    );
    // 没有搜索框的地方的logo和名称
    $('.search_area .fl').empty().append(
        "<a href='index.html' class='logo'><img src='"+logo+"'><span class='company_name'>"+name+"</span></a>"
    );
    $('.sear-btn').click(function(){
        window.location.href='search_goods.html?keyWords='+$('.sear-txt').val();
    });
}
// 退出登录
function logOut(){
    $.ajax({
        'url':'loginHandle.action',
        'type':'post',
        'async':false,
        'data':{
            'action':'logout'
        },
        success:function(result){
            if(result.mes == '操作成功'){
                window.location.href='login.html';
            }else{
                alert(result.mes);
                return false;
            }
        }
    });
}
// 获取购物车数量
function getCar(){
    $.ajax({
        'url':'homePageManage.action',
        'type':'post',
        'async':false,
        'data':{
            'action':"default",
        },
        success:function(result){
            if(result.mes == '操作成功'){
                // 购物车中总金额和总数量
                if(result.totalNumAndAmount!=null&&result.totalNumAndAmount[0]!=null){
                    $('.cart_num').text(result.totalNumAndAmount[0]);
                }else{
                    $('.cart_num').text(0);
                }

            }else{
                alert(result.mes);
                return false;
            }
        }
    });
}