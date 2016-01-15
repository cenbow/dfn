<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="${dfn:U('admin/cache_borrow/index')}">第三方登陆配置</a></li>
		</ul>
	</div>

	<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">借款相关费用</a></li>
			<li><a href="#B" data-toggle="tab">投资相关费用</a></li>
			<li><a href="#C" data-toggle="tab">认证相关费用</a></li>
			<li><a href="#D" data-toggle="tab">充值提现相关</a></li>
			<li><a href="#E" data-toggle="tab">推广奖励</a></li>
			<li><a href="#F" data-toggle="tab">其他费用</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"	action="${dfn:U('admin/cache_borrow/editCache_borrow')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div >借款相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px" class="control-label">催收费：</th>
											<td>${dfForm:input( "borrow[call]", data['borrow']['call'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">逾期以后的催收费,(30|2)表示逾期30天以后开始算每天千分之2的催收费(call)</span></td>
									</tr>
									<tr>
										<th class="control-label">逾期罚息：</th>
										<td>${dfForm:input( "borrow[expired]", data['borrow']['expired'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">逾期后罚息的计算,(3|8)表示逾期3天开始算罚息,每天千分之8(expired)</span></td>
									</tr>
									<tr>
										<th class="control-label">债权转让费：</th>
										<td>${dfForm:input( "borrow[transfer_back]", data['borrow']['transfer_back'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">会员申请债权转让时网站收取的服务费，以1|0.5的方式填入，表示持有3个月以内的转让收取千分之3的转让费，3个月以上的收取千分之0.5的转让费(transfer)</span></td>
									</tr>
								</table>

							</div>
						</div>

						 <div class="tab-pane" id="B">
							<div >投资相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px" class="control-label">资金空置利率：</th>
										<td>${dfForm:input( "invest[moneyRate]", data['invest']['moneyRate'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填整数，如1表示
												1/10000,填0表示不启用(moneyRate)</span></td>
									</tr>
									<tr>
										<th class="control-label">回款投标自动奖励：</th>
										<td>${dfForm:input( "invest[todayReward]", data['invest']['todayReward'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以10的形式填入，表示奖励可奖励总金额的千分之10，如果投标金额大于当天收到的还款金额，则以收到的还款金额为准，反之类似(todayReward)</span></td>
									</tr>
									<tr>
										<th class="control-label">投标金额排名奖励：</th>
										<td>${dfForm:input( "invest[rewardInvest]", data['invest']['rewardInvest'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以50000|1|100|80|N的形式填入，50000表示最低参与奖励金额，1表示开启奖励，0表示关闭,后面的
												100|80|N 表示1到N名的奖励金额(rewardInvest)</span></td>
									</tr>
								</table>

							</div>
						</div>


						<div class="tab-pane" id="C">
							<div >认证相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">VIP费用：</th>
										<td>${dfForm:input( "apply[vip]", data['apply']['vip'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不收费(vip)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">视频认证费用：</th>
										<td>${dfForm:input( "apply[video]", data['apply']['video'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不收费(video)</span></td>
									</tr>
									<tr>
										<th class="control-label">现场认证费用：</th>
										<td>${dfForm:input( "apply[face]", data['apply']['face'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不收费(face)</span></td>
									</tr>
									<tr>
										<th class="control-label">VIP默认额度：</th>
										<td>${dfForm:input( "apply[limitVip]", data['apply']['limitVip'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">当会员通过VIP认证时给予的默认信用额度(limitVip)</span></td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="D">
							<div >提现费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">未投标金额提现：</th>
										<td>${dfForm:input( "withdraw[type]",data['withdraw']['type'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">未投标金额提现手续费，填1表示收取提现金额的1%(fee)</span></td>
									</tr>
									<tr>
										<th colspan="2" style="padding: 0; margin: 0"><div
												>充值相关</div></th>
									</tr>
									<tr>
										<th width="200" class="control-label">线下充值奖励：</th>
										<td>${dfForm:input( "withdraw[fee]", data['withdraw']['fee'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填入10表示奖励线下充值金额的
												千分之10，在充值审核的时候会自动奖励到会员帐户(offReward)</span></td>
									</tr>
								</table>

							</div>
						</div>
						<div class="tab-pane" id="E">
							<div >推广奖励</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">被推荐人升级VIP奖励：</th>
										<td>${dfForm:input( "promote[vip]", data['promote']['vip'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的固定金额</span></td>
									</tr>

									<tr>
										<th width="100" class="control-label">信用标：</th>
										<td>${dfForm:input( "promote[x]",  data['promote']['x'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>
									<tr>
										<th width="100" class="control-label">担保标：</th>
										<td>${dfForm:input( "promote[j]",  data['promote']['j'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>
									<tr>
										<th width="100" class="control-label">抵押标：</th>
										<td>${dfForm:input( "promote[d]",  data['promote']['d'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
									</tr>

									<tr>
										<th class="control-label">推荐奖励时效：</th>
										<td>${dfForm:input( "promote[b]",  data['promote']['b'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">能享受被推荐人带来收益的时间限制，单位月</span></td>
									</tr>
									<tr>
										<th class="control-label">奖励金额基础：</th>
										<td>${dfForm:select( "promote[money_type]",money_typeSelect,  data['promote']['money_type'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane" id="F">
							<div >其他费用</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">债权转让费：</th>
										<td>${dfForm:input( "other[borrow_transfer]", data['other']['borrow_transfer'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">填1表示收费转让本金的千分之1</span></td>
									</tr>
								</table>

							</div>
						</div>


					</div>
	
	
			</div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
			</form>
			
	<%@ include file="../Common/footer.jsp"%>