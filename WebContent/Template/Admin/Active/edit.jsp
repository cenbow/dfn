<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj" style="width:500px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/active/edit')}">咨询处理</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/active/edit')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">处理状态： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class, dfForm_style,dfForm_others)}
							</td>
					</tr>

					<tr>
						<th  class="control-label">处理说明：</th>
						<td><textarea name="deal_info">${deal_info}</textarea>
							

						</td>
					</tr>
					
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">处理</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>