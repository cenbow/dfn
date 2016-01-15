<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="/newadmin-cache_borrow_fee-index-menuid-123.shtml">手机通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">手机信息</a></li>
			<li><a href="#B" data-toggle="tab">借款者提醒相关</a></li>
			<li><a href="#C" data-toggle="tab">投资款者提醒相关</a></li>
		</ul>
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="h_a">手机信息</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150">手机认证：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[verify]" id="msgPhone[verify]">#UserName#您好，你的手机认证码是#CODE#。</textarea><span
											class="commonToolTip">#CODE#:认证码,#UserName#:用户名(verify)</span></td>
									</tr>
									<tr>
										<th width="150">提现验证：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[withdraw]" id="msgPhone[withdraw]">#UserName#您好，你的提现认证码是#CODE#。</textarea><span
											class="commonToolTip">#CODE#:验证码(withdraw)</span></td>
									</tr>
									<tr>
										<th width="150">密码找回：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[getPassWord]" id="msgPhone[getPassWord]">#UserName#您好，你的找回密码验证码是#CODE#。</textarea><span
											class="commonToolTip">#CODE#:验证码,#UserName#:用户名(getPassWord)</span></td>
									</tr>
									<tr>
										<th width="150">充值成功：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[recharge]" id="msgPhone[recharge]">#UserName#您好，您刚刚成功充值#MONEY#元。</textarea><span
											class="commonToolTip">#MONEY#:充值金额,#UserName#:用户名(recharge)</span></td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="B">
							<div class="h_a">借款者提醒相关</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150">初审通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_check_success]"
												id="msgPhone[phone_borrow_check_success]">#UserName#您好，你的初审已经通过了。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_check_success)</span></td>
									</tr>
									<tr>
										<th width="150">初审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_check_fail]"
												id="msgPhone[phone_borrow_check_fail]">#UserName#您好，你的初审未通过。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_check_fail)</span></td>
									</tr>
									<tr>
										<th width="150">复审通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_recheck_success]"
												id="msgPhone[phone_borrow_recheck_success]">#UserName#您好，你的复审通过。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_recheck_success)</span></td>
									</tr>
									<tr>
										<th width="150">复审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_recheck_fail]"
												id="msgPhone[phone_borrow_recheck_fail]">#UserName#您好，你的复审未通过。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_recheck_fail)</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="C">
							<div class="h_a">投资款者提醒</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150">投标操作：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_money]"
												id="msgPhone[phone_invest_money]">#UserName#您好，你的投标已成功。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名
												4.#INVEST_MONEY#:投标金额(phone_invest_money)</span></td>
									</tr>
									<tr>
										<th width="150">所投标复审通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_recheck_success]"
												id="msgPhone[phone_invest_recheck_success]">#UserName#您好，你的复审已经通过。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名 4.#DEAL_INFO#：审核说明
												5:#INVEST_MONEY#：投标金额(invest_recheck_success)</span></td>
									</tr>
									<tr>
										<th width="150">所投标复审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_recheck_fail]"
												id="msgPhone[phone_invest_recheck_fail]">#UserName#您好，你的复审未通过。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名 4.#DEAL_INFO#：审核说明
												5:#INVEST_MONEY#：投标金额(invest_recheck_fail)</span></td>
									</tr>
									<tr>
										<th width="150">收到还款：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_get_repayment]"
												id="msgPhone[phone_invest_get_repayment]">#UserName#您好，您投的标名 #BORROW_NAME#（标号#BORROW_ID#）#ReceiveMoney# 已还款，请查收。</textarea><span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#：用户名
												4.#ReceiveMoney#：收到的还款金额(invest_get_repayment)</span></td>
									</tr>
								</table>

							</div>
						</div>


						<div class="btn_wrap">
							<div class="btn_wrap_pd">
								<button class="btn btn_submit mr10 J_ajax_submit_btn"
									type="submit">保存</button>
								&nbsp;&nbsp;<a href="javascript:;"
									onclick="window.history.back(-1);return false;">返回</a>
							</div>
						</div>

					</div>
			</fieldset>
		</form>
	</div>

	<script type="text/javascript"
		src="${AdminStatics}/js/ajaxfileupload.js"></script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>

</body>
</html>