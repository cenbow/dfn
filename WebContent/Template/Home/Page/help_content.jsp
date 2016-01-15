<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%><head>
<title>帮助中心-${_siteInfo_.siteName}</title>
<link rel="stylesheet" type="text/css" href="${HomeStatics}/css/common.css">
<link rel="stylesheet" type="text/css" href="${HomeStatics}/css/help.css">
<link rel="stylesheet" type="text/css" href="${HomeStatics}/css/kf.css">
<%@ include file="../Common/headerBody.jsp"%>
<!-- 网站头部  end-->
<div class="main">
	<div class="container">
  <div class="leftsidebar_box">
   <h2 class="cjwt">帮助中心</h2>
    <dl class="system_log">
      <dt>常见问题<img src="${HomeStatics}/imgs/silie.png"></dt>
      <dd><a href="#">托管账户</a></dd>
      <dd><a href="#">平台介绍</a></dd>
      <dd><a href="#">我要投资</a></dd>
      <dd><a href="#">我要借款</a></dd>
      <dd><a href="#">新手指引</a></dd>
    </dl>
    <dl class="custom">
      <dt>项目说明<img src="${HomeStatics}/imgs/silie.png"></dt>
      <dd><a href="#">借款说明</a></dd>
      <dd><a href="#">投资说明</a></dd>
    </dl>
    <dl class="channel">
      <dt>收费标准<img src="${HomeStatics}/imgs/silie.png"></dt>
      <dd><a href="#">充值费用</a></dd>
      <dd><a href="#">提现费用</a></dd>
      <dd><a href="#">债权转让</a></dd>
    </dl>
    <dl class="app">
      <dt>平台原理<img src="${HomeStatics}/imgs/silie.png"></dt>
      <dd><a href="#">原理介绍</a></dd>
      <dd><a href="#">名词解释</a></dd>
      <dd><a href="#">新手答疑</a></dd>
    </dl>
  </div>
</div>
    <div class="content">
		${vo.content}
    </div>
</div>



<script type="text/javascript" src="${HomeStatics}/js/jquery-min.js"></script>
<script type="text/javascript" src="${HomeStatics}/js/show.js"></script>
<script type="text/javascript" src="${HomeStatics}/js/leftside.js"></script>

<!--网站底部-->
<%@ include file="../Common/footer.jsp"%>