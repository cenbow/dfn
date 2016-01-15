<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" style="width:600px">

	<div class="jj dialogBox">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user/credit_edit')}">调整授信</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user/do_credit_edit')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">信用额度： <input type="hidden" name="id"	value="${id}" />
						</th>
						<td>${dfForm:input( "credit_limit", "0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						<span class="commonToolTip">如果是减少额度，请填负数，如'-1000'</span></td>
					</tr>

					<tr>
						<th class="control-label">借款担保额度：</th>
						<td>${dfForm:input( "borrow_vouch_limit", "0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						<span class="commonToolTip">如果是减少额度，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th class="control-label">投资担保额度：</th>
						<td>${dfForm:input( "invest_vouch_limit", "0", dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">如果是减少额度，请填负数，如'-1000'</span></td>
						</td>
					</tr>
					<tr>
						<th class="control-label">变动原因：</th>
						<td>${dfForm:input( "info", "", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">是否修改可用额度：</th>
						<td>${dfForm:select( "relate",isUpdateSelect, "yes", dfForm_class, dfForm_style,dfForm_others)}
						<span class="commonToolTip">选'否'只会修改可用额度,选'是'会修改总额度和可用额度</span></td>
					</tr>				
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">确认修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>