<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="/newadmin-cache_borrow_fee-index-menuid-123.shtml">费用设置</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">借款相关费用</a></li>
			<li><a href="#B" data-toggle="tab">投资相关费用</a></li>
			<li><a href="#C" data-toggle="tab">认证相关费用</a></li>
			<li><a href="#D" data-toggle="tab">充值提现相关</a></li>
			<li><a href="#E" data-toggle="tab">推广奖励</a></li>
		</ul>
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="h_a">借款相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px">催收费：</th>
										<td><input type="text" class="input"
											name="borrowFee[borrow][call]" id="borrowFee[borrow][call]"
											value="30|2" /><span class="commonToolTip">逾期以后的催收费,(30|2)表示逾期30天以后开始算每天千分之2的催收费(call)</span></td>
									</tr>
									<tr>
										<th>逾期罚息：</th>
										<td><input type="text" class="input"
											name="borrowFee[borrow][expired]"
											id="borrowFee[borrow][expired]" value="3|8" /><span
											class="commonToolTip">逾期后罚息的计算,(3|8)表示逾期3天开始算罚息,每天千分之8(expired)</span></td>
									</tr>
									<tr>
										<th>债权转让费：</th>
										<td><input type="text" class="input"
											name="borrowFee[borrow][transfer]"
											id="borrowFee[borrow][transfer]" value="1|0.5" /><span
											class="commonToolTip">会员申请债权转让时网站收取的服务费，以1|0.5的方式填入，表示持有3个月以内的转让收取千分之3的转让费，3个月以上的收取千分之0.5的转让费(transfer)</span></td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="B">
							<div class="h_a">投资相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px">资金空置利率：</th>
										<td><input type="text" class="input"
											name="borrowFee[invest][moneyRate]"
											id="borrowFee[invest][moneyRate]" value="" /><span
											class="commonToolTip">填整数，如1表示
												1/10000,填0表示不启用(moneyRate)</span></td>
									</tr>
									<tr>
										<th>回款投标自动奖励：</th>
										<td><input type="text" class="input"
											name="borrowFee[invest][todayReward]"
											id="borrowFee[invest][todayReward]" value="" /><span
											class="commonToolTip">以10的形式填入，表示奖励可奖励总金额的千分之10，如果投标金额大于当天收到的还款金额，则以收到的还款金额为准，反之类似(todayReward)</span></td>
									</tr>
									<tr>
										<th>投标金额排名奖励：</th>
										<td><input type="text" class="input"
											name="borrowFee[invest][rewardInvest]"
											id="borrowFee[invest][rewardInvest]" value="" /><span
											class="commonToolTip">以50000|1|100|80|N的形式填入，50000表示最低参与奖励金额，1表示开启奖励，0表示关闭,后面的
												100|80|N 表示1到N名的奖励金额(rewardInvest)</span></td>
									</tr>
								</table>

							</div>
						</div>


						<div class="tab-pane" id="C">
							<div class="h_a">认证相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">VIP费用：</th>
										<td><input type="text" class="input"
											name="borrowFee[apply][vip]" id="borrowFee[apply][vip]"
											value="" /><span class="commonToolTip">设置为0表示不收费(vip)</span></td>
									</tr>
									<tr>
										<th width="200">视频认证费用：</th>
										<td><input type="text" class="input"
											name="borrowFee[apply][video]" id="borrowFee[apply][video]"
											value="" /><span class="commonToolTip">设置为0表示不收费(video)</span></td>
									</tr>
									<tr>
										<th>现场认证费用：</th>
										<td><input type="text" class="input"
											name="borrowFee[apply][face]" id="borrowFee[apply][face]"
											value="" /><span class="commonToolTip">设置为0表示不收费(face)</span></td>
									</tr>
									<tr>
										<th>VIP默认额度：</th>
										<td><input type="text" class="input"
											name="borrowFee[apply][limitVip]"
											id="borrowFee[apply][limitVip]" value="" /><span
											class="commonToolTip">当会员通过VIP认证时给予的默认信用额度(limitVip)</span></td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="D">
							<div class="h_a">提现费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">未投标金额提现：</th>
										<td><input type="text" class="input"
											name="borrowFee[withdraw][fee]" id="borrowFee[withdraw][fee]"
											value="1" /><span class="commonToolTip">未投标金额提现手续费，填1表示收取提现金额的1%(fee)</span></td>
									</tr>
									<tr>
										<th colspan="2" style="padding: 0; margin: 0"><div
												class="h_a">充值相关</div></th>
									</tr>
									<tr>
										<th width="200">线下充值奖励：</th>
										<td><input type="text" class="input"
											name="borrowFee[recharge][offReward]"
											id="borrowFee[recharge][offReward]" value="-10" /><span
											class="commonToolTip">填入10表示奖励线下充值金额的
												千分之10，在充值审核的时候会自动奖励到会员帐户(offReward)</span></td>
									</tr>
								</table>

							</div>
						</div>
						<div class="tab-pane" id="E">
							<div class="h_a">推广奖励</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">被推荐人升级VIP奖励：</th>
										<td><input type="text" class="input"
											name="borrowFee[promote][vip]" id="borrowFee[promote][vip]"
											value="10" /><span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的固定金额</span></td>
									</tr>

									<tr>
										<th width="100">信用标：</th>
										<td><input type="text" class="input"
											name="borrowFee[promote][1]" id="borrowFee[promote][1]"
											value="2" /><span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>
									<tr>
										<th width="100">担保标：</th>
										<td><input type="text" class="input"
											name="borrowFee[promote][8]" id="borrowFee[promote][8]"
											value="" /><span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>
									<tr>
										<th width="100">抵押标：</th>
										<td><input type="text" class="input"
											name="borrowFee[promote][5]" id="borrowFee[promote][5]"
											value="6" /><span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>

									<tr>
										<th>推荐奖励时效：</th>
										<td><input type="text" class="input"
											name="borrowFee[promote][duration]"
											id="borrowFee[promote][duration]" value="12" /><span
											class="commonToolTip">能享受被推荐人带来收益的时间限制，单位月</span></td>
									</tr>
									<tr>
										<th>奖励金额基础：</th>
										<td><select name="borrowFee[promote][money_type]"
											class="myselect" id="borrowFee[promote][money_type]"><option
													selected="selected" value="1">本金</option>
												<option value="2">利息</option>
												<option value="3">本金+利息</option></select></td>
									</tr>
								</table>

							</div>
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

</body>
</html>