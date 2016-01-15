<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>找回密码</title>
<link  href="${HomeStatics}/Getpass/css/style.css"  type="text/css" rel="stylesheet" />
<%@ include file="../Common/headerBody.jsp"%>
<div class="zyz_retpas" style="border-bottom:2px solid #f38657;padding-bottom:50px;">
	   <div class="zyz_retpas_wper "  >
	   	     <h1 class="retpas_tit">找回密码</h1>
	   	     <P class="pt10 pb30"><img src="${HomeStatics}/Getpass/images/retpas_path03.png"></P>
	   	     <div class="retpas_form1 pb30">
	   	     	   <form>
	   	     	   	   <fieldset>
	   	     	   	   	    <p class="mt30">
	   	     	   	   	    	 <label>新登陆密码</label>
	   	     	   	   	    	 <input type="password" id="newpass" class="retpas_input retpas_input1" />
	   	     	   	   	    </p>
	   	     	   	   	   <p class="mt20">
	   	     	   	   	    	 <label>确认新登陆密码</label>
	   	     	   	   	    	 <input type="password" id="renewpass" class="retpas_input retpas_input1" />
	   	     	   	   	    </p>
	   	     	   	   	    <p class="mt30">
	   	     	   	   	    	 <label></label>
	   	     	   	   	    	 <a href="javascript:;" onclick="getPassword();" class="retpas_btn">确认</a>
	   	     	   	   	    </p>
	   	     	   	   </fieldset>
	   	     	   </form>
	   	     </div>
	   	     
	   </div>
</div>
<script type="text/javascript">
function getPassword(){
	var p=makevar(['newpass','renewpass']);
	if(typeof p.newpass=="undefined"){
		Mix.tip("#newpass","请设置新密码",1,1);
		return false;
	}
	if(typeof p.renewpass=="undefined"){
		Mix.tip("#renewpass","请确认新密码",1,1);
		return false;
	}
	if(p.renewpass!=p.newpass){
		Mix.tip("#renewpass","新密码与确认密码必须相同",1,1);
		return false;
	}
	getData("${dfn:SU(_thisUrl_,'setnewPass')}",function(d){
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