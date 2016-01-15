<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="${dfn:U('admin/msg_phone/index')}">手机通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">手机信息</a></li>
			<li><a href="#B" data-toggle="tab">借款者提醒相关</a></li>
			<li><a href="#C" data-toggle="tab">投资款者提醒相关</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/msg_phone/editMsg_phone')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150" class="control-label">手机认证：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[verify]" id="msgPhone[verify]">${data['msgPhone']['verify']}</textarea>
												
												 <span
											class="commonToolTip">#CODE#:认证码,#UserName#:用户名(verify)</span>
											
											
												
											</td>
									</tr>
									<tr>
										<th width="150" class="control-label">提现验证：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[withdraw]" id="msgPhone[withdraw]">${data['msgPhone']['withdraw']}</textarea>
												
												<span
											class="commonToolTip">#CODE#:验证码(withdraw)</span>
											
											</td>
									</tr>
									<tr>
										<th width="150" class="control-label">密码找回：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[getPassWord]" id="msgPhone[getPassWord]">${data['msgPhone']['getPassWord']}</textarea>
											 <span
											class="commonToolTip">#CODE#:验证码,#UserName#:用户名(getPassWord)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">充值成功：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[recharge]" id="msgPhone[recharge]">${data['msgPhone']['recharge']}</textarea>
												<span
											class="commonToolTip">#MONEY#:充值金额,#UserName#:用户名(recharge)</span></td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="B">
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150" class="control-label">初审通过：</th>
										<td> <textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_check_success]"
												id="msgPhone[phone_borrow_check_success]">${data['msgPhone']['phone_borrow_check_success']}</textarea>
												 
												<span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_check_success)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">初审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_check_fail]"
												id="msgPhone[phone_borrow_check_fail]">${data['msgPhone']['phone_borrow_check_fail']}</textarea>
												<span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_check_fail)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">复审通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_recheck_success]"
												id="msgPhone[phone_borrow_recheck_success]">${data['msgPhone']['phone_borrow_recheck_success']}</textarea>
												 <span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_recheck_success)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">复审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_borrow_recheck_fail]"
												id="msgPhone[phone_borrow_recheck_fail]">${data['msgPhone']['phone_borrow_recheck_fail']}</textarea>
												 <span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名(borrow_recheck_fail)</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="C">
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="150" class="control-label">投标操作：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_money]"
												id="msgPhone[phone_invest_money]">${data['msgPhone']['phone_invest_money']}</textarea>
												 <span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名
												4.#INVEST_MONEY#:投标金额(phone_invest_money)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">所投标复审通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_recheck_success]"
												id="msgPhone[phone_invest_recheck_success]">${data['msgPhone']['phone_invest_recheck_success']}</textarea>
												<span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名 4.#DEAL_INFO#：审核说明
												5:#INVEST_MONEY#：投标金额(invest_recheck_success)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">所投标复审未通过：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_recheck_fail]"
												id="msgPhone[phone_invest_recheck_fail]">${data['msgPhone']['phone_invest_recheck_fail']}</textarea>
												 <span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#:用户名 4.#DEAL_INFO#：审核说明
												5:#INVEST_MONEY#：投标金额(invest_recheck_fail)</span></td>
									</tr>
									<tr>
										<th width="150" class="control-label">收到还款：</th>
										<td><textarea rows="5" cols="40" class="myarea"
												name="msgPhone[phone_invest_get_repayment]"
												id="msgPhone[phone_invest_get_repayment]">${data['msgPhone']['phone_invest_get_repayment']}</textarea>
												 <span
											class="commonToolTip">1.#BORROW_ID#:标号
												2.#BORROW_NAME#：标名 3.#UserName#：用户名
												4.#ReceiveMoney#：收到的还款金额(invest_get_repayment)</span></td>
									</tr>
								</table>

							</div>
						</div>


						<div class="form-actions">
							<button type="submit"
								class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;"
								onClick="window.history.back(-1);return false;">返回</a>
						</div>

					</div>
			</fieldset>
		</form>
	</div>


	<%@ include file="../Common/footer.jsp"%>