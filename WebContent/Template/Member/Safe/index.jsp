<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>安全设置</title>

<link rel="stylesheet" type="text/css"
	href="${MemberStatics}/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="${MemberStatics}/css/jquery-ui-1.10.3.custom.min.css">
<script type="text/javascript" src="${MemberStatics}/js/jquery.js"></script>
<script type="text/javascript"
	src="${MemberStatics}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${MemberStatics}/js/jquery-ui.min.js"></script>
<style>
.fn-vhid {
	visibility: hidden;
}

.fn-tinput {
	width: 240px;
	height: 30px;
	line-height: 30px\9;
	border: #ddd solid 1px;
	background-color: transparent;
	padding: 0 6px;
}

textarea {
	border: #ddd solid 1px;
	background-color: transparent;
	width: 60%
}

.fn-tinput:focus, textarea:focus {
	border-color: #c00;
}

.bl-form label {
	float: left;
	width: 100px;
	text-align: right;
	padding-top: 6px;
}

.bl-form .controls label {
	width: auto;
}

.bl-form li {
	margin-top: 20px;
	overflow: hidden;
}

em {
	color: #C00;
}

lable.error {
	color: #C00;
	padding: 0 6px;
}
</style>

</head>

<body>
	<%@ include file="../Common/headerBody.jsp"%>

	<%@ include file="../Common/left.jsp"%>



	<!-- <div class="user-con user-safety-options"> -->

	<div class="df_member_content_r">
		<!--  <div class="user-box-1">  -->
		<div class="user-box-title-1 clearFix">
			<h2>安全设置</h2>
		</div>
		<div class="user-box-con-1">
			<ul id="saftyPageList" class="user-safety-options-list clearFix"
				style="overflow: hidden">
				<li class="user-safety-options-item clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"> <i
							class="icon-check"></i> <strong>用户名</strong>
						</span> <span class="user-safety-options-value">${_USERINFO_.user_name}</span>
					</div>
				</li>
				<li class="user-safety-options-item clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"><i
							class="icon-check"></i><strong>手机认证</strong></span> <span
							class="user-safety-options-value" style="text-align:right;color:#aaa">新用户请点击修改获取短信验证码完成手机认证${_USERINFO_.user_phone}<a
							id="phoneAnchor" name="phoneAnchor"> </a></span> <span id="phoneBtn2"
							class="user-safety-options-state" switchtext="取消修改">修改</span>
					</div>
					<div id="phoneWrapper" class="user-safety-options-edit"
						style="height: 384px; display: none;">
						<!--修改手机步骤-->
						<div id="phoneStatus1" class="options-step">
							<div class="options-step-con clearFix">
								<span class="options-step-current"> 验证<c:if test="${verifyStatus.phone_status eq 1}">原</c:if>手机号码 <strong>1</strong></span>
                                <c:if test="${verifyStatus.phone_status eq 1}">
                                <span> 验证新手机号码 <strong>2</strong></span> 
                                <span> 成功 <strong>3</strong></span>
                                </c:if>
							</div>
						</div>
						<!--手机认证begin-->
						<div id="phoneCon1" class="form-style-1 clearFix"
							style="display: none;" _step="2">
							<form id="phoneForm_1" novalidate>
								<ul class="form-style-1-field ">
									<li class="form-style-1-item"><label id="phoneNewText"
										class="form-style-1-label">原手机号码</label> 
                                        <span class="form-style-1-value">
                                        <input id="phoneNum" value="${user_info.user_phone}" name="phone" type="text" class="input-text-style-1 form-style-1-value"></span>
                                        <span class="form-style-1-other" style="width: auto">
                                        <input	id="sendSmsBtn1" type="button" value="获取短信验证码"	class="btn-style-1 sms-channel"></span> 
                                        <span class="form-style-1-error"></span>
                                    </li>
									<li class="form-style-1-item yuyin-channel"
										style="display: none;"><label class="form-style-1-label">&nbsp;</label><span
										class="form-style-1-other"><i class="js_info0">如果没有收到短信，您可</i><i
											class="js_info3"></i><i class="js_info1">请注意接听40000-10068 的来电，若没收到，您可</i><i class="yyct"></i><i
											class="js_info2">重新</i><i style="display: block">获取</i><input
											value="语音验证码" data-voice="true" class="voicech" type="button"></span></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">短信验证码</label> <span
										class="form-style-1-value"><input name="sms_vcode"
											type="text" class="input-text-style-1 form-style-1-value"></span>
										<span class="form-style-1-error"></span></li>
								</ul>
								<div class="form-style-1-submit">
									<input id="phoneSubmitBtn" type="submit" class="btn-style-3" value="下一步">
								</div>
								<input class="js_vnum" type="hidden" value="1" disabled="">
							</form>
							<form id="phoneForm_2" novalidate style="display: none;">
								<ul class="form-style-1-field ">
									<li class="form-style-1-item"><label id="phoneNewText"
										class="form-style-1-label">新手机号码</label> <span
										class="form-style-1-value"><input id="phoneNum"
											name="phone" type="text"
											class="input-text-style-1 form-style-1-value valid"></span>
										<span class="form-style-1-other" style="width: auto"><input
											id="sendSmsBtn2" type="button" value="获取验证码"
											class="sms-channel btn-style-1"></span> <span
										class="form-style-1-error"></span></li>
									<li class="form-style-1-item yuyin-channel"
										style="display: none;"><label class="form-style-1-label">&nbsp;</label><span
										class="form-style-1-other"><i class="js_info0"
											style="display: inline;">如果没有收到短信，您可</i><i class="js_info3"
											style="display: none;"></i><i class="js_info1"
											style="display: none;">请注意接听 40000-10068 的来电，若没收到，您可</i><i
											class="yyct" style="display: inline;">在 27秒 后</i><i
											class="js_info2">重新</i><i style="display: block">获取</i><input
											value="语音验证码" data-voice="true" class="voicech voicechdis"
											type="button" disabled="disabled"></span></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">短信验证码</label> <span
										class="form-style-1-value"><input name="sms_vcode"
											type="text"
											class="input-text-style-1 form-style-1-value form-style-1-error"></input></span>
										<span class="form-style-1-error"><label for="sms_vcode"
											class="form-style-1-error" style="display: block;">请输入手机验证码~</label></span></li>
								</ul>
								<div class="form-style-1-submit">
									<input id="phoneSubmitBtn_1" type="submit" class="btn-style-3"
										value="下一步">
								</div>
								<input class="js_vnum" type="hidden" value="2" disabled="">
							</form>
						</div>
						<!--手机认证 end-->
						<div id="phoneCon2" class="form-style-1 clearFix"
							style="display: none;">
							<div class="user-safety-options-succeed clearFix">
								<span class="user-safety-options-succeed-true">&nbsp;</span> <span
									class="user-safety-options-succeed-txt">恭喜您成功修改手机号</span>
							</div>
						</div>
						<!--手机认证状态提示end-->
						<div class="form-warm-prompt-1 clearFix">
							<span class="form-warm-prompt-title">温馨提示：</span>
							<p>1. &nbsp;&nbsp;请填写真实有效的手机号，手机号将作为验证用户身份的重要手段。</p>
							<p>2. &nbsp;&nbsp;融友网会对用户的所有资料进行严格保密。</p>
							<p>3. &nbsp;&nbsp;手机认证过程遇到问题，请联系客服，40000-10068。</p>
						</div>
					</div>
				</li>
				<li class="user-safety-options-item clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"><i
							class="icon-check"></i><strong>实名认证</strong><a id="realAnchor"
							name="realAnchor"> </a></span> <span class="user-safety-options-value"><span
							class="fl">${_USERINFO_.real_name}</span><span class="fr"><a
								href="http://www.p2pok.com/article/index.do?id=673" target="_blank" style="color: #3181d8">《新浪支付快捷支付与银行卡变更协议》</a></span><span
							class="fr"><a href="http://www.p2pok.com/article/index.do?id=645" target="_blank"
								style="color: #3181d8">《融友网借款合同》</a></span></span> <span id="realnameBtn2"
							class="user-safety-options-state" switchtext="取消修改">修改</span>
					</div>
					<div title="实名认证提示" id="realWrapper_prompt"
						class="user-safety-options-editttttt" style="display: none">
						<div class="state-prompt-txt-tanhao clearFix">
							<div class="state-prompt-style">
								<h2>修改实名认证需要联系客服</h2>
								您可以联系 <a href="#" target="_blank">【在线客服】</a><br>或拨打：40000-10068，联系客服修改
							</div>
						</div>
					</div>
					<div id="realWrapper" class="user-safety-options-edit"
						style="display: none;">
						<!--实名认证接口认证begin-->
						<div id="realApiCon" class="form-style-1 clearfix">
							<form id="realName_form" novalidate>
								<ul class="form-style-1-field ">
									<li class="form-style-1-item"><label
										class="form-style-1-label">用户名</label> <span
										class="form-style-1-value">${_USERINFO_.user_name}</span></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">真实姓名</label>
                                        <span class="form-style-1-value">
                                        <c:if test="${verifyStatus.id_status eq 1}">
                                        ${user_info.real_name}
                                        </c:if>
                                        <c:if test="${verifyStatus.id_status != 1}">
                                        <input name="realname"	type="text" class="input-text-style-1 form-style-1-value">
                                        </c:if>
                                        </span>
										<span class="form-style-1-error"></span></li>
									<li class="form-style-1-item"><label class="form-style-1-label">身份证号码</label>
                                    <span class="form-style-1-value">
                                    <c:if test="${verifyStatus.id_status eq 1}">
                                    ${dfn:hideCard(user_info.idcard,3,15)}
                                    </c:if>
                                    <c:if test="${verifyStatus.id_status != 1}">
                                    <input name="card_id" type="text" class="input-text-style-1 form-style-1-value">
                                    </c:if>
                                    </span>
										<span class="form-style-1-error"></span></li>
                                        
                                    <c:if test="${verifyStatus.id_status != 1}">
									<li class="form-style-1-item"><label
										class="form-style-1-label">&nbsp;</label> <span
										class="form-style-1-value-1" style="width: 290px"><input
											id="serviceAgreement" style="margin-top: 8px;"
											name="serviceAgreement" type="checkbox">&nbsp;&nbsp;<label
											for="serviceAgreement">我已阅读并同意签署 <a href="#"
												target="_blank" class="service-agreement">《融友网服务协议》</a></label></span> <span
										class="form-style-1-error" for="serviceAgreement"></span></li>
									<li class="form-style-1-item" style="margin-top: 0"><label
										class="form-style-1-label">&nbsp;</label> <span
										class="form-style-1-value-1" style="width: 300px"><input
											id="mandateAgreement" style="margin-top: 8px;"
											name="mandateAgreement" type="checkbox">&nbsp;&nbsp;<label
											for="mandateAgreement">我已阅读并同意签署 <a href="#"
												target="_blank" class="service-agreement">《委托收付资金协议》</a></label></span> <span
										class="form-style-1-error" for="mandateAgreement"></span></li>
                                    </c:if>
								</ul>
                                <c:if test="${verifyStatus.id_status != 1}">
								<div class="form-style-1-submit">
									<input id="realSubmitBtn1" type="submit" class="btn-style-3"
										value="提交实名认证">
								</div>
                                </c:if>
                                
							</form>
						</div>
						<!--实名认证接口认证end-->

						<!--手机认证 end-->
						<div id="successCon" class="form-style-1 clearfix"
							style="display: none">
							<div class="user-safety-options-succeed clearfix">
								<span class="user-safety-options-succeed-true">&nbsp;</span> <span
									class="user-safety-options-succeed-txt">恭喜您认证成功</span>
							</div>
						</div>
						<!--实名认证上传认证end-->
						<div class="form-warm-prompt-1 clearfix">
							<span class="form-warm-prompt-title">温馨提示：</span>
							<p>1.&nbsp;&nbsp;请谨慎填写身份验证信息，因为调用公安局的验证接口需要支付5元费用，融友网会为用户垫付首次验证费用。</p>
							<p>2. &nbsp;&nbsp;未满18周岁，实名认证无法通过。</p>
							<p>3. &nbsp;&nbsp;融友网会对用户的所有资料进行严格保密。</p>
							<p>4. &nbsp;&nbsp;实名认证过程遇到问题，请联系客服，40000-10068</p>
						</div>
					</div>

				</li>
				<li
					class="user-safety-options-item user-safety-options-email clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"><i
							class="icon-check"></i><strong>邮箱验证</strong><a id="emailAnchor"
							name="emailAnchor"> </a></span> <span class="user-safety-options-value">${_USERINFO_.user_email}&nbsp;</span>
						<span id="emailBtn2" class="user-safety-options-state"
							switchtext="取消修改">修改</span>
					</div>
					<div id="emailWrapper" class="user-safety-options-edit"
						style="height: 310px; display: none;">
						<!--修改认证邮箱begin-->
						<div id="emailCon2" class="user-safety-options-email-edit">
							<!--填写修改的邮箱地址begin-->
							<div id="emailCon21" class="form-style-1 clearFix">
								<form id="emilForm" novalidate>
									<ul class="form-style-1-field ">
										<li class="form-style-1-item"><label
											class="form-style-1-label">原邮箱地址</label> <input
											name="oldemail" type="text"
											class="input-text-style-1 form-style-1-value"></li>
										<li class="form-style-1-item"><label
											class="form-style-1-label">新邮箱地址</label> <input name="email"
											type="text" class="input-text-style-1 form-style-1-value">
										</li>
									</ul>
									<div class="form-style-1-submit" style="line-height: 33px;">
										<input id="emailSendSubmit2" type="submit" class="btn-style-3"
											value="发送验证邮件">
									</div>
								</form>
							</div>
							<!--前往邮箱网站认证-->
							<div id="emailCon22" class="form-style-1 clearFix"
								style="display: none;">
								<div class="form-style-1-submit" style="line-height: 33px;">
									已向您的新邮箱发送一封验证邮件</div>
								<div class="form-style-1-submit" style="line-height: 33px;">
									<a id="gotoEmailBtn2" target="_blank" class="btn-style-3">前往查看</a>
								</div>
							</div>
						</div>
						<div class="form-warm-prompt-1 clearFix">
							<span class="form-warm-prompt-title">温馨提示：</span>
							<p>1. &nbsp;&nbsp;请填写真实有效的邮箱地址，您可通过邮箱进行找回密码等操作。</p>
							<p>2. &nbsp;&nbsp;融友网会对用户的所有资料进行严格保密。</p>
							<p>3. &nbsp;&nbsp;邮箱验证过程遇到问题，请联系客服，40000-10068</p>
						</div>
						<!--修改认证邮箱end-->
					</div>
				</li>
				<!--登陆密码修改begin-->
				<li class="user-safety-options-item clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"><i
							class="icon-check"></i><strong>登录密码</strong><a id="pwdAnchor"
							name="pwdAnchor"> </a></span> <span class="user-safety-options-value">&nbsp;</span>
						<span id="pwdBtn1" class="user-safety-options-state"
							switchtext="取消修改">修改</span>
					</div>
					<div id="pwdWrapper" class="user-safety-options-edit"
						style="height: 322px; display: none;">
						<div id="pwdCon1" class="form-style-1 clearFix">
							<form id="pswForm"  novalidate>
								<ul class="form-style-1-field ">
									<li class="form-style-1-item"><label
										class="form-style-1-label">原登录密码</label> <input
										name="oldpassword" type="password"
										class="input-text-style-1 form-style-1-value"></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">新登录密码</label> <input id="pwdpas"
										name="newpassword" type="password"
										class="input-text-style-1 form-style-1-value"></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">再次输入新登录密码</label> <input
										name="newpassword1" type="password"
										class="input-text-style-1 form-style-1-value"></li>
								</ul>
								<div class="form-style-1-submit">
									<input id="pwdSubmit" type="submit" class="btn-style-3"
										value="修改登录密码">
								</div>
							</form>
						</div>
						<div id="pwdCon2" class="form-style-1 clearFix"
							style="display: none;">
							<div class="user-safety-options-succeed clearFix">
								<span class="user-safety-options-succeed-true">&nbsp;</span> <span
									class="user-safety-options-succeed-txt">恭喜您成功登陆密码</span>
							</div>
						</div>
						<div class="form-warm-prompt-1 clearFix">
							<span class="form-warm-prompt-title">温馨提示：</span>
							<p>1. &nbsp;&nbsp;请牢记您设置的新密码，登录密码可通过密码找回功能找回。</p>
							<p>2. &nbsp;&nbsp;邮箱验证过程遇到问题，请联系客服，4000-10068</p>
						</div>
					</div>
				</li>
				<!--登陆密码修改end-->
				<!--支付密码begin-->
				<li class="user-safety-options-item clearFix">
					<div class="user-safety-options-show clearFix">
						<span class="user-safety-options-name"><i
							class="icon-check"></i><strong>支付密码</strong><a id="payPwdAnchor"
							name="payPwdAnchor"> </a></span> <span class="user-safety-options-value" style="text-align:right;color:#aaa">新用户支付密码默认为网站登录密码</span>
						<span id="payPwdBtn2" class="user-safety-options-state "
							switchtext="取消修改">修改</span>

					</div>
					<div id="payPwdWrapper" class="user-safety-options-edit"
						style="height: 383px; display: none;">
						<div id="payPwdCon2" class="form-style-1 clearFix" style="">
							<form id="payPswForm"  novalidate>
								<ul class="form-style-1-field ">
									<li class="form-style-1-item"><label
										class="form-style-1-label">原支付密码</label> <input
										name="oldpassword" type="password"
										class="input-text-style-1 form-style-1-value"></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">新支付密码</label> <input id="pas2"
										name="newpassword" type="password"
										class="input-text-style-1 form-style-1-value"></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">确认支付密码</label> <input
										name="newpassword1" type="password"
										class="input-text-style-1 form-style-1-value"></li>
								</ul>
								<div class="form-style-1-submit">
									<input id="ppSubmit2" type="submit" class="btn-style-3"
										value="修改支付密码"> <a id="findPayPwdBtn" href="###"
										class="subBtn-style1">找回支付密码</a>
								</div>
							</form>
						</div>
						<div id="payPwdCon3" class="form-style-1 clearFix"
							style="display: none;">
							<form id="payPswForm_1"  novalidate>
								<ul class="form-style-1-field">
									<li class="form-style-1-item"
										style="margin-top: 0; text-align: center">
										我们会将验证码发送到您的已认证手机上</li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">手机验证码</label> <span
										class="form-style-1-value" style="width: auto"><input
											name="sms_vcode" type="text"
											class="input-text-style-1 form-style-1-value"><input
											id="sendSmsBtn3" type="button" value="获取短信验证码"
											class="btn-style-1 sms-channel"></span> <span
										class="form-style-1-error"></span></li>
									<li class="form-style-1-item yuyin-channel"
										style="display: none;"><label class="form-style-1-label">&nbsp;</label><span
										class="form-style-1-other"><i class="js_info0">如果没有收到短信，您可</i><i
											class="js_info3"></i><i class="js_info1">请注意接听
												40000-10068 的来电，若没收到，您可</i><i class="yyct"></i><i
											class="js_info2">重新</i><i style="display: block">获取</i><input
											value="语音验证码" data-voice="true" data-type="special"
											class="voicech" type="button"></span></li>

									<li class="form-style-1-item"><label
										class="form-style-1-label">新支付密码</label> <span
										class="form-style-1-value"><input id="pas3"
											name="newpassword" type="password"
											class="input-text-style-1 form-style-1-value"></span> <span
										class="form-style-1-error"></span></li>
									<li class="form-style-1-item"><label
										class="form-style-1-label">确认支付密码</label> <span
										class="form-style-1-value"><input name="newpassword1"
											type="password" class="input-text-style-1 form-style-1-value"></span>
										<span class="form-style-1-error"></span></li>
								</ul>
								<div class="form-style-1-submit">
									<input id="ppSubmit3" type="submit" class="btn-style-3"
										value="修改支付密码">
								</div>
							</form>
						</div>
						<div id="payPwdCon4" class="form-style-1 clearFix"
							style="display: none;">
							<div class="user-safety-options-succeed clearFix">
								<span class="user-safety-options-succeed-true">&nbsp;</span> <span
									class="user-safety-options-succeed-txt">恭喜您成功修改支付密码</span>
							</div>
						</div>
						<div class="form-warm-prompt-1 clearFix">
							<span class="form-warm-prompt-title">温馨提示：</span>
							<p>1. &nbsp;&nbsp;请牢记您设置的支付密码，支付密码将用于投资，提现等重要操作。</p>
							<p>2. &nbsp;&nbsp;使用过程遇到问题，请联系客服，40000-10068</p>
							<p>3. &nbsp;&nbsp;支付密码初始为登陆密码</p>
						</div>
					</div>
				</li>
				<!--支付密码end-->
				<!--风险调查问卷begin-->
				<!-- 紧急联系人end -->
			</ul>
		</div>
	</div>
	</div>



	<script type="text/javascript">
		$(function() {
			
			$('#sendSmsBtn1,#sendSmsBtn2,#sendSmsBtn3').click(function(){
				var lable = $(this).attr("id");
				var phone = "";
				var p={};
				if (lable == "sendSmsBtn1"){
					 phone = $("#phoneForm_1").find("input[name='phone']").val();
				}else if (lable == "sendSmsBtn2"){
					 phone = $("#phoneForm_2").find("input[name='phone']").val();
				}else if (lable == "sendSmsBtn3"){
					 phone = $("#payPswForm_1").find("input[name='phone']").val();
					 p['type']="pin";
				}
				p['phone']=phone;
				getData("${dfn:SU(_thisUrl_,'sendToPhone')}",function(d){
					
					if(d.status==1){
						Mix.msg(d.msg,"success",2);
						
					}else{
						Mix.msg(d.msg,"fail",2);
					}
				},p,'json');
			});
			
			
			var $state = $('.user-safety-options-state');
			var $edit = $('.user-safety-options-edit');

			$.validator.setDefaults({
				errorClass : "form-style-1-error"
			})
			$.validator.methods.phone = function(value) {
				var patten = new RegExp(/^1\d{10}$/);
				return patten.test(value)
			}
			$.validator.methods.idCard = function(value) {
				var patten = new RegExp(/^\d{17}[0-9xX]$/);
				return patten.test(value)
			}
			$.validator.methods.chinese = function(value) {
				var patten = new RegExp(/^[·\u4e00-\u9fa5]+$/);
				return patten.test(value)
			}
			$.validator.methods.idCard2 = function(value) {
				if (1 == $("#card_type").val()) {
					var patten = new RegExp(/^\d{17}[0-9xX]$/);
					return patten.test(value)
				}
				return !0
			}
			$.validator.methods.isDifferent = function(value, element, param) {
				return $.trim($(param).val()) === $.trim(value) ? !1 : !0
			}

			$('.user-safety-options-state').click(function() {
				var _this = $(this);
				var cwh = _this.attr('switchtext');
				var _id = _this.attr('id');
				switch (_id) {
				case "phoneBtn2":
					phoneCheck();
					break;
				case "realnameBtn2":
					realName();
					break;
				case "emailBtn2":
					emailCheck();
					break;
				case "pwdBtn1":
					resetLogPsw();
					break;
				case "payPwdBtn2":
					resetPaymentPsw();
					break;
				}
				;
				var index = $(this).index('.user-safety-options-state');
				//alert(index);
				if (cwh) {
					$(this).toggleClass('safe-off');
				} else {
					return false;
				}
				if ($state.not($(this)).hasClass('safe-off'))
					$state.not($(this)).removeClass('safe-off');
				showOrhide(index, _this);
			})

			function showOrhide(index, _this) {
				var defaultText = '修改';
				var switchText = '取消修改';
				var cancleText = '取消';
				var cwh = _this.attr('switchtext');
				
				if (_this.hasClass('safe-off') && _this.has(cwh)) {
					$edit.slideUp().eq(index).slideDown();
					$state.attr('switchtext', switchText).html(defaultText).eq(index).attr('switchtext',defaultText).html(switchText);
				} else {
					$edit.eq(index).slideUp();
					_this.attr('switchtext', switchText).html(defaultText)
				}

			}

			//手机验证
			function phoneCheck(_this) {
				var index = 0;
				$('#phoneCon1').show();
				$('#phoneSubmitBtn').click(function() {
					/*var check = v1.form();
							alert(check);
							 if (check) {
								$('#phoneForm_1').hide();
								$('#phoneForm_2').show();
								index++;
								index = index;

							} else {
								return false;
							}

							$('.options-step-con span').eq(index).addClass(
									'options-step-current').siblings('span')
									.removeClass('options-step-current') */
						});
				$('#phoneSubmitBtn_1').click(
						function() {
							/* var check = v2.form();

							if (check) {
								index++;
								$('#phoneForm_2').hide();
								$('#phoneCon2').show();
							} else {
								return false;
							}
							$('.options-step-con span').eq(index).addClass(
									'options-step-current').siblings('span')
									.removeClass('options-step-current') */
						})
				var v1 = $("#phoneForm_1").validate(
						{
							rules : {
								phone : {
									required : !0,
									phone : !0
								},
								sms_vcode : {
									required : !0,
									digits : !0,
									rangelength : [ 6, 6 ]
								}
							},
							messages : {
								phone : {
									required : "请输入手机号~",
									phone : "请输入正确的手机号喔，亲~"
								},
								sms_vcode : {
									required : "请输入手机验证码~",
									digits : "验证码必须为数字喔~",
									rangelength : "验证码为6位数字~"
								},
							},
							debug : true,
							onfocusout : false,
							submitHandler : function(form){
								var newP2 = $(form).find("input[name='sms_vcode']").val();
								var phone = $(form).find("input[name='phone']").val();
								var p={'phone':phone,  'sms_vcode':newP2};
									getData("${dfn:SU(_thisUrl_,'retPhone')}",function(d){
									
									if(d.status==1){
										Mix.msg(d.msg,"success",2);
										
											$('#phoneForm_1').hide();
											
											<c:if test="${verifyStatus.phone_status != 1}">
											$('#phoneCon2').show();
											</c:if>
											<c:if test="${verifyStatus.phone_status eq 1}">
											$('#phoneForm_2').show();
											</c:if>
											index++;
											index = index;


										$('.options-step-con span').eq(index).addClass(
												'options-step-current').siblings('span')
												.removeClass('options-step-current')
									}else{
										
										Mix.msg(d.msg,"fail",2);
										 
									}
								},p,'json');	
								
					 	
									
						},
							errorPlacement : function(error, element) {
								error.appendTo(element.parent('span').siblings(
										'span.form-style-1-error'));
							}
						});

			
			
			var v2 = $("#phoneForm_2").validate(
					{
						rules : {
							phone : {
								required : !0,
								phone : !0
							},
							sms_vcode : {
								required : !0,
								digits : !0,
								rangelength : [ 6, 6 ]
							}
						},
						messages : {
							phone : {
								required : "请输入手机号~",
								phone : "请输入正确的手机号喔，亲~"
							},
							sms_vcode : {
								required : "请输入手机验证码~",
								digits : "验证码必须为数字喔~",
								rangelength : "验证码为6位数字~"
							},
						},
						debug : true,
						onfocusout : false,
						submitHandler : function(form){
							var newP2 = $(form).find("input[name='sms_vcode']").val();
							var phone = $(form).find("input[name='phone']").val();
							var p={'phone':phone, 'sms_vcode':newP2};
							getData("${dfn:SU(_thisUrl_,'retPhone2')}",function(d){
								
								if(d.status==1){
									Mix.msg(d.msg,"success",2);
									 
										index++;
										$('#phoneForm_2').hide();
										$('#phoneCon2').show();
									 
									$('.options-step-con span').eq(index).addClass(
											'options-step-current').siblings('span')
											.removeClass('options-step-current')
								}else{
									Mix.msg(d.msg,"fail",2);
									 
								}
							},p,'json');	
								
				 	
								
					},
						errorPlacement : function(error, element) {
							error.appendTo(element.parent('span').siblings(
									'span.form-style-1-error'));
						}
					});

		}
			//实名认证
			function realName() {
				//$('#realWrapper').show();
				$('#realSubmitBtn1').click(function() {
					var check = v.form();
				})
				var v = $('#realName_form').validate({
					rules : {
						realname : {
							required : !0,
							rangelength : [ 2, 15 ],
							chinese : !0
						},
						card_id : {
							required : !0,
							idCard : !0
						},
						serviceAgreement : {
							required : !0
						},
						mandateAgreement : {
							required : !0
						}
					},
					messages : {
						realname : {
							required : "请输入您的真实姓名~",
							rangelength : "名字请在2-15位之间呦~",
							chinese : "请输中文名字~"
						},
						card_id : {
							required : "请输入身份证号码~",
							idCard : "身份证号码需要是18位的标准格式~"
						},
						serviceAgreement : {
							required : "请同意X投资服务协议~"
						},
						mandateAgreement : {
							required : "请同意委托收付资金协议~"
						}
					},
					debug : true,
					onfocusout : false,
					submitHandler : function(form){
						 
						var oldP = $(form).find("input[name='realname']").val();
						var newP = $(form).find("input[name='card_id']").val();
						 	 
						var p={'realName':oldP,'card_id':newP};
						
						getData("${dfn:SU(_thisUrl_,'realNameVerify')}",function(d){
							
							if(d.status==1){
								Mix.msg(d.msg,"success",2);
								$("#realApiCon").hide();
								$("#successCon").show();
							}else{
								Mix.msg(d.msg,"fail",2);
							}
						},p,'json');	
							
			 	
							
				},
					errorPlacement : function(error, element) {
						error.appendTo(element.parent());
					}
				})
			}
			//邮箱验证
			function emailCheck() {
				$('#emailSendSubmit2').click(function() {
				
					var check = v.form();
					
				})
				var v = $("#emilForm").validate({
					rules : {
						oldemail : {
							required : !0,
							//trimEmail : !0,
							rangelength : [ 5, 50 ]
						},
						email : {
							required : !0,
							//trimEmail : !0,
							rangelength : [ 5, 50 ],
							isDifferent : "#emailCon2 input[name=oldemail]"
						}
					},
					messages : {
						oldemail : {
							required : "请输入原邮箱~",
							//trimEmail : "邮箱格式不正确喔，亲~",
							rangelength : "邮箱长度请控制在5-50位~"
						},
						email : {
							required : "请输入邮箱~",
							//trimEmail : "邮箱格式不正确喔，亲~",
							rangelength : "邮箱长度请控制在5-50位~",
							isDifferent : "新邮箱和原邮箱不能一样喔~"
						},
					},
					debug : true,
					onfocusout : false,
					submitHandler : function(form){
						var oldP = $(form).find("input[name='oldemail']").val();
						var newP = $(form).find("input[name='email']").val();
						
						var p={'oldemail':oldP,'email':newP};
						
						getData("${dfn:SU(_thisUrl_,'sendToEmail')}",function(d){
							
							if(d.status==1){
								Mix.msg(d.msg,"success",2);
								
							}else{
								Mix.msg("请正确填写邮箱！","fail",2);
							}
						},p,'json');	
							
			 	
							
				},
					errorPlacement : function(error, element) {
						error.appendTo(element.parent());
					}
				});

			}

			//重置登陆密码
			function resetLogPsw() {
				$('#pwdSubmit').click(function() {
					/* var check = v.form();
					if (check) {
						$('#pwdCon1').hide()
						$('#pwdCon2').show();
					} else {
						return false;
					} */
				})
				var v = $("#pswForm").validate({
					rules : {
						oldpassword : {
							required : !0,
							rangelength : [ 6, 16 ]
						},
						newpassword : {
							required : !0,
							rangelength : [ 6, 16 ],
							isDifferent : "#pwdCon1 input[name=oldpassword]"
						},
						newpassword1 : {
							equalTo : "#pwdpas"
						}
					},
					messages : {
						oldpassword : {
							required : "请输入原登录密码~",
							rangelength : "密码请控制在6-16位以内喔~"
						},
						newpassword : {
							required : "请输入新登录密码~",
							rangelength : "密码请控制在6-16位以内喔~",
							isDifferent : "新密码不能和原密码一样喔~"
						},
						newpassword1 : {
							equalTo : "请和上一次输入的密码保持一致~"
						}
					},
					debug : true,
					onfocusout : false,
					submitHandler : function(form){
						 
						var oldP = $(form).find("input[name='oldpassword']").val();
						var newP = $(form).find("input[name='newpassword']").val();
						 	 
						var p={'oldpassword':oldP,'newpassword':newP};
						
						getData("${dfn:SU(_thisUrl_,'retLoginPassword')}",function(d){
							
							if(d.status==1){
								Mix.msg(d.msg,"success",2);
								$('#pwdCon1').hide()
								$('#pwdCon2').show();
							}else{
								Mix.msg(d.msg,"fail",2);
							}
						},p,'json');	
							
			 	
							
				},
					errorPlacement : function(error, element) {
						error.appendTo(element.parent());
					}
				});
			}

			//重置支付密码
			function resetPaymentPsw() {
				nextStep('findPayPwdBtn', 'payPwdCon2', 'payPwdCon3');
				$('#ppSubmit2').click(function() {
					var check = resetPayPsw.step1().v.form();
				})
				$('#ppSubmit3').click(function() {
					var check = resetPayPsw.step2().v.form();
				})
				var resetPayPsw = {
					step1 : function() {
						var v = $("#payPswForm")
								.validate(
										{
											rules : {
												oldpassword : {
													required : !0,
													rangelength : [ 6, 16 ]
												},
												newpassword : {
													required : !0,
													rangelength : [ 6, 16 ],
													isDifferent : "#payPwdCon2 input[name=oldpassword]"
												},
												newpassword1 : {
													equalTo : "#pas2"
												}
											},
											messages : {
												oldpassword : {
													required : "请输入原支付密码~",
													rangelength : "密码请控制在6-16位以内喔~"
												},
												newpassword : {
													required : "请输入新支付密码~",
													rangelength : "密码请控制在6-16位以内喔~",
													isDifferent : "新密码不能和原密码一样喔~"
												},
												newpassword1 : {
													equalTo : "请和上一次输入的密码保持一致~"
												}
											},
											debug : true,
											onfocusout : false,
											submitHandler : function(form){
												 
													var oldP = $(form).find("input[name='oldpassword']").val();
													var newP = $(form).find("input[name='newpassword']").val();
													 	 
													var p={'oldpassword':oldP,'newpassword':newP};
													
													getData("${dfn:SU(_thisUrl_,'retPayPassword')}",function(d){
														
														if(d.status==1){
															Mix.msg(d.msg,"success",2);
															
														}else{
															Mix.msg(d.msg,"fail",2);
														}
													},p,'json');	
														
										 	
														
											},
											errorPlacement : function(error,
													element) {
												error
														.appendTo(element
																.parent());
											}
										});
					},
					step2 : function() {
						var v = $("#payPswForm_1")
								.validate(
										{
											rules : {
												sms_vcode : {
													required : !0,
													digits : !0,
													rangelength : [ 6, 6 ]
												},
												newpassword : {
													required : !0,
													rangelength : [ 6, 16 ],
													isDifferent : "#payPwdCon3 input[name=oldpassword]"
												},
												newpassword1 : {
													equalTo : "#pas3"
												}
											},
											messages : {
												sms_vcode : {
													required : "请输入手机验证码~",
													digits : "验证码必须为数字喔~",
													rangelength : "验证码为6位数字~"
												},
												newpassword : {
													required : "请输入新支付密码~",
													rangelength : "密码请控制在6-16位以内喔~",
													isDifferent : "新密码不能和原密码一样喔~"
												},
												newpassword1 : {
													equalTo : "请和上一次输入的密码保持一致~"
												}
											},
											debug : true,
											onfocusout : false,
											submitHandler : function(form){
												var code = $(form).find("input[name='sms_vcode']").val();
												var newP = $(form).find("input[name='newpassword']").val();
												 	 
												var p={'sms_vcode':code,'newpassword':newP};
												
												getData("${dfn:SU(_thisUrl_,'retPasswordWithCode')}",function(d){
													if(d.status==1){
														Mix.msg(d.msg,"success",2);
														
													}else{
														Mix.msg(d.msg,"fail",2);
													}
												},p,'json');	
													
									 	
													
										},
											errorPlacement : function(error,
													element) {
												error
														.appendTo(element
																.parent()
																.siblings(
																		'span.form-style-1-error'));
											}
										});
					}
				};
			}

			//nextStep
			function nextStep(btn, oldStep, nextStep) {
				var _btn = $('#' + btn);
				var _oldStep = $('#' + oldStep);
				var _nextStep = $('#' + nextStep);

				_btn.click(function() {
					_oldStep.hide();
					_nextStep.show();
				})
			}

		})
	</script>
</body>
</html>
