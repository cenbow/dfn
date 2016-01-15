<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/borrow_transition_done/index')}">完成的流转标</a></li>
		<li class="active"><a href="${dfn:U('admin/borrow_transition_done/edit')}">修改流转标</a></li>
		</ul>


		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">基本信息</a></li>
			<li><a href="#B" data-toggle="tab">借款方资料</a></li>
			<li><a href="#C" data-toggle="tab">借款方图片资料</a></li>
		
		</ul>

		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/borrow_transition_done/edit')}" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table class="table_form" cellpadding="2" >
								<tbody>
									<tr>
										<th width="200" class="control-label">是否显示： <input
											type="hidden" name="id" value="${data.id }" />
										</th>
										<td>${dfForm:select( "is_show",is_showSelect, data['is_show'], dfForm_class,  dfForm_style,dfForm_others)}
											<span class="commonToolTip">是否在前台显示</span>
										</td>
									</tr>

									<tr>
										<td class="control-label">借款标题：</td>
										<td>${dfForm:input( "borrow_name", data['borrow_name'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<td class="control-label">最小流转单位：</td>
										<td>${dfForm:input( "per_transfer", data['per_transfer'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<td class="control-label">总流转份数：</td>
										<td>${dfForm:input( "transfer_total", data['transfer_total'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<td class="control-label">借款金额：</td>
										<td>${dfForm:input( "borrow_money", data['borrow_money'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<td class="control-label">年化利率：</td>
										<td>${dfForm:input( "borrow_interest_rate", data['borrow_interest_rate'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td class="control-label">每月增加年利率（每月）：</td>
										<td>${dfForm:input( "increase_rate", data['increase_rate'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td class="control-label">网站奖励（每月）：</td>
										<td>${dfForm:input( "reward_rate", data['reward_rate'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td class="control-label">借款期限:</td>
										<td>${dfForm:input( "borrow_duration", data['borrow_duration'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填整数，表示月数,前台显示给会员看，不参与计算可投期限</span></td>
									</tr>
									<tr>
										<td class="control-label">最低认购期限：</td>
										<td>${dfForm:input( "min_month", data['min_month'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">填整数，表示月数</span></td>
									</tr>
									<tr>
										<td class="control-label">流转结束时间：</td>
										<td><input class="input length_2 J_date date"
											style="width: 100px;" autocomplete="off" type="text"
											name="endTime" value="${deadline}" /> <span
											class="commonToolTip">不会在前台显示，此时间只是在会员投标时程序计算会员可投月数</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="B">
							<table class="table_form" cellpadding="2" >
								<tbody>
									<tr>
										<td width="180" class="control-label" >借款人:</td>
										<td><a href="${dfn:U('admin/borrow_transition/showuser')}?id=${user.id}"
								class="J_dialog" title="选择借款人"> 选择借款人 </a> </td> 

									</tr>

									<tr>
										<td class="control-label">借款方商业概述:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57">${borrow_breif}</textarea></td>
									</tr>
									<tr>
										<td class="control-label">借款方资产情况:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57">${borrow_capital}</textarea></td>
									</tr>
									<tr>
										<td class="control-label">借款方资金用途:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57">${borrow_use}</textarea></td>
									</tr>
									<tr>
										<td class="control-label">风险控制措施:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57">${borrow_risk}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="C">
							<table class="table_form" cellpadding="2">
								<tbody>
									<tr>
										<td width="180" class="control-label">借款方图片：</td>
										<td><div class="swfUploadBar clearfix">
												<span id="spanButtonPlaceholder"></span>
												<div id="divFileProgressContainer"></div>
											</div></td>

									</tr>
									<tr>
										<td class="control-label">图片预览：</td>
										<td>
											<div id="thumbnails"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						

						<div class="form-actions">
							<button type="submit"
								class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;"
								onClick="window.history.back(-1);return false;">返回</a>
						</div>
					</div>
				</div>

			</fieldset>
		</form>
	</div>
	
	