<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>找回密码</title>
<link  href="${HomeStatics}/Getpass/css/style.css"  type="text/css" rel="stylesheet" />
<%@ include file="../Common/headerBody.jsp"%>
<div class="zyz_retpas"  style="border-bottom:2px solid #69c1ff;padding-bottom:50px;">
	   <div class="zyz_retpas_wper ">
	   	     <h1 class="retpas_tit">找回密码</h1>
	   	     <P class="pt10 pb30"><img src="${HomeStatics}/Getpass/images/retpas_pic01.png"></P>
	   	     <div class="retpas_form1">
	   	     	   <form>
	   	     	   	   <fieldset>
	   	     	   	   	    <p class="mt20">
	   	     	   	   	    	 <label>手机/邮箱</label>
	   	     	   	   	    	 <input type="text" id="account" class="retpas_input retpas_input1" />
	   	     	   	   	    </p>
	   	     	   	   	    <p class="mt20 mb30">
	   	     	   	   	    	 <label>验证码</label>
	   	     	   	   	    	 <input type="text" id="vcode" class="retpas_input" />
	   	     	   	   	    	 <img src="${dfn:SU(_thisUrl_,'verifyCode')}" width="115px" style="cursor:pointer" onclick="javascript:this.src='${dfn:SU(_thisUrl_,'verifyCode')}?time='+Math.random();void(0);"  />
	   	     	   	   	    </p>
	   	     	   	   	    <p class="mt30">
	   	     	   	   	    	 <label></label>
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
	var p=makevar(['vcode','account']);
	if(typeof p.account=="undefined"){
		Mix.tip("#account","手机/邮箱不能为空",1,1);
		return false;
	}
	if(typeof p.vcode=="undefined"){
		Mix.tip("#vcode","验证码不能为空",1,1);
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