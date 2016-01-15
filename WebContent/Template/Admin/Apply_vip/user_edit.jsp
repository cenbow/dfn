<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" style="width: 600px">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">VIP申请</a></li>

		</ul>
		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/apply_vip/editApply_vip')}">
			<div class="common-form cwh">
				<table>

					<tr>
						<th width="200" height="40px">是否通过：</th>
						<td>${dfForm:select( "apply_status",statusSelect, data['apply_status'], dfForm_class,  dfForm_style,dfForm_others)}
						</td>
						
					</tr>

					<tr>
						<th>奖励积分：</th>
						<td>${dfForm:input( "credits", data['credits'], dfForm_class, dfForm_style,dfForm_others)}


							<span class="commonToolTip">如不奖励积分则不用填</span>
						</td>
					</tr>
					<tr>
						<th>审核说明：</th>
						<td>${dfForm:input( "deal_info", data['deal_info'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="password" class="input"
									name="re_user_pass" id="re_user_pass" value="" /> -->
						</td>
					</tr>

				</table>
				<div  class="form-actions" style = "text-align:center;">
									<button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
									&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
					</div>
			</div>
		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>