<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="/newadmin-cache_borrow_fee-index-menuid-123.shtml">担保标配置</a></li>
			</ul>
	  </div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">借款用途</a></li>
			<li><a href="#B" data-toggle="tab">最低投标金额</a></li>
			<li><a href="#C" data-toggle="tab">最多投标总金额</a></li>
			<li><a href="#D" data-toggle="tab">募集时间</a></li>
			<li><a href="#E" data-toggle="tab">借款期限及利率范围</a></li>
			<li><a href="#F" data-toggle="tab">奖励设置</a></li>
			<li><a href="#G" data-toggle="tab">借款者相关费用</a></li>
			<li><a href="#H" data-toggle="tab">投资者相关费用</a></li>
			<li><a href="#I" data-toggle="tab">投标流程设置</a></li>
		</ul>
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="h_a">借款用途</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">ID</th>
										<th width="500">用途</th>
										<th width="200">操作</th>
									</tr>
									<tr overstyle='on' id="list_yt_1">
										<td>1</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][1]" value="短期周转" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(1);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_2">
										<td>2</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][2]" value="生意周转" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(2);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_3">
										<td>3</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][3]" value="生活周转" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(3);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_4">
										<td>4</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][4]" value="购物消费" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(4);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_5">
										<td>5</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][5]" value="不提现借款" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(5);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_7">
										<td>7</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][7]" value="其它借款" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(7);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_yt_8">
										<td>8</td>
										<td><input type="text" style="width: 200px" class="input"
											name="borrow[borrowUse][8]" value="创业借款" /></td>
										<td><a href="javascript:void(0);" onClick="delyt(8);">删除</a>
										</td>
									</tr>
								</table>
								<button class="btn" style="margin-top: 5px"
									onClick="addone_yu();return false;">添加一个用途</button>
								<script type="text/javascript">
									var yt = parseInt(8) || 0;
									function addone_yu() {
										yt++;
										var htmladd = '<tr overstyle="on" id="list_yt_'+yt+'">';
										htmladd += '<td>' + yt + '</td>';
										htmladd += '<td><input type="text" style="width:200px" class="input" name="borrow[borrowUse]['+yt+']" value="" /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delyt('
												+ yt + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$(".table_form").get(0));
									}
									function delyt(id) {
										if (confirm("删除后不可恢复，如果已经有标选择了这里面的借款用途，建议只是修改不要删除，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_yt_" + id).remove();
									}
								</script>


							</div>
						</div>

						<div class="tab-pane" id="B">
							<div class="h_a">最低投标金额</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">ID</th>
										<th width="300">金额(数值 如:50)</th>
										<th width="300">显示金额(显示给会员看到的 如:50元, 五十元)</th>
										<th width="100">操作</th>
									</tr>
									<tr overstyle='on' id="list_zd_1">
										<td>1</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][1][money]" value="100" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][1][money_text]" value="100元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(1);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_2">
										<td>2</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][2][money]" value="200" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][2][money_text]" value="200元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(2);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_3">
										<td>3</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][3][money]" value="500" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][3][money_text]" value="500元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(3);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_4">
										<td>4</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][4][money]" value="1000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][4][money_text]" value="1000元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(4);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_5">
										<td>5</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][5][money]" value="5000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][5][money_text]" value="5000元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(5);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_6">
										<td>6</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][6][money]" value="10000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][6][money_text]" value="10000元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(6);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_7">
										<td>7</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][7][money]" value="50000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][7][money_text]" value="50000元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(7);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_zd_8">
										<td>8</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][8][money]" value="50" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMin][8][money_text]" value="50元" /></td>
										<td><a href="javascript:void(0);" onClick="delzd(8);">删除</a>
										</td>
									</tr>
								</table>
								<button class="btn" style="margin-top: 5px"
									onClick="addone_zd();return false;">添加一个最低投标金额</button>
								<script type="text/javascript">
									var zd = parseInt(8) || 0;
									function addone_zd() {
										zd++;
										var htmladd = '<tr overstyle="on" id="list_zd_'+zd+'">';
										htmladd += '<td>' + zd + '</td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowMin]['+zd+'][money]" value="0" /></td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowMin]['+zd+'][money_text]" value="0元" /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delzd('
												+ zd + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$(".table_form").get(1));
									}
									function delzd(id) {
										if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_zd_" + id).remove();
									}
								</script>


							</div>
						</div>


						<div class="tab-pane" id="C">
							<div class="h_a">最多投标总金额</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">ID</th>
										<th width="300">金额(数值 如:50 | 0表示无限制)</th>
										<th width="300">显示金额(显示给会员看到的 如:50元, 五十元)</th>
										<th width="100">操作</th>
									</tr>
									<tr overstyle='on' id="list_Max_1">
										<td>1</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][1][money]" value="0" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][1][money_text]" value="无限制" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(1);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_2">
										<td>2</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][2][money]" value="1500" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][2][money_text]" value="1500元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(2);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_3">
										<td>3</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][3][money]" value="2000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][3][money_text]" value="2000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(3);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_4">
										<td>4</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][4][money]" value="3000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][4][money_text]" value="3000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(4);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_5">
										<td>5</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][5][money]" value="5000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][5][money_text]" value="5000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(5);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_6">
										<td>6</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][6][money]" value="10000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][6][money_text]" value="10000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(6);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_7">
										<td>7</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][7][money]" value="20000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][7][money_text]" value="20000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(7);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Max_8">
										<td>8</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][8][money]" value="50000" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowMax][8][money_text]" value="50000元" /></td>
										<td><a href="javascript:void(0);" onClick="delMax(8);">删除</a>
										</td>
									</tr>
								</table>
								<button class="btn" style="margin-top: 5px"
									onClick="addone_Max();return false;">添加一个最多投标总金额</button>
								<script type="text/javascript">
									var Max = parseInt(8) || 0;
									function addone_Max() {
										Max++;
										var htmladd = '<tr overstyle="on" id="list_Max_'+Max+'">';
										htmladd += '<td>' + Max + '</td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowMax]['+Max+'][money]" value="0" /></td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowMax]['+Max+'][money_text]" value="0元" /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delMax('
												+ Max + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$(".table_form").get(2));
									}
									function delMax(id) {
										if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_Max_" + id).remove();
									}
								</script>

							</div>
						</div>

						<div class="tab-pane" id="D">
							<div class="h_a">募集时间</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">ID</th>
										<th width="300">时间(数值以天为单位 如:1)</th>
										<th width="300">显示时间(显示给会员看到的 如:1天, 一天)</th>
										<th width="100">操作</th>
									</tr>
									<tr overstyle='on' id="list_Time_1">
										<td>1</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][1][money]" value="2" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][1][money_text]" value="2天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(1);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_2">
										<td>2</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][2][money]" value="3" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][2][money_text]" value="3天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(2);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_3">
										<td>3</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][3][money]" value="4" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][3][money_text]" value="4天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(3);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_4">
										<td>4</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][4][money]" value="5" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][4][money_text]" value="5天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(4);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_5">
										<td>5</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][5][money]" value="6" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][5][money_text]" value="6天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(5);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_6">
										<td>6</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][6][money]" value="7" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][6][money_text]" value="7天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(6);">删除</a>
										</td>
									</tr>
									<tr overstyle='on' id="list_Time_7">
										<td>7</td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][7][money]" value="1" /></td>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowTime][7][money_text]" value="1天" /></td>
										<td><a href="javascript:void(0);" onClick="delTime(7);">删除</a>
										</td>
									</tr>
								</table>
								<button class="btn" style="margin-top: 5px"
									onClick="addone_Time();return false;">添加一个募集时间</button>
								<script type="text/javascript">
									var Time = parseInt(7) || 0;
									function addone_Time() {
										Time++;

										var htmladd = '<tr overstyle="on" id="list_Max_'+Time+'">';
										htmladd += '<td>' + Time + '</td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowTime]['+Time+'][money]" value="0" /></td>';
										htmladd += '<td><input type="text" style="width:100px" class="input" name="borrow[borrowTime]['+Time+'][money_text]" value="0天" /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delTime('
												+ Time + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$(".table_form").get(3));
									}
									function delTime(id) {
										if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_Time_" + id).remove();
									}
								</script>

							</div>
						</div>
						<div class="tab-pane" id="E">
							<div class="h_a">借款期限及利率范围</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">借款期限（按月）:</th>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowDuration]" value="1|24" /><span
											class="commonToolTip">以1|24的形式填入，以月为单位，表示最小借款时间为1个月，最大24个月</span></td>
									</tr>
									<tr>
										<th width="200">借款期限（天标）:</th>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowDurationDay]" value="1|31" /><span
											class="commonToolTip">以1|24的形式填入，以天为单位，表示按天借款时最少借款时间为1天，最多24天</span></td>
									</tr>
									<tr>
										<th width="200">发标时的年化利率(按月):</th>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowInterest]" value="12|15" /><span
											class="commonToolTip">以10|24的形式填入，表示年化利率最小10%,最大24%(rate_lixi)</span></td>
									</tr>
									<tr>
										<th width="200">发标时的天利率(天标):</th>
										<td><input type="text" style="width: 100px" class="input"
											name="borrow[borrowDayInterest]" value="0.01|0.12" /><span
											class="commonToolTip">以0.01|0.12的形式填入，表示天利率最小0.01%,最大0.12%(borrowDayInterest)</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="F">
							<div class="h_a">奖励设置</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">累计投标奖励设置:</th>
										<td><input type="text" style="width: 600px" class="input"
											name="borrow[TotalInvestReward]" value="2|0.5" /><span
											class="commonToolTip">以1|0.1,2|0.3的形式填入，表示1月标奖励累计投资1月标总金额的0.1%，2月标奖励累计投资2月标总金额的0.3%</span></td>
									</tr>
									<tr>
										<th width="200">回款续投奖励:</th>
										<td><input type="text" style="width: 600px" class="input"
											name="borrow[ContinueInvestReward]" value="" /><span
											class="commonToolTip">以1|0.1,2|0.3的形式填入，表示投1月标的奖励投资金额的0.1%，投2月标奖励投资金额的0.3%</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="G">
							<div class="h_a">借款相关费用</div>
							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">借款者管理费收费方式：</th>
										<td><input type="radio"
											name="borrow[borrowFee][borrowManageType]" value="1"
											id="borrow[borrowFee][borrowManageType]_1"
											onClick="feeType(this);"><label
											for="borrow[borrowFee][borrowManageType]_1">统一资费</label><input
											type="radio" checked="checked"
											name="borrow[borrowFee][borrowManageType]" value="2"
											id="borrow[borrowFee][borrowManageType]_2"
											onClick="feeType(this);"><label
											for="borrow[borrowFee][borrowManageType]_2">按还款方式分别设置</label></select><span
											class="commonToolTip">收费方式(borrowManageType)</span></td>
									</tr>
									<tr class="feeTypeDay">
										<th width="200">借款者管理费(统一资费|按天还款)：</th>
										<td><input style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManageDay]"
											id="borrow[borrowFee][borrowManageDay]"
											value="1-1|2-1.2|3-1.4|4-1.6|5-1.8|6-1.9|7-2.0|8-2.15|9-2.2|10-2.2|11-2.2|12-2.2" /><span
											class="commonToolTip">以1-0.01|2-0.012|3-0.014的形式填入，表示1天标收取0.01%，2天标收取0.012%，3天标收取0.014的管理费用(borrowManageDay)</span></td>
									</tr>
									<tr class="feeTypeSame" style="display: none">
										<th width="200" style="background: #F8FC96">借款者管理费(统一资费)：</th>
										<td style="background: #F8FC96"><input
											style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManage]"
											id="borrow[borrowFee][borrowManage]"
											value="1-1|2-1|3-1|4-1|5-1|6-1|7-10|8-1|9-1|10-1|11-1|12-1|13-1|14-1|15-1|16-1|17-1|18-1" /><span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManage)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" style="background: #F8FC96">按月分期还款(分别设置)：</th>
										<td style="background: #F8FC96"><input
											style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManageMonth]"
											id="borrow[borrowFee][borrowManageMonth]"
											value="1-0.23|2-0.23|3-0.23|4-0.215|5-0.215|6-0.215|7-0.205|8-0.205|9-0.205|10-0.195|11-0.195|12-0.195|13-0.195|14-0.195|15-0.195|16-0.195|17-0.195|18-0.195" /><span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageMonth)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" style="background: #F8FC96">按季分期还款(分别设置)：</th>
										<td style="background: #F8FC96"><input
											style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManageSeason]"
											id="borrow[borrowFee][borrowManageSeason]"
											value="1-1|2-1.2|3-1.4|4-1.6|5-1.8|6-1.9|7-2.0|8-2.15|9-2.2|10-2.2|11-2.2|12-2.2" /><span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageSeason)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" style="background: #F8FC96">每月还息到期还本(分别设置)：</th>
										<td style="background: #F8FC96"><input
											style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManageEndMonth]"
											id="borrow[borrowFee][borrowManageEndMonth]"
											value="1-0.5|2-0.5|3-0.5|4-0.45|5-0.45|6-0.45|7-0.39|8-0.39|9-0.39|10-0.35|11-0.35|12-0.35|13-0.35|14-0.35|15-0.35|16-0.35|17-0.35|18-0.35" /><span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageEndMonth)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" style="background: #F8FC96">一次性还款(分别设置)：</th>
										<td style="background: #F8FC96"><input
											style="width: 400px" type="text" class="input"
											name="borrow[borrowFee][borrowManageOneTime]"
											id="borrow[borrowFee][borrowManageOneTime]" value="" /><span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageOneTime)</span></td>
									</tr>
									<tr>
										<th>借款保证金：</th>
										<td><input type="text" class="input"
											name="borrow[borrowFee][deposit]"
											id="borrow[borrowFee][deposit]" value="10" /><span
											class="commonToolTip">借款者借款成功后冻结的保证金,填10表示借款总金额的10%(deposit)</span></td>
									</tr>
									<tr>
										<th>成功还款积分规则：</th>
										<td><input type="text" class="input"
											name="borrow[borrowFee][creditBorrow]"
											id="borrow[borrowFee][creditBorrow]" value="1|-3|-10|2|100" /><span
											class="commonToolTip">填入1|-3|-10|2|100表示,正常还款|迟还|逾期还款|提前还款|金额比率
												不同状态下还款金额折合金额金额比率后*对应值(creditBorrow)</span></td>
									</tr>
								</table>
							</div>
						</div>

						<script type="text/javascript">
							function feeType(obj) {
								var type = $(obj).val();
								if (type == 2) {
									$(".feeTypeSame").hide();
									$(".feeTypeOther").show();
								} else {
									$(".feeTypeSame").show();
									$(".feeTypeOther").hide();
								}
							}
						</script>

				<div class="tab-pane" id="H">
					<div class="h_a">投资者相关费用</div>
					<div class="table_full">
						<table width="100%" class="table_form">
							<tr>
								<th width="200">投资者利息管理费：</th>
								<td><input type="text" class="input"
									name="borrow[investFee][investManage]"
									id="borrow[investFee][investManage]" value="5|5" /><span
									class="commonToolTip">填入10|5的形式，表示普通会员10%,VIP会员5%的利息管理费(investManage)</span></td>
							</tr>
							<tr>
								<th>投资成功积分规则：</th>
								<td><input type="text" class="input"
									name="borrow[investFee][creditInvestor]"
									id="borrow[investFee][creditInvestor]" value="200" /><span
									class="commonToolTip">整数或者小数，表示比率，比如填入100，会员投资成功300元，则可得到300/100=3分(creditInvestor)</span></td>
							</tr>
						</table>


					</div>
				</div>
				<div class="tab-pane" id="I">
					<div class="h_a">投标流程设置</div>
					<div class="table_full">
						<table width="100%" class="table_form">
							<tr>
								<th width="200">是否必须通过VIP认证：</th>
								<td><input type="radio" name="borrow[condition][vip]"
									value="1" id="borrow[condition][vip]_1"><label
									for="borrow[condition][vip]_1">是</label><input type="radio"
									checked="checked" name="borrow[condition][vip]" value="2"
									id="borrow[condition][vip]_2"><label
									for="borrow[condition][vip]_2">不限制</label></select><span
									class="commonToolTip">选是则必须通过VIP的会员才能发(vip)</span></td>
							</tr>
							<tr>
								<th width="200">是否必须通过手机认证：</th>
								<td><input type="radio" name="borrow[condition][phone]"
									value="1" id="borrow[condition][phone]_1"><label
									for="borrow[condition][phone]_1">是</label><input type="radio"
									checked="checked" name="borrow[condition][phone]" value="2"
									id="borrow[condition][phone]_2"><label
									for="borrow[condition][phone]_2">不限制</label></select><span
									class="commonToolTip">选是则必须通过手机认证的会员才能发(phone)</span></td>
							</tr>
							<tr>
								<th width="200">是否必须通过视频认证：</th>
								<td><input type="radio" name="borrow[condition][video]"
									value="1" id="borrow[condition][video]_1"><label
									for="borrow[condition][video]_1">是</label><input type="radio"
									checked="checked" name="borrow[condition][video]" value="2"
									id="borrow[condition][video]_2"><label
									for="borrow[condition][video]_2">不限制</label></select><span
									class="commonToolTip">选是则必须通过视频认证的会员才能发(video)</span></td>
							</tr>
							<tr>
								<th width="200">是否必须通过现场认证：</th>
								<td><input type="radio" name="borrow[condition][face]"
									value="1" id="borrow[condition][face]_1"><label
									for="borrow[condition][face]_1">是</label><input type="radio"
									checked="checked" name="borrow[condition][face]" value="2"
									id="borrow[condition][face]_2"><label
									for="borrow[condition][face]_2">不限制</label></select><span
									class="commonToolTip">选是则必须通过现场认证的会员才能发(face)</span></td>
							</tr>
							<tr>
								<th width="200">是否必须通过实名认证：</th>
								<td><input type="radio" name="borrow[condition][real]"
									value="1" id="borrow[condition][real]_1"><label
									for="borrow[condition][real]_1">是</label><input type="radio"
									checked="checked" name="borrow[condition][real]" value="2"
									id="borrow[condition][real]_2"><label
									for="borrow[condition][real]_2">不限制</label></select><span
									class="commonToolTip">选是则必须通过实名认证的会员才能发(real)</span></td>
							</tr>
							<tr>
								<th width="200">会员积分限制：</th>
								<td><input type="text" class="input"
									name="borrow[condition][credits]"
									id="borrow[condition][credits]" value="0" /><span
									class="commonToolTip">填0则表示不限制，否则发布者应满足大于等于所填数值的积分(credits)</span></td>
							</tr>
							<tr>
								<th width="200">借款总金额限制：</th>
								<td><input type="text" class="input"
									name="borrow[condition][limitMoney]"
									id="borrow[condition][limitMoney]" value="500|20000000" /><span
									class="commonToolTip">以500|20000000的形式填入，表示会员在满足各种借款条件及额度的情况下，网站对其借款的控制额度在500到20000000之间(limitMoney)</span></td>
							</tr>
						</table>


					</div>
				</div>
	</div>
	<div class="btn_wrap">
		<div class="btn_wrap_pd">
			<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">保存</button>
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
	<script type="text/javascript" src="${AdminStatics}"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>

</body>
</html>