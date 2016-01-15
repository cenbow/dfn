<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>登录</title>

<script src="${HomeStatics}/js/register.js"></script>
<script type="text/javascript" src="${HomeStatics}/js/validator.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
<!-- end top  -->
<div class="login_con_wper">
	<div class="login_con ">
		<h2 class="login_con_tit">
			<span>登录</span>
		</h2>
		<div class="login_con_box">
			<div class="lg_box_l fl">
				<form>
					<fieldset>
						<div class="lg_text1">
							<label>帐号：</label><br />
							<input type="text" name="user_name" class="textput"
								id="user_name" title="请输入6-20字符的用户名，中文占2个字符" />

							<!--  <input type="text" /> -->
						</div>
						<div class="lg_text1">
							<label>密码：</label><br />
							<input type="password" name="pass_word" id="pass_word"
								class="textput" title="请输入大于6个字符的登陆密码" />

							<!--  <input type="text" /> -->
						</div>
						<div class="reg_yanzheng clear clearfix pb10 lg_text1">
							<label>验证码：</label><br />
							<input type="text" name="vcode" id="vcode"
								placeholder="请输入右图中验证码" class="textput fl"
								style="margin-left: 0px;" /> <img
								src="${dfn:U('home/login/verifyCode')}" width="115px"
								style="cursor: pointer"
								onclick="javascript:this.src='${dfn:U('home/login/verifyCode')}?time='+Math.random();void(0);" />
						</div>
						<div class="lg_text2 clear clearfix">
							<span><input type="checkbox" id="isrember" value="1" />1天内自动登陆</span>
							<a href="${dfn:U('home/getpassword/index')}">忘记密码？</a>
						</div>
						<a href="javascript:;" onclick="login();" class="lg_btn pb5">登录</a>
						<p class="lg_linkreg">
							没有帐号密码，<a href="${dfn:U('home/register/index')}">立即注册</a>
						</p>
					</fieldset>
				</form>
			</div>
			<div class="lg_box_r fl">
				<img src="${HomeStatics}/images/lg_pic02.gif">
			</div>
		</div>
	</div>
</div>
<!-- end con -->
<script type="text/javascript">
	function login() {
		var p = makevar([ 'user_name', 'pass_word', 'vcode' ]);
		var canSubmit = true;
		$(".login_con_box input").not("#checked").each(function(k, k) {
			var res = testInput(this);
			if (res !== true) {
				canSubmit = false;
				return false;
			}
		});
		if (canSubmit !== true)
			return false;
		if ($("#isrember").is(":checked"))
			p['isrember'] = 1;
		Mix.load('登陆中......');
		postData("${dfn:U('home/login/doLogin')}", p, function(d) {
			if (d.status == 1) {
				Mix.msg(d.msg, "success", 2);
				setTimeout(function() {
					window.location.href = "${_WEB_ROOT_}/member";
				}, 1000);
			} else {
				Mix.msg(d.msg, 'fail', 2);
				$("#vcode").click();
			}
		});
	}
	$(document).keydown(function(e) {
		if (e.keyCode == 13) {
			login();
		}
	});
</script>
<%@ include file="../Common/footer.jsp"%>