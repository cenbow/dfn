<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>找回密码</title>
<script src="${SiteStatics}Common/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<link  href="${HomeStatics}/Getpass/css/style.css"  type="text/css" rel="stylesheet" />
<%@ include file="../Common/headerBody.jsp"%>
<div class="zyz_retpas"  style="border-bottom:2px solid #69c1ff;padding-bottom:50px;">
	   <div class="zyz_retpas_wper ">
	   	     <h1 class="retpas_tit">找回密码</h1>
	   	     <P class="pt10 pb30"><img src="${HomeStatics}/Getpass/images/retpas_path02.png"></P>
	   	     <div class="retpas_form1">
	   	     	   <form>
	   	     	   	   <fieldset>
	   	     	   	   	    <p>
	   	     	   	   	    	 <label></label>
	   	     	   	   	    	 <span>短信已发送，请注意查收~</span>
	   	     	   	   	    </p>
	   	     	   	   	    <p class="mt20 " style="position:relative;"> 
	   	     	   	   	    	 <label>验证码</label>
	   	     	   	   	    	 <input type="text" id="scode" class="retpas_input" />
	   	     	   	   	    	 <span id="repas_tip" class="retpas_tip">54秒后可重新获取</span>
	   	     	   	   	    </p>
<!-- 	   	     	   	   	    <p class="mb30">
	   	     	   	   	    	 <label></label>
	   	     	   	   	    	 <span>如果没有收到短信，您可在54秒后获取语音验证码</span>
	   	     	   	   	    </p> -->
	   	     	   	   	    <p class="mt30">
	   	     	   	   	    	 <label></label>
	   	     	   	   	    	 <a href="javascript:;" onclick="getPassword('back');" class="retpas_btn">上一步</a>
	   	     	   	   	    	 <a href="javascript:;" onclick="getPassword();" class="retpas_btn">下一步</a>
	   	     	   	   	    </p>
	   	     	   	   </fieldset>
	   	     	   </form>
	   	     </div>
	   	     <p class="retpas_ftcolor">若您无法使用上述方法找回，请联系客服40000-10068或重新注册</p>
	   </div>
</div>
<script type="text/javascript">
function getPassword(){
	var p=makevar(['scode']);
	if(typeof p.scode=="undefined"){
		Mix.tip("#scode","验证码不能为空",1,1);
		return false;
	}
	getData("${dfn:SU(_thisUrl_,'verifySCode')}",function(d){
		if(d.status==1){
			Mix.msg(d.msg,"success",2);
			setTimeout(function(){
				window.location.href=d.url;
			},2000);
		}else{
			Mix.msg(d.msg,"fail",2);
		}
	},p,'json');
}

//设置可以重新获取短信验证码

var seconds = 59;
var speed = 1000;
function countDown(seconds,speed){
	var txt = seconds+"秒后可重新获取";
	$("#repas_tip").html(txt);
	var timeId = setTimeout("countDown(seconds--,speed)",speed);
    if(seconds == 0){
    	    var txt = "重新获取";
    	    var btn = '<a href="javascript:;" onclick="repeatGet();" class="retpas_btn">重新获取</a>';
    	    $("#repas_tip").replaceWith(btn);
            clearTimeout(timeId);
    };
}
countDown(seconds,speed);

function repeatGet(){
	var account = "<%=session.getAttribute("getpassAccount")%>";
	var p = {};
	p.account = account;
	p.isRepeat = 1;
		 
	if(typeof p.account=="undefined"){
		Mix.tip("#account","账号信息错误，请返回上一步",1,1);
		return false;
	}
	getData("${dfn:SU(_thisUrl_,'verifyAccount')}",function(d){
		if(d.status==1){
			Mix.msg(d.msg,"success",2);
			setTimeout(function(){
				window.location.href=d.url;
			},2000);
		}else{
			Mix.msg(d.msg,"fail",2);
		}
	},p,'json');
}
</script>
<%@ include file="../Common/footer.jsp"%>