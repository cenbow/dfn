<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>会员注册</title>
<script src="${HomeStatics}/js/register.js"></script>
<script  type="text/javascript" src="${HomeStatics}/js/validator.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
	<!-- header end -->
	<div class="login_con_wper">
		<div class="login_con ">
			<h2 class="login_con_tit">
				<span>注册</span>
			</h2>
			<div class="reg_con_box">
				<form>
					<fieldset>
						<div class="pb10">
							<label>用户名：</label> <input type="text" name="user_name" id="user_name" placeholder="请输入6-20字符的用户名，且只能包含英文字母,数字" class="reg_input1" /> <span
								class="reg_spantip">*</span>
						</div>
						<div class="pb10">
							<label>手机号码：</label> <input type="text" name="user_phone" id="user_phone" placeholder="请输入手机号" class="reg_input1" /> <span
								class="reg_spantip">*</span><span style="margin-left:10px;">(可作为用户名登录)</span>
						</div>
						<div class="pb10">
							<label>登录密码：</label> <input type="password" name="pass_word"	id="pass_word" placeholder="请输入大于6个字符的登录密码" class="reg_input1" /> <span
								class="reg_spantip">*</span>
						</div>
						<div class="pb10 ">
							<label class="">确认密码：</label> <input type="password"	name="re_pass_word" id="re_pass_word" placeholder="请再次输入密码"
								class="reg_input1 " /> <span class="reg_spantip">*</span>
						</div>
						<div class="reg_email pb10">
							<label>邮箱：</label> <input style="width:305px" type="text" name="email"	id="email" placeholder="请输入常用邮箱" class="reg_input1 " /> <span class="reg_spantip ">*</span>
						</div>
						<div class="pb10">
							<label>邀请码：</label> <input type="text" name="recommend_id"	id="recommend_id" value="${xcode}"  placeholder="选填" class="reg_input1 " /> <span class="reg_spantip "></span>
						</div>
						<div class="reg_yanzheng clear clearfix pb10">
							<label class="fl">验证码：</label> <input type="text" name="vcode"	id="vcode" placeholder="请输入右图验证码" class="reg_input1 fl"
								style="margin-left: 3px;" /> <img src="${dfn:SU(_thisUrl_,'verifyCode')}" width="115px" style="cursor:pointer" onclick="javascript:this.src='${dfn:U('home/login/verifyCode')}?time='+Math.random();void(0);"  /> <span class="reg_spantip fl"
								style="margin-left: 5px; line-height: 40px;">*</span>
						</div>
						<div class="pb20">
							<label style="height: 20px;"></label> <input id="rule" type="checkbox" />
							我已阅读并同意<a href="${_WEB_ROOT_}/article/index.do?id=640" target="_blank" class="reg_ft01" style="color:#69c1ff">《融友网服务条款》</a>
						</div>
						<div>
							<label></label><a href="javascript:;" onclick="register();" class="lg_btn" >立即注册</a>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<!-- end con -->
<script type="text/javascript">
function register(){
	var p = makevar(['user_name','pass_word','re_pass_word','recommend_id','email','user_phone','vcode']);
	var canSubmit = true;
	$(".reg_con_box input").not("#rule").each(function(k, k){
		var res = testInput(this);
        if(res!==true){
			canSubmit=false;
			return false;
		}
    });

	if(!$("#rule").is(":checked")){
		Mix.tip("#rule","必须先同意服务协议",1,4);
		return false;
	}
	

	if(canSubmit!==true) return false;
	Mix.load('提交中......');
	
	postData("${dfn:U('home/register/doRegister')}",p,function(d){
		if(d.status==1){
			Mix.load('注册成功，开通托管帐户......');
			setTimeout(function(){ window.location.href="/member";},2000);
		}
		else  Mix.msg(d.msg,'fail',2);
	});
}

$(document).keydown(function(e){
	if(e.keyCode == 13) {
		register();
	}
});
</script>
<%@ include file="../Common/footer.jsp"%>