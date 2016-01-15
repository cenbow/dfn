<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="dialogBox jj" style="width: 550px">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">提现处理</a></li>
		</ul>
		<form method="post" class="form-horizontal J_ajaxForm"	action="${dfn:U('admin/withdraw/do_edit')}"><input type="hidden" name="id" value="${data.id }" />
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">提现金额： 
						</th>
						<td>${data['withdraw_money']+data['withdraw_fee']}
						</td>
					</tr>
					<c:if test="${data.withdraw_status eq  0}">
					<tr>
						<th width="200" height="40px" class="control-label">手续费：</th>
						<td>${dfForm:input( "withdraw_fee", data['withdraw_fee']+data['adjust_fee'], dfForm_class,  dfForm_style,dfForm_others)}
						</td>
					</c:if>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">是否通过：</th>
						<td>${dfForm:radio( "withdraw_status",statusSelect, data['withdraw_status'], "",  "",dfForm_others)}
						</td>


					</tr>

				</table>
			</div>

			<div class="form-actions" >
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">处理</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>