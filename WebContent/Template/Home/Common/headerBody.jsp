<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<style>
	.ry_ul{
	position:absolute; display:none;background-color:#ffffff;font-size:14px;z-index:1000;
	}
	.ry_ul p:hover{
	background-color:#69c1ff;

	}
	.ry_ul a:hover{
	color:#ffffff;
	}
	</style>
	</head>
<body>
<div id="in_top_wper">
	 <div class="in_top px1000 clear clearfix ">
	 	    <ul class="in_top_left fl overFlow ">
				<li class="mr10 ml20"><h1  style="font-weight:bold;">您身边的互联网金融服务平台</h1></li>
				<li style="margin-left:10px;"><img src="/Statics/Home/images/ry_kefu.png" style="padding-bottom:3px;">  40000-10068</li>
	 	    </ul>
	 	    <ul class="in_top_right fr " style="width:auto">
	 	    	 <li><a href="${_WEB_ROOT_}/category/index.do?id=363">帮助中心</a></li>	 	    	
	 	    	 <li style="position:relative" class="sitab"><a href="${dfn:U('home/guide/index')}">新手指引</a>
                 	<ul style="position:absolute;left:13px;display:none;background-color:#ffffff;border-top:2px solid #69c1ff;width:70px;text-align:center;"><p><a href="${dfn:U('home/guide/index')}#1" style="line-height:30px;">我要出借</a></p><p><a href="${dfn:U('home/guide/index')}#2" style="line-height:30px;">我要借入</a></p></ul>
                 </li>
                 <c:choose>
                 	<c:when test="${not empty _USERINFO_}">
                     <li><a href="${dfn:U('home/login/loginOut')}">安全退出</a></li>
                     <li style="margin-top:-2px;">您好，<a href="${_WEB_ROOT_}/member" style="color:#85ad4d;font-size:13px;font-weight:bold;">${_USERINFO_.user_name}</a></li>
                    </c:when>
                 	<c:otherwise>
                     <li><a href="${dfn:U('home/login/index')}" style="color:#85ad4d;font-weight:bolder;">登录</a></li>
                     <li><a href="${dfn:U('home/register/index')}" style="color:#69c1ff;font-weight:bolder">注册</a></li>
                    </c:otherwise>
                </c:choose>
	 	    </ul>
	 </div>
</div>

<div id="in_header_wper">
	  <div class="in_header px1000 clear clearfix">
	  	       <div class="header_logo fl">
	  	       	    <a href="${_WEB_ROOT_}/"><img src="${HomeStatics}/images/ban_logo.png" alt="融友网"></a>
	  	       </div>
	  	       <ul class="header_nav fr">	  	       	     
	  	       	     <li><a href="${_WEB_ROOT_}/member" style="margin-right:0">会员中心</a></li>
	  	       	     <li><a href="${_WEB_ROOT_}/category/index.do?id=387">关于我们</a></li>
	  	       	     <li><a href="${dfn:U('home/safe/index')}">安全保障</a>
                     
                     </li>
	  	       	     <li class="sitab"><a href="${dfn:U('home/loan/index')}">我要借款</a>
                     <ul class="ry_ul"><p><a href="${dfn:U('home/loan/car_loan')}">一般借款</a></p><p style="padding:0;margin:0;"><a href="${dfn:U('home/loan/real_loan')}">经营借款</a></p><p><a href="http://www.p2pok.com/loan/commercial_loan.do">YOO校园</a></p></ul>
                     </li>
	  	       	     <li class="sitab"><a href="${dfn:U('home/Invest/index')}">我要投资</a>
                     <!--<ul class="ry_ul"><p><a href="${dfn:U('home/invest/index')}">新手标</a></p><p><a href="${dfn:U('home/invest/index')}">散标投资</a></p><p><a href="${dfn:U('home/invest/index')}">融友精选</a></p><p><a href="${dfn:U('home/invest/index')}">债权转让</a></p></ul>-->
                     </li>
	  	       	     <li><a href="${_WEB_ROOT_}/">首页</a></li>
	  	       </ul>
	  </div>
</div>
<script type="text/javascript">
$(".header_nav li").hover(function(){
	$(this).addClass("hover");
},function(){
	$(this).removeClass("hover");
});
$(".sitab").mouseenter(function(){
	$(this).find("ul").slideDown();
}).mouseleave(function() {
    $(this).find("ul").stop().slideUp();
});
</script>
<!-- class="nav_cur -->