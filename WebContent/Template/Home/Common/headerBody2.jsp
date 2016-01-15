<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
</head>
<body>
<div id="in_top_wper">
	 <div class="in_top px1000 clear clearfix overFlow">
	 	    <ul class="in_top_left fl overFlow ">
	 	    	 <li class="mr10">客服热线：400-8636-360</li>
	 	    	 <li><a href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODAxMDUzOV8yODc2MDZfNDAwODYzNjM2MF8yXw"><img src="${HomeStatics}/images/top_qq.png"></a></li>
	 	    	 <li><a href=""><img src="${HomeStatics}/images/top_weixin.png"></a></li>
	 	    	 <li><a href="http://weibo.com/u/5608204548"><img src="${HomeStatics}/images/top_weibo.png"></a></li>
	 	    </ul>
	 	    <ul class="in_top_right fr overFlow " style="width:auto">
	 	    	 <li><a href="${_WEB_ROOT_}/category/index.do?id=363">帮助中心</a></li>	 	    	
	 	    	 <li><a href="${dfn:U('home/guide/index')}">新手指引</a></li>
                 <c:choose>
                 	<c:when test="${not empty _USERINFO_}">
                     <li><a href="${_WEB_ROOT_}/member">${_USERINFO_.user_name}</a>,您好</li>
                     <li><a href="${dfn:U('home/login/loginOut')}">安全退出</a></li>
                    </c:when>
                 	<c:otherwise>
                     <li><a href="${dfn:U('home/login/index')}">登录</a></li>
                     <li><a href="${dfn:U('home/register/index')}">注册</a></li>
                    </c:otherwise>
                </c:choose>
	 	    </ul>
	 </div>
</div>

<div id="in_header_wper">
	  <div class="in_header px1000 clear clearfix">
	  	       <div class="header_logo fl">
	  	       	    <a href="${_WEB_ROOT_}/"><img src="${HomeStatics}/images/ban_logo.png"></a>
	  	       </div>
	  	       <ul class="header_nav fr">	  	       	     
	  	       	     <li><a href="${_WEB_ROOT_}/member" style="margin-right:0">会员中心</a></li>
	  	       	     <li><a href="${_WEB_ROOT_}/category/index.do?id=387">关于我们</a></li>
	  	       	     <li><a href="${dfn:U('home/safe/index')}">安全保障</a></li>
	  	       	     <li><a href="${dfn:U('home/loan/index')}">我要借款</a></li>
	  	       	     <li><a href="${dfn:U('home/Invest/index')}">我要投资</a></li>
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
</script>
<!-- class="nav_cur -->