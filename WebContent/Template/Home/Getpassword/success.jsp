<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>找回密码</title>
<link  href="${HomeStatics}/Getpass/css/style.css"  type="text/css" rel="stylesheet" />
<%@ include file="../Common/headerBody.jsp"%>
<div class="zyz_retpas"  style="border-bottom:2px solid #f38657;padding-bottom:50px;">
	   <div class="zyz_retpas_wper " >
	   	     <h1 class="retpas_tit">找回密码</h1>
	   	     <P class="pt10 pb30"><img src="${HomeStatics}/Getpass/images/retpas_path04.png"></P>
	   	     <div class="retpas_form1 pb30 retpas_path4">
	   	     	   <h2>设置成功，请牢记新的登录密码</h2>
	   	     	   <p><span id="timecount">4</span>秒后自动跳转到<a href="${dfn:U('home/login/index')}">登录</a>页</p>
	   	     </div>
	   	     
	   </div>
</div>
<script type="text/javascript">
var time=4;
var timer;
timer = setInterval(function(){
	time--;
	$("#timecount").html(time);
	if(time<=0){
		clearInterval(timer);
		window.location.href="${dfn:U('home/login/index')}";
	}
},1000);
</script>
<%@ include file="../Common/footer.jsp"%>