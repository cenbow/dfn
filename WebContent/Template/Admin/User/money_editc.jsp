<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" >

	<div class="jj dialogBox" style="width:600px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user/money_editc')}">调整积分</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user/money_editc')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">积分： <input
							type="hidden" name="id" value="${id}" />
						</th>
						<td>${dfForm:input( "credits","0", dfForm_class, dfForm_style,dfForm_others)}

							<span class="commonToolTip">如果是减少积分，请填负数，如'-1000'</span>
						</td>
					</tr>

					<tr>
						<th class="control-label">变动原因：</th>
						<td>${dfForm:input( "info","", dfForm_class, dfForm_style,dfForm_others)}
						</td>
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