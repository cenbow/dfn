<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
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
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th width="130">用户名：</th>
									<td width="200">投资用户9 <a class="levelico"
										href="/member-credit.shtml#divtab-1"><img
											src="http://www.ggmoney.com/statics/common/images/leveico/r5.gif"
											title="E" /></a></td>
									<th width="130">认证情况：</th>
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
									<th>是否冻结：</th>
									<td>未冻结</td>
									<th>客户类型：</th>
									<td></td>
								</tr>
								<tr>
									<th>所属客服：</th>
									<td>未指定</td>
									<th>真实姓名：</th>
									<td></td>
								</tr>
								<tr>
									<th>性别：</th>
									<td></td>
									<th>职业：</th>
									<td></td>
								</tr>
								<tr>
									<th>邮箱：</th>
									<td>2134124@qq.com</td>
									<th>&nbsp;</th>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>手机号码：</th>
									<td>未认证</td>
									<th>年龄：</th>
									<td>0</td>
								</tr>
								<tr>
									<th>婚姻状况：</th>
									<td></td>
									<th>学历：</th>
									<td></td>
								</tr>
								<tr>
									<th>身份证号：</th>
									<td></td>
									<th>月收入：</th>
									<td></td>
								</tr>
								<tr>
									<th>银行帐号：</th>
									<td></td>
									<th>银行名称：</th>
									<td></td>
								</tr>
								<tr>
									<th>银行开户行：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th>籍贯：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th>居住地：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th>个人描述：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th>身份证：</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<th>身份证照片：</th>
									<td colspan="3"><a href="" target="_blank"><img src=""
											width="300px" /></a></td>
								</tr>

							</table>

						</div>

						<div class="tab-pane" id="B">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th colspan="4" align="left">已还总额：</th>
								</tr>
								<tr>
									<th width="130">借款总额：</th>
									<td width="200">￥0.00</td>
									<th width="130">负债情况：</th>
									<td width="200">借出大于借入(￥0.00)</td>
								</tr>
								<tr>
									<th>已还总额：</th>
									<td>￥0.00</td>
									<th>待还总额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th>需还本息：</th>
									<td>￥0.00</td>
									<th>已还本息：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left">借还款次数统计：</th>
								</tr>
								<tr>
									<th>借款成功次数：</th>
									<td>0次</td>
									<th>正常还款次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th>提前还款次数：</th>
									<td>0次</td>
									<th>逾期还款次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th>迟还次数：</th>
									<td>0次</td>
									<th>网站代还次数：</th>
									<td>0次</td>
								</tr>
								<tr>
									<th colspan="4" align="left">投资统计</th>
								</tr>
								<tr>
									<th>投资总额：</th>
									<td>￥0.00</td>
									<th>投标奖励：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th>已收总额：</th>
									<td>￥0.00</td>
									<th>待收总额：</th>
									<td>￥0.00</td>
								</tr>

							</table>

						</div>


						<div class="tab-pane" id="C">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tr>
									<th colspan="4" align="left">资金情况</th>
								</tr>
								<tr>
									<th width="130">帐户总额：</th>
									<td width="200">￥0.00</td>
									<th width="130">待收金额：</th>
									<td width="200">￥0.00</td>
								</tr>
								<tr>
									<th>可用余额：</th>
									<td>￥0.00</td>
									<th>冻结金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left">充值提现：</th>
								</tr>
								<tr>
									<th>充值成功次数：</th>
									<td>0次</td>
									<th>充值成功金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th>提现成功次数：</th>
									<td>0次</td>
									<th>提现成功金额：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th colspan="4" align="left">额度情况</th>
								</tr>
								<tr>
									<th>借款信用额度：</th>
									<td>￥0.00</td>
									<th>可用信用额度：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th>借款担保总额：</th>
									<td>￥0.00</td>
									<th>可用借款担保额度：</th>
									<td>￥0.00</td>
								</tr>
								<tr>
									<th>投资担保总额：</th>
									<td>￥0.00</td>
									<th>可用投资担保额度：</th>
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
										<a href="javascript:;" onClick="searchIn();">搜索</a>
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


	<script>
		$(function() {
			//水印位置
			$('#J_locate_list > li > a').click(
					function(e) {
						e.preventDefault();
						var $this = $(this);
						$this.parents('li').addClass('current').siblings(
								'.current').removeClass('current');
						$('#J_locate_input').val($this.data('value'));
					});
		});
	</script>

	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>


	<script type="text/javascript" src="${AdminStatics}/js/common.js"></script>
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