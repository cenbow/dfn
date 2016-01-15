<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="jj dialogBox" style="width:600px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user_refer/editreward')}">指定荐人</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user_refer/editreward')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">被推荐人升级VIP奖励： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:input( "promote[vip]", data['promote[vip]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的固定金额</span></td>
					</tr>

					<tr>
						<th class="control-label">信用标：</th>
						<td>${dfForm:input( "promote[1]", data['promote[1]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						<span class="commonToolTip">设置为0表示不奖励,大于0表示奖励相应的投资金额的百分比，如0.1表示奖励0.1%</span></td>
					</tr>
					<tr>
						<th class="control-label">担保标：</th>
						<td>${dfForm:input( "promote[2]", data['promote[2]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<%-- <tr>
						<th class="control-label">秒还标：</th>
						<td>${dfForm:input( "promote[3]", data['promote[3]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">净值标：</th>
						<td>${dfForm:input( "promote[4]", data['promote[4]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						<span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr> --%>
					<tr>
						<th class="control-label">抵押标：</th>
						<td>${dfForm:input( "promote[5]", data['promote[5]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<%-- <tr>
						<th class="control-label">流转标：</th>
						<td>${dfForm:input( "promote[6]", data['promote[6]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr> --%>
					<tr>
						<th class="control-label">奖励金额基础：</th>
						<td>${dfForm:select( "money_type",moneySelect, data['money_type'], dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>
					 <tr>
						<th class="control-label">推荐奖励时效：</th>
						<td>${dfForm:input( "promote[duration]", data['promote[duration]'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr> 
					<tr>
						<th class="control-label">是否开启：</th>
						<td>${dfForm:select( "promote[status]",statusSelect, data['promote[status]'], dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>					
				</table>
			</div>
			<div class="form-actions" style=" text-align: center;">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">确认修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>