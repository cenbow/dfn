<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${_siteInfo_.siteName}系统后台 - 网站后台</title>
<meta name="generator" content="BHP2P" />
<script language="javascript" type="text/javascript" src="${AdminStatics}/js/jquery.js"></script>
<style type="text/css">
 html{font-size:62.5%;font-family:Tahoma}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td,hr{margin:0;padding:0}
body{line-height:1.333;font-size:12px;font-size:1.2rem}
h1,h2,h3,h4,h5,h6{font-size:100%}
input,textarea,select,button{font-size:12px;font-weight:normal}
input[type="button"],input[type="submit"],select,button{cursor:pointer}
table{border-collapse:collapse;border-spacing:0}
address,caption,cite,code,dfn,em,th,var{font-style:normal;font-weight:normal}
li{list-style:none}
caption,th{text-align:left}
q:before,q:after{content:''}
abbr,acronym{border:0;font-variant:normal}
sup{vertical-align:text-top}
sub{vertical-align:text-bottom}
fieldset,img,a img,iframe{border-width:0;border-style:none}
iframe{overflow:hidden}
img{ -ms-interpolation-mode:bicubic;}
textarea{overflow-y:auto}
legend{color:#000}
a:link,a:visited{text-decoration:none}
hr{height:0}
label{cursor:pointer}
.os_winXp{font-family:Tahoma}
.os_mac{font-family:"Helvetica Neue",Helvetica,"Hiragino Sans GB",Arial}
.os_vista,.os_win7{font-family:"Microsoft Yahei",Tahoma}
.clearfix:before,.clearfix:after{content:".";display:block;height:0;visibility:hidden}
.clearfix:after{clear:both}
.clearfix{zoom:1}
.header,nav,.footer{display:block}
body{background-color:#FFFFFF}
.wrap{background-color:#FFFFFF}
.wrap .inner{width:1000px;margin:0 auto}
iframe{background-color:transparent}
.header{padding:19px 0 0 100px}
.header h1{
	background-image:url(${AdminStatics}/images/logo.gif);background-repeat:no-repeat;width:287px;height:78px;line-height:150px;overflow:hidden;font-size:0}
.qzone_login{margin-top:55px}
.qzone_login .qzone_cont{float:left;margin-left:0px;position:relative;width:556px;_display:inline;overflow:hidden;height:321px}
.qzone_cont .img_list{width:429px;height:321px}
.qzone_cont .img_list li{width:429px;height:321px;vertical-align:middle;display:table-cell}
.qzone_cont .img_list .img_link{display:block;width:429px;text-align:center;height:321px;outline:none;overflow:hidden}
.qzone_cont .scroll_img_box{margin:40px auto 0;height:16px;float:left}
.qzone_cont .scroll_img{text-align:center;width:429px}
.qzone_cont .scroll_img li{ width:10px;height:10px;background-image:url(${AdminStatics}/images/qzone_login.png);background-position:-663px 0;background-repeat:no-repeat;display:inline-block;margin-right:15px;cursor:pointer;*display:inline;*zoom:1;overflow:hidden}
.qzone_cont .scroll_img .current_img{ background-image:url(${AdminStatics}/images/admin_img/qzone_login.png);background-position:-663px -17px}
.qzone_login .login_main{margin:10px 0 0 68px;float:left;_display:inline;width:370px;overflow:hidden}
.qzone_login .login_main a{color:#3da5dc}
.login_main .login_list .input_txt{border:1px solid #d9d9d9;border-radius:3px;font-size:16px;font-family:"Microsoft Yahei",Tahoma;height:23px;width:259px;color:#666;padding:14px 0 14px 9px;margin-bottom:20px}
.login_main .login_list .input_txt:focus{outline:0}
.login_main .login_list .current_input{border-color:#56bdf3;box-shadow:inset 0 1px 3px rgba(0,0,0,.2);-webkit-box-shadow:inset 0 1px 3px rgba(0,0,0,.2);-moz-box-shadow:inset 0 1px 3px rgba(0,0,0,.2)}
.login_main .login_list .login_input{position:relative;width:270px;height:73px}
.login_main .login_list .txt_default{position:absolute;font-size:16px;font-family:"Microsoft Yahei",Tahoma;color:#666;top:17px;left:10px;cursor:text}
.login_main .login_list .txt_click{color:#ccc}
.login_main .login_list .yanzhengma{position:relative;color:#666}
.login_main .login_list .yanzhengma .yanzheng_txt{margin-left:2px}
.login_main .login_list .yanzhengma .input_txt{width:139px;margin-bottom:40px}
.login_main .login_list .yanzhengma .yanzhengma_box{position:absolute;left:160px;top:0}
.login_main .login_list .yanzhengma .yanzheng_img{display:block;margin-bottom:10px}
.login_main .login_btn{ width:148px;height:48px;line-height:150px;overflow:hidden;font-size:0;*background:none;background-image:url(${AdminStatics}/images/qzone_login.png);background-position:-514px 0;border:none;cursor:pointer}
.qzone_login .login_main nav{color:#d0d3d7;margin:20px 0 0 3px}
.qzone_login .login_main nav .sep{margin:0 12px}
.login_main .quick_login{color:#5a5b5b}
.login_main .wrong_notice{color:red;margin:0 0 10px 1px}
.login_main .login_change{margin:6px 0 0 3px}
.platform_box{margin:94px 0 0 0;width:1000px;padding-bottom:16px}
.platform_box nav{ background-image:url(${AdminStatics}/images/qzone_login.png);background-position:0 0;background-repeat:no-repeat;width:370px;height:52px;margin:0 auto}
.platform_box nav .platform_link{width:86px;margin:0 1px;height:52px;line-height:160px;overflow:hidden;display:inline-block;font-size:0;*margin-top:-64px}
.footer{ background:#f0f0f0 url(${AdminStatics}/images/ft_bg.jpg) repeat-x;color:#999}
.footer .inner{width:1000px;margin:0 auto;text-align:center;padding:45px 0}
.footer .links{margin-bottom:15px}
.footer .links .sep{margin:0 12px;color:#d0d3d7}
.footer .copyright{width:580px;margin:0 auto}
.footer .copyright_en{float:left;margin-right:15px}
.footer .copyright_ch{float:left}
.footer .copyright_ch .copyright_link{margin-left:5px}
.wrap {
	overflow:hidden;
	-webkit-animation: bounceIn 600ms linear;
	-moz-animation: bounceIn 600ms linear;
	-o-animation: bounceIn 600ms linear;
	animation: bounceIn 600ms linear;
}
/*登录框动画*/
@-webkit-keyframes bounceIn {
	0% {
		opacity: 0;
		-webkit-transform: scale(.3);
	}

	50% {
		opacity: 1;
		-webkit-transform: scale(1.05);
	}

	70% {
		-webkit-transform: scale(.9);
	}

	100% {
		-webkit-transform: scale(1);
	}
}
@-moz-keyframes bounceIn {
	0% {
		opacity: 0;
		-moz-transform: scale(.3);
	}

	50% {
		opacity: 1;
		-moz-transform: scale(1.05);
	}

	70% {
		-moz-transform: scale(.9);
	}

	100% {
		-moz-transform: scale(1);
	}
}
@-o-keyframes bounceIn {
	0% {
		opacity: 0;
		-o-transform: scale(.3);
	}

	50% {
		opacity: 1;
		-o-transform: scale(1.05);
	}

	70% {
		-o-transform: scale(.9);
	}

	100% {
		-o-transform: scale(1);
	}
}
@keyframes bounceIn {
	0% {
		opacity: 0;
		transform: scale(.3);
	}

	50% {
		opacity: 1;
		transform: scale(1.05);
	}

	70% {
		transform: scale(.9);
	}

	100% {
		transform: scale(1);
	}
}
</style>
<script type="text/javascript">
if (window.parent !== window.self) {
	document.write = '';
	window.parent.location.href = window.self.location.href;
	setTimeout(function () {
		document.body.innerHTML = '';
	}, 0);
}
</script>
</head>
<body>
<div class="wrap">
  <div class="inner">
    <div class="header">
      <h1>{$Config.sitename}</h1>
    </div>
    <div class="qzone_login clearfix">
      <div class="qzone_cont" id="_pt">
        <li><img src="${AdminStatics}/images/login_bg.jpg" alt="p2p贷款管理系统"></li>
      </div>
      <!-- end qzone_cont -->
      <div class="login_main">
        <p class="wrong_notice" id="err_m" style="display:none;"></p>
        <form id="loginform" method="post" name="loginform" action="#" onSubmit="return subtest();"   >
          <ul class="login_list"  id="web_login">
            <li class="login_input">
              <input  value=""  id="u" name="user_name"  class="input_txt" tabindex="1"   type="text" value="" placeholder="帐号名" title="帐号名"  />
            </li>
            <li class="login_input">
              <input maxlength=16 type="password"  id="p" name="user_pass" tabindex="2"   class="input_txt" type="text" value=""  placeholder="密码" title="密码"/>
            </li>
            <li class="yanzhengma clearfix" id="verifytip"> <span id="verifyinput">
              <input  id="verifycode" name="code" maxlength=5 tabindex="3" class="input_txt" type="text" value="" onfocus="$('#verifycodehint').hide();" onblur="if($('#verifycode').val()=='')$('#verifycodehint').show();" placeholder="请输入验证码" />
              </span>
              <div class="yanzhengma_box" id="verifyshow"> <img class="yanzheng_img" id="code_img" alt="" src="${dfn:U('admin/login/verifyCode')}"><a href="javascript:document.getElementById('code_img').src='${dfn:U('admin/login/verifyCode')}?time='+Math.random();void(0);" class="change_img">看不清，换一张</a> </div>
            </li>
            <li>
              <button type="submit" class="login_btn" tabindex="4" id="subbtn">登录</button>
            </li>
          </ul>
        </form>
        <div class="quick_login" id="qlogin"> </div>
      </div>
    </div>
    <div class="platform_box"> </div>
  </div>
</div>
<script type="text/javascript">
function subtest(){
	var userName = $("#u").val();
	var passWord = $("#p").val();
	var verifycode = $("#verifycode").val();
	if(userName==""){
		alert("用户名不能为空");
		return false;
	}
	if(passWord==""){
		alert("密码不能为空");
		return false;
	}
	if(verifycode==""){
		alert("验证码不能为空");
		return false;
	}
	$("#subbtn").html("登陆中..");
	$.post("${dfn:U('admin/login/dologin')}", { "user_name":userName,"user_pass":passWord,"code":verifycode },
	   function(data){
		 if(data.state=='success'){
			$("#subbtn").html("验证成功..");
			window.location.href=data.info; 
		 }else{
			alert(data.info);
		 }
	   }, "json");
   
   return false;
 }
</script>
</body>
</html>