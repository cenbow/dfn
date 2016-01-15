<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="jj dialogBox" style="width:600px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user_refer/appoint')}">指定荐人</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user_refer/doappoint')}"	class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200">给会员指定推荐人： <input type="hidden" name="id"	value="${id }" />
						</th>
						<td>${dfForm:input( "recommend_user", data['recommend_user'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						<span class="commonToolTip">输入完整会员名</span></td>
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