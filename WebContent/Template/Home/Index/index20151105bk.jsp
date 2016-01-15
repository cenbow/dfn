	<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
		<%@ include file="../Common/javaTag.jsp"%>
		<%@ include file="../Common/headerMeta.jsp"%><head>
		<title>融友网_您身边的互联网金融信息服务平台</title>
		<meta name="keywords" content="互联网金融_P2P网贷平台_P2P网贷_网贷平台">
		<meta name="description" content="融友网（www.P2POK.com）独立官方金融信息服务品牌，是融友公司2013年为有资金需求的借款人和有理财需求的出借人搭建的P2P服务平台，旨在解决传统信贷中存在的贷款难、利率高以及出借理财收益低、风险高的问题，打造一个诚信、安全、便捷、透明度高的O2O模式的P2P服务平台。
		">
		<meta name="baidu-site-verification" content="C90FW7dF06" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="/Statics/Home/css/animate.css">

		<!--百度流量统计代码-->
		<script>
		var _hmt = _hmt || [];
		(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?50bc8446fe3fbd609366d93b57472e69";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
		})();
		</script>
		<!--百度流量统计代码-->
		<!-- top start -->
		<%@ include file="../Common/headerBody.jsp"%>
		<script type="text/javascript" src="${HomeStatics}/js/xx-js.js"></script>
		<script type="text/javascript" src="/Statics/Home/js/jquery.cookie.js"></script>
		<style type="text/css">
		/* qqshop focus */
		#focus{width:100%;height:350px;overflow:hidden;position:relative}#focus ul{height:350px;position:absolute}#focus ul li{float:left;width:100%;height:350px;overflow:hidden;position:relative;background:#000}#focus ul li img{width:100%;height:350px}#focus ul li div{position:absolute;overflow:hidden}#focus .cwhUl{position:absolute;left:47%;height:10px;bottom:15px}#focus .cwhUl li{border:1px solid #e3e3e3;background:#e3e3e3;border-radius:10px;float:left;height:10px;margin-left:10px;overflow:hidden;text-align:center;width:10px;cursor:pointer}#focus .cwhUl li.active{border:1px solid #2ea7e0;background:#2ea7e0}
		</style>
		<div class="in_banner_wper">
		<div class="i_guanggao_1" id="focus" style="overflow:hidden">
		<ul style="width:100%">
		<c:if test="${not empty indexAdImgs }">
		<c:forEach items="${indexAdImgs }" var="swfImgList"  varStatus="foreach">
		<li style="background:url(${_WEB_ROOT_}${swfImgList.img}) no-repeat center top"><a style="display:block; width:100%; height:100%" href="${swfImgList.url}"><img style="visibility:hidden" src="${_WEB_ROOT_}${swfImgList.img}" /></a></li>
		</c:forEach>
		</c:if>
		</ul>
		</div>
		<script type="text/javascript">
		$(function(){var page=0;var CParent=$("#focus");var CList=$("#focus li");var CLength=CList.length;var btn="<ul class='cwhUl'>";for(i=0;i<CLength;i++){btn+="<li></li>"}btn+="</ul>";CParent.append(btn);var CCurrent=$(".cwhUl");var CActive=CCurrent.find("li");CParent.hover(function(){clearInterval(picTimer)},function(){if(!CActive.hasClass("active")){CActive.eq(page).addClass("active")}picTimer=setInterval(function(){CActive.eq(page).addClass("active").siblings().removeClass("active");showPic(page);page++;if(page==CLength){page=0}},7000)}).trigger("mouseleave");CActive.click(function(){$(this).addClass("active").siblings().removeClass("active");page=$(this).index();showPic(page)});function showPic(page){CList.eq(page).fadeIn(2000).siblings().fadeOut()}});
		</script>

		<!-- bannner end -->

		<div class="px1000" style="position:relative;width:1000px;">


		<div class="ry_modal animated bounceInDown">
		<c:choose>
		<c:when test="${empty _USERINFO_}">
		<div >
		<ul>
		<li>年化收益<span style="font-size:24px;font-weight:bold;color:#feac2c;">10</span>% -<span style="font-size:24px;font-weight:bold;color:#feac2c">18</span>%</li>
		<li><span style="font-size:24px;font-weight:bold;color:#bae84c">100</span>% 本息保障</li>
		<li>新浪托管</li>
		<li>专业风控</li>
		</ul>
		<div class="ry_btn">
		<a href="${dfn:U('home/register/index')}">
		注册领取红包</a>
		</div>
		<div class="ry_login">
		已有账号？<a href="${dfn:U('home/login/index')}">立即登录</a>
		</div>
		</div>
		</c:when>
		<c:otherwise>
		<div >
		<img src="${HomeStatics}/images/ry_user.png" style="margin-top:15px;">
		<div class="ry_user">您好，${_USERINFO_.user_name}
		</div>
		<div class="ry_btn"><a href="${_WEB_ROOT_}/member">会员中心</a></div>
		</div>
		</c:otherwise>
		</c:choose>
		</div>




		</div>
		<div style="overflow:hidden; background:#FFF;padding-bottom:12px;">
		<div class="px1000">

		<a href="${dfn:U('home/invest/index')}">
		<div class="ry_4 tc">
		<img src="${HomeStatics}/images/home_01.png">
		<h4 class="title">投资理财</h4>
		<div class="ry_word">本息保障100元起投</div>
		<div class="ry_word">年化收益10%-18%</div>
		</div>
		</a>
		<a href="${dfn:U('home/loan/index')}">
		<div class="ry_4 tc">
		<img src="${HomeStatics}/images/home_02.png">
		<h4 class="title">诚信借款</h4>
		<div class="ry_word">费用低至0.48%</div>
		<div class="ry_word">让诚信产生价值</div>
		</div>
		</a>
		<a href="${dfn:U('home/safe/index')}">
		<div class="ry_4 tc">
		<img src="${HomeStatics}/images/home_03.png">
		<h4 class="title">安全保障</h4>
		<div class="ry_word">先行赔付 新浪托管</div>
		<div class="ry_word">防御在前 安享收益</div>
		</div>
		</a>
		<a href="${dfn:U('home/page/content')}'?i=fk">
		<div class="ry_4 tc">
		<img src="${HomeStatics}/images/home_04.png">
		<h4 class="title">风控模式</h4>
		<div class="ry_word">融友同城 服务到家</div>
		<div class="ry_word">线上出借 线下风控</div>
		</div>
		</a>



		<div style="margin-top:30px;">
		<div class="ry_hr_short" style="height:15px;">
		<br><br>
		</div>
		<c:if test="${not empty notice.list }">
		<c:forEach items="${notice.list }" var="user" varStatus="ind">
        <c:if test="${ind.index eq '0'}">
		<div style="width: 85%;float:left;margin-top:6px;">
		<a href="${user.url}">${user['title']}</a>
		</div>
		<div style="width: 15%;float:left;">
		<span style="float:left;margin-top:6px;">${user.add_time}</span>
		<a class="ry_more_news" href="${_WEB_ROOT_}/category/index.do?id=427" style="margin-top:3px;">更多公告</a>
		</div>
        </c:if>
        </c:forEach>
        </c:if>
		<div class="ry_hr_short"></div>
		</div>



		</div>
		</div>

		<div class="in_con_wper">

		<div class="in_con px1000">


		<c:if test="${not empty xborrow }">

		<c:forEach items="${xborrow }" var="xbo">

		<div class="black20"></div>
		<h4 class="intro_tit">新手标<p style="font-size:14px; color:#707070;">不用出资   也能赚钱</p></h4>
		<!--<div class="ry_xin">
		<div style="border-bottom:dashed 1px #9bda48;padding:20px 0;">
		<span style="font-size:14px;"> ${xbo.borrow_name}</span>
		<img src="${HomeStatics}/images/ry_xin.png">
		<img src="${HomeStatics}/images/ry_shi.png">
		<a href="${dfn:U('home/invest/index')}"><span style="float:right;font-size:14px;">了解详情    <img src="${HomeStatics}/images/ry_right.png"></span></a>
		</div>
		<div style="margin-top:50px;">
		<div style="width:110px;" class="ry_border ry_text_center">
		<div style="margin-left:-50px;">
		<div style="font-size:26px;">${xbo.borrow_interest_rate}<span style="font-size:18px;">%</span></div>
		<div class="mt20">年利率</div>
		</div>
		</div>
		<div style="width:180px;" class="ry_border ry_text_center">
		<div style="font-size:26px;">${xbo.borrow_duration}<span style="font-size:18px;">${xbo.duration_unit}</span></div>
		<div class="mt20">周期</div>
		</div>
		<div style="width:240px;" class="ry_border ry_text_center">
		<div style="font-size:26px;">${xbo.borrow_money}<span style="font-size:18px;">元</span></div>
		<div class="mt20">金额</div>
		</div>
		<div style="width:175px;" class="ry_border ry_text_center">
		<div><span class="ui-progressbar-mid ui-progressbar-mid-${xbo.progress}">${xbo.progress}%</span></div>
		<div class="mt15">进度</div>
		</div>
		<div style="width:175px;float:left;text-align:right;">
		<div style="font-size:14px;">剩余时间：${xbo.leftdays}</div>
		<a href="${xbo.url}"><div class="ry_tb">立即投标</div></a>
		</div>

		</div>
		</div>
		-->
		<c:set var="money_length" value="${fn:length(xbo.borrow_money)}"></c:set>
		<c:set var="rate_length" value="${fn:length(xbo.borrow_interest_rate)}"></c:set>
		<div style="background:url('/Statics/Home/images/xin_bg.png') no-repeat;width:1000px;height:163px;position:relative;">
		<div style="color:#31a6e2;right: 650px;top:46px;position:absolute;display:inline;"><span style="font-size:55px;">${fn:substring(xbo.borrow_money,0,money_length-6)}</span><span style="font-size:48px;">,000</span></div>
		<span style="font-size:58px;color:#31a6e2;right:470px;top:45px;position:absolute;">${fn:substring(xbo.borrow_interest_rate,0,rate_length-3)}</span>
		<span style="font-size:14px;color:#a8a7a7;left:800px;top:50px;position:absolute;">剩余时间：${xbo.leftdays}</span>
		<a  href="${xbo.url}" style="border-radius:5px;padding:8px 15px;background:#31a6e2;font-size:18px;color:#ffffff;left:835px;top:80px;position:absolute;">立即投标</a>
		</div>

		</c:forEach>
		</c:if>




		<!-- end 为什么选择融圣360 -->
		<div class="black20"></div>
		<div class="black20"></div>
		<h4 class="intro_tit">投资列表<p style="font-size:14px; color:#707070;">真正安全   省心的组团投资方式</p></h4>

		<div id="include_page2">
		<jsp:include page="page.jsp" />
		</div>



		<!-- end 明星产品 -->
		<div class="black20"></div>
		<h2 class="intro_tit">关于我们<p style="font-size:14px; color:#707070;">帮助您了解更多融友网信息</p></h2>
		<div class="black20"></div>
		<div class="aboutus_con clear clearfix">
		${dfn:showAdString('60')}
		<!-- end 360 -->
		<div class="aboutus_con_l fl mr11">
		<h3 class="aboutus_l_tit">公司动态</h3>
		<div class="aboutus_c_text">


		<c:if test="${not empty trace.list }">
		<c:forEach items="${trace.list }" var="user">
		<div class="aboutus_c_list clear clearfix">
		<div class="au_c_list_l fl">
		<a href="${user.url}"><img src="${dfn:getThumbImgUrl(user['thumburl'])}" width="74px" height="59px" onerror="javascript:imgOnError();"></a>
		</div>
		<div class="au_c_list_r fl">
		<p class="au_c_ft">${user.add_time}</p>
		<div><a href="${user.url}">${user['title']}</a></div>
		</div>
		</div>
		<!--  -->
		</c:forEach>
		</c:if>

		<!--  -->
		<p class="au_l_more " style="padding-top: 13px;">
		<a href="${dfn:U('home/category/index')}?id=389">更多》</a>
		</p>
		</div>
		</div>
		<!-- end 公司动态-->
		<div class="aboutus_con_l fl ">
		<h3 class="aboutus_l_tit">网站公告</h3>
		<div class="aboutus_r_text">
		<c:if test="${not empty notice.list }">
		<c:forEach items="${notice.list }" var="user">
		<ul class="au_news">
		<li><a href="${user.url}">${user['title']}</a></li>
		</ul>
		</c:forEach>
		</c:if>
		<p class="au_l_more ">
		<a href="${dfn:U('home/category/index')}?id=427">更多》</a>
		</p>
		</div>
		</div>
		<!-- end 网站公告-->
		</div>
		<!-- end 关于我们 -->
		<div class="black20"></div>
		<h2 class="intro_tit">媒体报道<p style="font-size:14px; color:#707070;">权威的报道，记录行进中的<a href="http://www.p2pok.com/category/index.do?id=425" style="text-decoration:underline;font-size:14px; color:#707070;">融友网 >></a></p></h2>
		<div class="black20"></div>

		<!-- end 媒体报道 -->

		<div style="text-align:center;position:relative;background-color:#ffffff;padding:20px 0;">
		<div id="arrLeft">
		<img src="${HomeStatics}/images/ry_home_left.png">
		</div>
		<div id="scrollbox">
		<div class="ry_box">
		<img src="${HomeStatics}/images/ry_title.jpg">
		<a href="http://www.p2pok.com/article/index.do?id=670">
		<p class="ry_p1">
		10月16日，国务院总理李克强在主持召开的金融企业座谈会上提出，加大对实体经济支持;鼓励互联网金融依托实体经济规范有序发展；坚守不发生区域性系统性金融风险底线。互联网金融监管的一只“靴子”已经落地，另一只细则...
		</p>
		</a>
		</div>
		<div class="ry_box">
		<img src="${HomeStatics}/images/xinlang.png">
		<a href="http://www.p2pok.com/article/index.do?id=668">
		<p class="ry_p1">
		9月15日，国内领先第三方支付公司-新浪支付宣布完成对资金账户管理系统的升级，推出新浪支付+工商银行(4.45, 0.08, 1.83%)资金存管系统。本次系统升级解决了网络借贷、股权众筹融资、互联网基金销售、互联网保险...
		</p>
		</a>
		</div>
		<div class="ry_box">
		<img src="${HomeStatics}/images/fenghuang.png">
		<a href="http://www.p2pok.com/article/index.do?id=669">
		<p class="ry_p1">
		北京7月28日电（记者　周小璐）近年来，互联网金融迅猛发展，成为经济领域炙手可热的话题，与传统经济形式相比，互联网金融具有自己独特的优势。有业内人士预测，监管细则下半年将陆续落地，互联网金融的未来更加可期...
		</p>
		</a>
		</div>
		</div>
		<div id="arrRight">
		<img src="${HomeStatics}/images/ry_home_right.png">
		</div>
		</div>
		</div>
		</div>

		<div class="ry_mask" style="display:none">
		<div class="ry_popup">
		<div style="text-align:right;"><img src="/Statics/Home/images/ry_gb.png" onclick="$('.ry_mask').hide()"></div>
		<div style="text-align:center;"><img src="/Statics/Home/images/ry_tu.png"></div>
		<div style="text-align:center;padding-top:30px;"><a href="http://www.p2pok.com/register/index.do"><img src="/Statics/Home/images/ry_zc.png"></a></div>
		</div>
		</div>
		<!-- end con -->
		<script type="text/javascript">
		var scrollPic_01 = new ScrollPic();
		scrollPic_01.scrollContId   = "scrollbox"; //内容容器ID
		scrollPic_01.arrLeftId      = "arrLeft";//左箭头ID
		scrollPic_01.arrRightId     = "arrRight"; //右箭头ID
		scrollPic_01.frameWidth     = 1000;//显示框宽度
		scrollPic_01.pageWidth      = 334; //翻页宽度   更改移动距离的时候用！！！！！！！！！！！
		scrollPic_01.speed          = 10; //移动速度(单位毫秒，越小越快)
		scrollPic_01.space          = 10; //每次移动像素(单位px，越大越快)
		scrollPic_01.autoPlay       = false; //自动播放
		scrollPic_01.autoPlayTime   = 3; //自动播放间隔时间(秒)
		scrollPic_01.initialize(); //初始化

		$(window).load(function() {
		if($.cookie('ry_modal') == null){
			$(".ry_mask").show();
			$.cookie('ry_modal','modal');
			var heightpopup=$(".ry_popup").height();
			var height = window.innerHeight;
			$(".ry_popup").css("margin-top", (height-heightpopup)/2);
		}else{
		$(".ry_mask").hide();
		}
		});
		$(function() {
		$("#arrLeft").hover(function(){
			$("#arrLeft").children("img").attr("src","${HomeStatics}/images/ry_home_left_hover.png");
		},function(){
			$("#arrLeft").children("img").attr("src","${HomeStatics}/images/ry_home_left.png");
		});
		$("#arrRight").hover(function(){
			$("#arrRight").children("img").attr("src","${HomeStatics}/images/ry_home_right_hover.png");
		},function(){
			$("#arrRight").children("img").attr("src","${HomeStatics}/images/ry_home_right.png");
		});
		$(".starpro_list_box .list_one ul").not(":eq(0)").mouseover(function() {
		$(this).css({
		"background-color" : "#f8f8f8"
		}).siblings().css({
		"background-color" : "#fff"
		});
		}).mouseout(function(){
		$(this).css({
		"background-color" : "#fff"
		});
		});
		$(".ry_4").hover(function(){
			var path=$(this).children("img").attr("src");
			var filename;
			filename=path.substring(path.lastIndexOf("/")+1,path.length-4);
			$(this).children("img").attr("src","/Statics/Home/images/"+filename+"_hover.png");
			$(this).children("h4").attr("style","color:#69c1ff");

		},function(){
			var path=$(this).children("img").attr("src");
			var filename;
			filename=path.substring(path.lastIndexOf("/")+1,path.length-10);
			$(this).children("img").attr("src","/Statics/Home/images/"+filename+".png");
		$(this).children("h4").attr("style","color:#707070");
		})




		});
		</script>
		<!--客服开始 -->
		<div class="in_kefu_wper">
		<div class="in_kefu px1000">
		<div class="fl " style="width:380px;">
		<p><a><img src="${HomeStatics}/images/erweima_03.png"></a></p>
		</div>
		<div style="margin-left:100px;" class="kefu_weixin fl">
		<img src="${HomeStatics}/images/ry_bottom.png">
		</div>
		<a href="/register/index.do" class="kefu_reg kefu_btn">立即注册</a>
		<img src="/Statics/Home/Activity/images/green_right.jpg" class="kefu_reg_img">
		</div>
		</div>
		<!-- end kefu -->
		<%@ include file="../Common/footer.jsp"%>