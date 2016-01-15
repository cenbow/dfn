
//左侧滑动列表
$(function(){
	$(".leftsidebar_box dt").css({"background-color":"#fff"});
	$(".leftsidebar_box dt img").attr("src","/Statics/Home/imgs/silie.png");
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#fff"})
		$(this).css({"background-color": "#f5f5f5"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","/Statics/Home/imgs/silie.png");
		$(this).parent().find('img').attr("src","/Statics/Home/imgs/silie01.jpg");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
	$(".leftsidebar_box dd").click(function(){
		$(".leftsidebar_box dd").removeClass("ejku");
		$(this).addClass("ejku");
	});
})
