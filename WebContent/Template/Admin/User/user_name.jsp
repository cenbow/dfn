<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">会员资料</a></li>
			<li><a href="#B" data-toggle="tab">借款投资</a></li>
			<li><a href="#C" data-toggle="tab">帐户资金</a></li>
			<li><a href="#D" data-toggle="tab">投资统计</a></li>
			<li><a href="#E" data-toggle="tab">待还记录</a></li>
			<li><a href="#F" data-toggle="tab">流转标待还记录</a></li>
		</ul>
		<c:set var="user" value="${list.data[0] }" />
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/user/user_name')} method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th width="130" class="control-label">用户名：</th>
									<td width="200" >${user.real_name}</td>
									<th width="130" class="control-label">认证情况：</th>
									<td width="200"><a class="_real_name"
										href="/member-verify.shtml#divtab-2"><img title="实名认证未通过"
											src="http://www.ggmoney.com/statics/common/images/icon/id_0.png" /></a><a
										class="_phone_stauts" href="/member-verify.shtml#divtab-4"><img
											title="手机认证未通过"
											src="http://www.ggmoney.com/statics/common/images/icon/phone_0.png" /></a><a
										class="_email_stauts" href="/member-verify.shtml#divtab-1"><img
											title="邮件认证未通过"
											src="http://www.ggmoney.com/statics/common/images/icon/email_0.png" /></a><a
										class="_vip_stauts" href="/member-vip-index.shtml"><img
											title="不是VIP会员"
											src="http://www.ggmoney.com/statics/common/images/icon/vip_0.png" /></a><a
										class="_video_stauts" href="/member-verify.shtml#divtab-6"><img
											title="未进行视频认证"
											src="http://www.ggmoney.com/statics/common/images/icon/video_0.png" /></a><a
										class="_face_stauts" href="/member-verify.shtml#divtab-5"><img
											title="未进行现场认证"
											src="http://www.ggmoney.com/statics/common/images/icon/place_0.png" /></a></td>
								</tr>
								<tr>
									<th class="control-label">是否冻结：</th>
									<td>${user.is_ban eq '1'?'已冻结':'未冻结'}</td>
									<th class="control-label">客户类型：</th>
									<td>${user.user_type}</td>
								</tr>
								<tr>
									<th class="control-label">所属客服：</th>
									<td width="200">${user.customer_name}</td>
									<th class="control-label">真实姓名：</th>
									<td>${user.real_name}</td>
								</tr>
								<tr>
									<th class="control-label">性别：</th>
									<td>${user.sex}</td>
									<th class="control-label">职业：</th>
									<td>${user.user_type}</td>
								</tr>
								<tr>
									<th class="control-label">邮箱：</th>
									<td>${user.user_email}</td>
									<th>&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th class="control-label">手机号码：</th>
									<td>${user.user_phone}</td>
									<th class="control-label">年龄：</th>
									<td>${user.age}</td>
								</tr>
								<tr>
									<th class="control-label">婚姻状况：</th>
									<td>${user.marry}</td>
									<th class="control-label">学历：</th>
									<td>${user.education}</td>
								</tr>
								<tr>
									<th class="control-label">身份证号：</th>
									<td>${user.idcard}</td>
									<th class="control-label">月收入：</th>
									<td>${user.income}</td>
								</tr>
								<tr>
									<th class="control-label">银行帐号：</th>
									<td>${user.bank_num}</td>
									<th class="control-label">银行名称：</th>
									<td></td>
								</tr>
								<tr>
									<th class="control-label">银行开户行：</th>
									<td colspan="3">${user.bank_province}${user.bank_city}${user.bank_address}</td>
								</tr>
								<tr>
									<th class="control-label">籍贯：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th class="control-label">居住地：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th class="control-label">个人描述：</th>
									<td colspan="3">${user.info}</td>
								</tr>
								<tr>
									<th class="control-label">身份证：</th>
									<td colspan="3">${user.idcard}</td>
								</tr>
								<tr>
									<th class="control-label">身份证照片：</th>
									<td colspan="3">${user.card_img }<a href="" target="_blank"><img src=""
											width="300px" /></a></td>
								</tr>

							</table>

						</div>

						<div class="tab-pane" id="B">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th colspan="4" align="left" class="control-label">已还总额：</th>
								</tr>
								<tr>
									<th width="130" class="control-label">借款总额：</th>
									<td width="200">￥0.00</td>
									<th width="130" class="control-label">负债情况：</th>
									<td width="200">借出大于借入(￥0.00)</td>
								</tr>
								<tr>
									<th class="control-label">已还总额：</th>
									<td>￥0.00</td>
									<th class="control-label">待还总额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">需还本息：</th>
									<td>￥0.00</td>
									<th class="control-label">已还本息：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left" class="control-label">借还款次数统计：</th>
								</tr>
								<tr>
									<th class="control-label">借款成功次数：</th>
									<td>0次</td>
									<th class="control-label">正常还款次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th class="control-label">提前还款次数：</th>
									<td>0次</td>
									<th class="control-label">逾期还款次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th class="control-label">迟还次数：</th>
									<td>0次</td>
									<th class="control-label">网站代还次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th colspan="4" align="left" class="control-label">投资统计</th>
								</tr>
								<tr>
									<th class="control-label">投资总额：</th>
									<td>￥0.00</td>
									<th class="control-label">投标奖励：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">已收总额：</th>
									<td>￥0.00</td>
									<th class="control-label">待收总额：</th>
									<td>￥0.00</td>
								</tr>

							</table>

						</div>


						<div class="tab-pane" id="C">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th colspan="4" align="left" class="control-label">资金情况</th>
								</tr>
								<tr>
									<th width="130" class="control-label">帐户总额：</th>
									<td width="200">￥0.00</td>
									<th width="130" class="control-label">待收金额：</th>
									<td width="200">￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">可用余额：</th>
									<td>￥0.00</td>
									<th class="control-label">冻结金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left" class="control-label">充值提现：</th>
								</tr>
								<tr>
									<th class="control-label">充值成功次数：</th>
									<td>0次</td>
									<th class="control-label">充值成功金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">提现成功次数：</th>
									<td>0次</td>
									<th class="control-label">提现成功金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left" class="control-label">额度情况</th>
								</tr>
								<tr>
									<th class="control-label">借款信用额度：</th>
									<td>￥0.00</td>
									<th class="control-label">可用信用额度：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">借款担保总额：</th>
									<td>￥0.00</td>
									<th class="control-label">可用借款担保额度：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th class="control-label">投资担保总额：</th>
									<td>￥0.00</td>
									<th class="control-label">可用投资担保额度：</th>
									<td>￥0.00</td>
								</tr>


							</table>

						</div>

						<div class="tab-pane" id="D">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tr>
									<th colspan="4" align="left">从 <input type="text"
										id="start_time_invest" name="start_time"
										class="input length_2 J_date" value="" style="width: 80px;">
										到 <input type="text" id="end_time_invest"
										class="input length_2 J_date" name="end_time" value=""
										style="width: 80px;">&nbsp; 借款标种类 <select name="jbzl"
										class="myselect" id="jbzl"><option value="1">信用标</option>
											<option value="8">担保标</option>
											<option value="5">抵押标</option>
											<option value="t">流转标</option></select> 贷款周期 <select name="bdsj"
										class="myselect" id="bdsj"><option value="0">0个月</option></select>
										<input type="submit" class="btn"  a href="javascript:;" onClick="searchIn();" value="搜索">
									</th>
								</tr>
								<tr>
									<th width="130">投资总额：</th>
									<td width="200" id="tzze">￥0.00</td>
									<th width="130">投标奖励：</th>
									<td width="200" id="jl">￥0.00</td>
								</tr>
								<tr>
									<th>已收总额：</th>
									<td id="ysze">￥0.00</td>
									<th>待收总额：</th>
									<td id="dsze">￥0.00</td>
								</tr>

							</table>

						</div>
						<div class="tab-pane" id="E">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<th class="line_l">借款标题</th>
										<th class="line_l">期数</th>
										<th class="line_l">还款本息</th>
										<th class="line_l">实际到期日期</th>
										<th class="line_l">还款状态</th>

									</tr>

								</tbody>
							</table>
							<!--table_full-->

						</div>

						<div class="tab-pane" id="F">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<th class="line_l">借款标题</th>
										<th class="line_l">投资人</th>
										<th class="line_l">真实姓名</th>
										<th class="line_l">还款本金</th>
										<th class="line_l">还款利息</th>
										<th class="line_l">还款总额</th>
										<th class="line_l">实际到期日期</th>
										<th class="line_l">还款状态</th>

									</tr>

								</tbody>
							</table>


						</div>

					</div>
				</div>

			</fieldset>
		</form>
	</div>


	<script type="text/javascript">
		function searchIn() {
			var urlT = "/newadmin-Common-totalInvest";
			var uid = 265;
			var start_time = $("#start_time_invest").val();
			var end_time = $("#end_time_invest").val();
			var jbzl = $("#jbzl").val();
			var bdsj = $("#bdsj").val();
			if (!start_time || !end_time) {
				alert("请选择开始时间和结束时间");
				return false;
			}
			$.ajax({
				url : urlT,
				data : {
					"start_time" : start_time,
					"end_time" : end_time,
					"uid" : uid,
					"jbzl" : jbzl,
					"bdsj" : bdsj
				},
				timeout : 5000,
				cache : false,
				type : "get",
				dataType : "json",
				success : function(d, s, r) {
					if (d) {
						if (d.status == 1) {
							$("#tzze").html(d.tzze);
							$("#dsze").html(d.dsze);
							$("#ysze").html(d.ysze);
							$("#jl").html(d.jl);
						} else {
							alert(d.info);
						}
					}
				}
			});
		}
	</script>

</body>
</html>