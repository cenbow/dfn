<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a href="${dfn:U("admin/borrow_type/index")}?type=mortgage">抵押标配置</a></li>
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
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/borrow_type/save')}" method="post">
        	<input type="hidden" name="borrowType" value="${borrowType}">
			<dfTag:token />
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div>借款用途</div>

							<div class="table_list">
								<table id="yt_list" class="table table-hover">									
									<thead>
										<tr>
											<th>ID</th>
											<th >用途</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty data }">
											<c:forEach items="${data['yt']}" var="user"
												varStatus="status">
												<tr align="center" overstyle="on" id="list_yt_${user['value']['key']}">
													<td align="center">${user['value']['key']}<input
														type="hidden" name="yt[${user['value']['key']}][key]"
														value="${user['value']['key']}" /> <c:if
															test="${status.last }">
															<c:set value="${user['value']['key']}" var="yt_id" />
														</c:if>
													</td>
													<td align="center"><input type="text" style="width: 200px"
														class="input"
														name="yt[${user['value']['key']}][borrowUse]"
														value="${user['value'] ['borrowUse']}" /></td>
													<td> <a href="javascript:;"
														onclick="delyt(${user['value']['key']});">删除</a>
														&nbsp;&nbsp; 
													</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
								<input type="hidden" id="yt" value="${yt_id}" />
								<button class="btn" style="margin-top: 5px"
									onClick="addone_yu();return false;">添加一个用途</button>


							</div>
							<script type="text/javascript">
									var yt = $("#yt").val();
									if (yt == undefined)
										yt = 0;
										function addone_yu() {
											yt++;
											var htmladd = '<tr align="center" overstyle="on" id="list_yt_'+yt+'">';
											htmladd += '<td align="center" >'+yt+'<input type="hidden" class="input" style="width:200px" name="yt['+yt+'][key]" value="'+yt+'" /></td>';
											htmladd += '<td ><input type="text" class="input" style="width:200px" name="yt['+yt+'][borrowUse]"  /></td>';
											htmladd += '<td ><a href="javascript:void(0);" onclick="delyt('+ yt + ');">删除</a></td>';
											htmladd += '</tr>';																		
											  $(htmladd).appendTo(																																					
													$("#yt_list"));
										}
										function delyt(id) {
											if (confirm("删除后不可恢复，如果已经有标选择了这里面的借款用途，建议只是修改不要删除，并且删除完要确定保存后才会生效，确定要删除吗?"))
												$("#list_yt_" + id).remove();
										}
									</script>
						</div>

						<div class="tab-pane" id="B">
							<div>最低投标金额</div>

							<div class="table_list">
								<table class="table table-hover" id="zd_list">

									<thead>
										<tr>
											<th>ID</th>
											<th>金额(数值 如:50)</th>
											<th>显示金额(显示给会员看到的 如:50元, 五十元)</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty data }">
											<c:forEach items="${data['zd']}" var="user"
												varStatus="status">
												<tr overstyle="on" id="list_zd_${user['value']['key']}">
													<td align="center">${user['value']['key']}<input
														type="hidden" name="zd[${user['value']['key']}][key]"
														value="${user['value']['key']}" /> <c:if
															test="${status.last }">
															<c:set value="${user['value']['key']}" var="zd_id" />
														</c:if>
													</td>
													<td><input type="text" style="width: 200px"
														class="input" name="zd[${user['value']['key']}][money]"
														value="${user['value'] ['money']}" /></td>
													<td><input type="text" style="width: 200px"
														class="input"
														name="zd[${user['value']['key']}][money_text]"
														value="${user['value'] ['money_text']}" /></td>
													<td> <a href="javascript:;"
														onclick="delzd(${user['value']['key']});">删除</a>
														&nbsp;&nbsp; 
													</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
								<input type="hidden" id="zd" value="${zd_id}" />
								<button class="btn" style="margin-top: 5px"
									onClick="addone_zd();return false;">添加一个最低投标金额</button>
								<script type="text/javascript">
									var zd = $("#zd").val();
									if (zd == undefined)
										zd = 0;
										function addone_zd() {
											zd++;
											var htmladd = '<tr align="center"  overstyle="on" id="list_zd_'+zd+'" >';
											htmladd += '<td align="center" >'+zd+'<input type="hidden" class="input" style="width:200px" name="zd['+zd+'][key]" value="'+zd+'" /></td>';
											htmladd += '<td><input type="text" class="input" style="width:200px" name="zd['+zd+'][money]"  /></td>';
											htmladd += '<td><input type="text" class="input" style="width:200px" name="zd['+zd+'][money_text]"  /></td>';
											htmladd += '<td><a href="javascript:void(0);" onclick="delzd('
													+ zd + ');">删除</a></td>';
											htmladd += '</tr>';
											$(htmladd).appendTo(
													$("#zd_list"));
										}
										function delzd(id) {
											if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
												$("#list_zd_" + id).remove();
										}
									</script>



							</div>
						</div>


						<div class="tab-pane" id="C">
							<div>最多投标总金额</div>

							<div class="table_full">
								<table class="table table-hover" id="Max_list">
									<thead>
										<tr>
											<th>ID</th>
											<th>金额(数值 如:50 | 0表示无限制)</th>
											<th>显示金额(显示给会员看到的 如:50元, 五十元)</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${not empty data }">
											<c:forEach items="${data['Max']}" var="user"
												varStatus="status">
												<tr overstyle="on" id="list_Max_${user['value']['key']}">
													<td align="center">${user['value']['key']}<input
														type="hidden" name="Max[${user['value']['key']}][key]"
														value="${user['value']['key']}" /> <c:if
															test="${status.last }">
															<c:set value="${user['value']['key']}" var="Max_id" />
														</c:if>
													</td>
													<td><input type="text" style="width: 200px"
														class="input" name="Max[${user['value']['key']}][money]"
														value="${user['value'] ['money']}" /></td>
													<td><input type="text" style="width: 200px"
														class="input"
														name="Max[${user['value']['key']}][money_text]"
														value="${user['value'] ['money_text']}" /></td>
													<td> <a href="javascript:;"
														onclick="delMax(${user['value']['key']});">删除</a>
														&nbsp;&nbsp; 
													</td>
												</tr>
											</c:forEach>
										</c:if>



									</tbody>
								</table>
								<input type="hidden" id="Max" value="${Max_id}" />
								<button class="btn" style="margin-top: 5px"
									onClick="addone_Max();return false;">添加一个最多投标总金额</button>
								<script type="text/javascript">
								var Max = $("#Max").val();
								if (Max == undefined)
									Max = 0;
									function addone_Max() {
										Max++;
										var htmladd = '<tr align="center"  overstyle="on" id="list_Max_'+Max+'" >';
										htmladd += '<td align="center" >'+Max+'<input type="hidden" class="input" style="width:200px" name="Max['+Max+'][key]" value="'+Max+'" /></td>';
										htmladd += '<td><input type="text" class="input" style="width:200px" name="Max['+Max+'][money]"  /></td>';
										htmladd += '<td><input type="text" class="input" style="width:200px" name="Max['+Max+'][money_text]"  /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delMax('
												+ Max + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$("#Max_list"));
									}
									function delMax(id) {
										if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_Max_" + id).remove();
									}
								</script>

							</div>
						</div>

						<div class="tab-pane" id="D">
							<div>募集时间</div>

							<div class="table_full">
								<table class="table table-hover" id="time_list">
									<thead>
										<tr>
											<th>ID</th>
											<th>时间(数值以天为单位 如:1)</th>
											<th>显示时间(显示给会员看到的 如:1天, 一天)</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty data }">
											<c:forEach items="${data['Time']}" var="user"
												varStatus="status">
												<tr overstyle="on" id="list_Time_${user['value']['key']}">
													<td align="center">${user['value']['key']}<input
														type="hidden" name="Time[${user['value']['key']}][key]"
														value="${user['value']['key']}" /> <c:if
															test="${status.last }">
															<c:set value="${user['value']['key']}" var="time_id" />
														</c:if>
													</td>
													<td><input type="text" style="width: 200px"
														class="input" name="Time[${user['value']['key']}][money]"
														value="${user['value'] ['money']}" /></td>
													<td><input type="text" style="width: 200px"
														class="input"
														name="Time[${user['value']['key']}][money_text]"
														value="${user['value'] ['money_text']}" /></td>
													<td> <a href="javascript:;"
														onclick="delTime(${user['value']['key']});">删除</a>
														&nbsp;&nbsp; 
													</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
								<input type="hidden" id="Time" value="${time_id}" />
								<button class="btn" style="margin-top: 5px"
									onClick="addone_Time();return false;">添加一个募集时间</button>
								<script type="text/javascript">
								var Time = $("#Time").val();
								if (Time == undefined)
									Time = 0;
									function addone_Time() {
										Time++;

										var htmladd = '<tr align="center"  overstyle="on" id="list_Time_'+Time+'" >';
										htmladd += '<td align="center" >'+Time+'<input type="hidden" class="input" style="width:200px" name="Time['+Time+'][key]" value="'+Time+'" /></td>';
										htmladd += '<td><input type="text" class="input" style="width:200px" name="Time['+Time+'][money]"  /></td>';
										htmladd += '<td><input type="text" class="input" style="width:200px" name="Time['+Time+'][money_text]"  /></td>';
										htmladd += '<td><a href="javascript:void(0);" onclick="delTime('
												+ Time + ');">删除</a></td>';
										htmladd += '</tr>';
										$(htmladd).appendTo(
												$("#time_list"));
									}
									function delTime(id) {
										if (confirm("删除后不可恢复，并且删除完要确定保存后才会生效，确定要删除吗?"))
											$("#list_Time_" + id).remove();
									}
								</script>

							</div>
						</div>
						<div class="tab-pane" id="E">
							<div>借款期限及利率范围</div>

							<div class="table_full">
								<table width="80%" class="table_form">
									<tr>
										<th width="200" class="control-label">借款期限（按月）:</th>
										<td>${dfForm:input( "borrow[borrowDuration]", data['borrow']['borrowDuration'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1|24的形式填入，以月为单位，表示最小借款时间为1个月，最大24个月</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">借款期限（天标）:</th>
										<td>${dfForm:input( "borrow[borrowDurationDay]", data['borrow']['borrowDurationDay'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1|24的形式填入，以天为单位，表示按天借款时最少借款时间为1天，最多24天</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">发标时的年化利率(按月):</th>
										<td>${dfForm:input( "borrow[borrowInterest]", data['borrow']['borrowInterest'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以10|24的形式填入，表示年化利率最小10%,最大24%(rate_lixi)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">发标时的天利率(天标):</th>
										<td>${dfForm:input( "borrow[borrowDayInterest]", data['borrow']['borrowDayInterest'], dfForm_class, dfForm_style,dfForm_others)}<span
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
										<th width="200" class="control-label">累计投标奖励设置:</th>
										<td>${dfForm:input( "borrow[TotalInvestReward]", data['borrow']['TotalInvestReward'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1|0.1,2|0.3的形式填入，表示1月标奖励累计投资1月标总金额的0.1%，2月标奖励累计投资2月标总金额的0.3%</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">回款续投奖励:</th>
										<td>${dfForm:input( "borrow[ContinueInvestReward]", data['borrow']['ContinueInvestReward'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1|0.1,2|0.3的形式填入，表示投1月标的奖励投资金额的0.1%，投2月标奖励投资金额的0.3%</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="G">
							<div>借款相关费用</div>

							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200" class="control-label">借款者管理费收费方式：</th>
										<td><input type="radio"
											name="borrow[borrowFee][borrowManageType]" value="1"
											id="borrow[borrowFee][borrowManageType]_1"
											onClick="feeType(this);"> <label
											for="borrow[borrowFee][borrowManageType]_1" style="display:inline">统一资费</label> <input
											type="radio" checked="checked"
											name="borrow[borrowFee][borrowManageType]" value="2"
											id="borrow[borrowFee][borrowManageType]_2"
											onClick="feeType(this);"> <label
											for="borrow[borrowFee][borrowManageType]_2" style="display:inline">按还款方式分别设置</label>
											</select><span class="commonToolTip">收费方式(borrowManageType)</span></td>
									</tr>




									<tr class="feeTypeDay">
										<th width="200" class="control-label">借款者管理费(统一资费|按天还款)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManageDay]", data['borrow']['borrowFee']['borrowManageDay'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.01|2-0.012|3-0.014的形式填入，表示1天标收取0.01%，2天标收取0.012%，3天标收取0.014的管理费用(borrowManageDay)</span></td>
									</tr>
									<tr class="feeTypeSame" style="display: none">
										<th width="200" class="control-label">借款者管理费(统一资费)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManage]", data['borrow']['borrowFee']['borrowManage'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManage)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" class="control-label">等额本息(分别设置)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManageMonth]", data['borrow']['borrowFee']['borrowManageMonth'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageMonth)</span></td>
									</tr>									<tr class="feeTypeOther">
										<th width="200" class="control-label">等额本金(分别设置)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManageMonthCapital]", data['borrow']['borrowFee']['borrowManageMonthCapital'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageMonthCapital)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" class="control-label">先息后本(分别设置)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManageEndMonth]", data['borrow']['borrowFee']['borrowManageEndMonth'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageEndMonth)</span></td>
									</tr>
									<tr class="feeTypeOther">
										<th width="200" class="control-label">一次性还款(分别设置)：</th>
										<td>${dfForm:input( "borrow[borrowFee][borrowManageOneTime]", data['borrow']['borrowFee']['borrowManageOneTime'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以1-0.1|2-0.12|3-0.14的形式填入，表示1月标收取0.1%，2月标收取0.12%，3月标收取0.14的管理费用(borrowManageOneTime)</span></td>
									</tr>
									<tr>
										<th class="control-label">借款保证金：</th>
										<td>${dfForm:input( "borrow[borrowFee][deposit]", data['borrow']['borrowFee']['deposit'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">借款者借款成功后冻结的保证金,填10表示借款总金额的10%(deposit)</span></td>
									</tr>
									<tr>
										<th class="control-label">成功还款积分规则：</th>
										<td>${dfForm:input( "borrow[borrowFee][creditBorrow]", data['borrow']['borrowFee']['creditBorrow'], dfForm_class, dfForm_style,dfForm_others)}<span
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
							<div>投资者相关费用</div>

							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200">投资者利息管理费：</th>
										<td>${dfForm:input( "borrow[investFee][investManage]", data['borrow']['investFee']['investManage'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填入10|5的形式，表示普通会员10%,VIP会员5%的利息管理费(investManage)</span></td>
									</tr>
									<tr>
										<th>投资成功积分规则：</th>
										<td>${dfForm:input( "borrow[investFee][creditInvestor]", data['borrow']['investFee']['creditInvestor'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">整数或者小数，表示比率，比如填入100，会员投资成功300元，则可得到300/100=3分(creditInvestor)</span></td>
									</tr>
								</table>


							</div>
						</div>
						<div class="tab-pane" id="I">
							<div>投标流程设置</div>

							<div class="table_full">
								<table width="100%" class="table_form">
									<tr>
										<th width="200" class="control-label">是否必须通过VIP认证：</th>
										<td>${dfForm:select( "borrow[condition][vip]",vipSelect, data['borrow']['condition']['vip'], dfForm_class,  dfForm_style,dfForm_others)}<span
											class="commonToolTip">选是则必须通过VIP的会员才能发(vip)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">是否必须通过手机认证：</th>
										<td>${dfForm:select( "borrow[condition][phone]",phoneSelect, data['borrow']['condition']['phone'], dfForm_class,  dfForm_style,dfForm_others)}<span
											class="commonToolTip">选是则必须通过手机认证的会员才能发(phone)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">是否必须通过视频认证：</th>
										<td>${dfForm:select( "borrow[condition][video]",videoSelect, data['borrow']['condition']['video'], dfForm_class,  dfForm_style,dfForm_others)}<span
											class="commonToolTip">选是则必须通过视频认证的会员才能发(video)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">是否必须通过现场认证：</th>
										<td>${dfForm:select( "borrow[condition][face]",faceSelect, data['borrow']['condition']['face'], dfForm_class,  dfForm_style,dfForm_others)}<span
											class="commonToolTip">选是则必须通过现场认证的会员才能发(face)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">是否必须通过实名认证：</th>
										<td>${dfForm:select( "borrow[condition][real]",realSelect, data['borrow']['condition']['real'], dfForm_class,  dfForm_style,dfForm_others)}<span
											class="commonToolTip">选是则必须通过实名认证的会员才能发(real)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">会员积分限制：</th>
										<td>${dfForm:input( "borrow[condition][credits]", data['borrow']['condition']['credits'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填0则表示不限制，否则发布者应满足大于等于所填数值的积分(credits)</span></td>
									</tr>
									<tr>
										<th width="200" class="control-label">借款总金额限制：</th>
										<td>${dfForm:input( "borrow[condition][limitMoney]", data['borrow']['condition']['limitMoney'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">以500|20000000的形式填入，表示会员在满足各种借款条件及额度的情况下，网站对其借款的控制额度在500到20000000之间(limitMoney)</span></td>
									</tr>
								</table>


							</div>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
						&nbsp;&nbsp;<a class="btn" href="javascript:;"
							onClick="window.history.back(-1);return false;">返回</a><b
							class="subtip">所有修改点击一次保存即可</b>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
        <script type="text/javascript">
		$(".nav-tabs li a").click(function(e) {
			$(".tab-pane").removeClass("active").hide();
            var id = $(this).attr("href");
			$(id).addClass("active").show();
        });
		</script>
	<%@ include file="../Common/footer.jsp"%>