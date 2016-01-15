<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>公测活动</title>
<link href="${HomeStatics}/Activity/style/beta.css"  type="text/css" rel="stylesheet" />
<link href="${HomeStatics}/Activity/style/colorbox.css"  type="text/css" rel="stylesheet" />
<link href="${HomeStatics}/Activity/style/layer.css"  type="text/css" rel="stylesheet" />
<script src="${HomeStatics}/Activity/js/jquery.totemticker.js"></script>
<script type="text/jscript">
  $(function(){
			$("#card_get").totemticker({
				  row_height:'32px',
				  interval:2000,
				  mousestop:true
			  });
			$("#card_invest").totemticker({
				  row_height:'32px',
				  interval:2000,
				  mousestop:true
			  });
  })
</script>
<%@ include file="../Common/headerBody.jsp"%>


<!--banner-->
<div class="beta_banner"></div>
<!--banner-->


<!--活动导语-->
<div class="beta_box_white">
   <div class="beta_lead px1000">
      <div class="fl beta_lead_text">
         <p class="title">撒么，撒么，融圣360即将上线</p>
         <p>第一重礼“寻找1000位优秀粉丝公测”，一大波体验金大放送： 千万元体验金，白送！ 收益，白赚！ 第二重礼，找茬，送大红包，“网贷人”速来。</p>
         <p>机会难得，不容错过，开启你的巨赚之旅吧！</p>
      </div>
      <div class=" beta_lead_btn fl"><a href="${dfn:U('home/register/index')}">立即注册</a></div>
   </div>
</div>
<!--活动导语-->


<!--活动一-->
<div class="beta_box_red">
   <div class="px1000 beta_act1">
   
      <h1><img src="${HomeStatics}/Activity/images/beta_act1.png" /></h1>
      
      <div class=" beta_act1_map"><a href="#"><img src="${HomeStatics}/Activity/images/beta_map.gif" /></a></div>
      
      <div class=" beta_act1_description fl">
         <p class="title">活动一规则说明</p>
         <p>1、活动邀请码，需通过关注融圣360微信公众号，方可获得；</p>
         <p>2、公测期间凭邀请码方可注册；</p>
         <p>3、完成注册、开通托管账户、绑定个人银行卡，并充值1元，即可激活获得万元体验金；</p>
         <p>4、体验金只可用于【新手体验专区】投资新手体验标，标的周期为7天，年化收益为12%，可获得23元现金收益；</p>
         <p>5、体验金有效期为2015.6.22—7.31，活动期间可以多次循环投标，过期平台回收；</p>
         <p>6、体验金为用户体验投资流程，不可转让、不可提现，不可部分投资；</p>
         <p>7、体验金投资所得收益即变为账户余额，可用以继续投资真实标的或直接提现，所得收益适用于平台利息管理费收费标准。</p>
      </div>
      
   </div>
   
   <div class="beta_act1_colour"></div>
</div>


<!--无间隙滚动-->
<div class="beta_box_red">
   <div class="px1000 beta_roll">
   
      <div class="beta_roll_l fl">
         <h1>获得体验金</h1>
         <ul class="introTitle" id="card_get">
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         </ul>
      </div>
      
      <div class="beta_roll_l fl" style=" margin-right:0;">
         <h1>体验金投资</h1>
         <ul  class="introTitle" id="card_invest">
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         	<li><span class="name">刘**</span><span class="get">成功获得体验金10,000元</span><span class="time">2015-07-11</span></li>
         </ul>
      </div>
   </div>
</div>
<!--无间隙滚动-->
<!--活动一-->


<!--活动二-->
<div class="beta_box_white">
   <div class="beta_act2 px1000">
      <div class="beta_act2_l fl"></div>
      <div class="beta_act2_r fl">
         <p class="title">活动二规则说明</p>
         <p>1、点击“建议提交”按钮到论坛页进行网站建议提交。</p>
         <p>2、建议若被采纳，即可获得50元红包奖励。</p>
         <p>3、获奖用户，将以电话或短信方式进行通知。</p>
         <p>4．红包奖励，将直接转入获奖用户个人融圣360账户。</p>
         <p class="btn"><a href="#">建议提交</a></p>
      </div>
   </div>
</div>
<!--活动二-->



<!--微信扫码-->
<div class="beta_box_grey">
<div class="px1000 beta_code">
   <img src="${HomeStatics}/Activity/images/beta_code.png" />
   <p class="text">扫码关注微信，立即开启投资理财之旅</p>
</div>
</div>
<!--微信扫码-->


<!--最终解释权-->
<div class="beta_box_white">
   <div class="beta_power px1000">本次活动最终解释权归融圣360所有</div>
</div>
<!--最终解释权-->




<!--右边漂浮菜单-->
<div class="beta_code_2"></div>
<!--右边漂浮菜单-->

<%@ include file="../Common/footer.jsp"%>