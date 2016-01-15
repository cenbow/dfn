<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="dialogBox jj" style="width: 550px">
		<ul class="nav nav-tabs">
			<li class="action"><a href="javascript:;">充值处理</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/recharge/do_edit')}" class="form-horizontal J_ajaxForm"><input type="hidden" name="id" value="${data.id }" />
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">订单号： 
						</th>
						<td>${dfForm:input( "tran_id", "", "", "",dfForm_others)}
							
						</td>
					</tr>
					
					<tr>
						<th width="200" height="40px" class="control-label">是否通过：</th>
						<td>${dfForm:radio( "status",statusSelect, "1", "",  "",dfForm_others)}
						</td>


					</tr>

				</table>
			</div>

			<div class="form-actions"  >
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn"  >处理</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>