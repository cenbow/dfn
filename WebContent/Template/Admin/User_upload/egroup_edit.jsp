<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<%
	request.setAttribute("dfForm_style", "width:200px;");
%>
<body class="J_scroll_fixed">

	<div class="jj dialogBox" style="width:500px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user_upload/egroup_edit')}">修改分组类型</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user_upload/editEgroup')}" class="form-horizontal J_ajaxForm">
        <input type="hidden" name="id" value="${data.id }" />
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200">上级： 
						</th>
						<td>${dfForm:select( "parent_id",egroupMap, data['parent_id'], dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>

					<tr>
						<th>名称：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							</td>
					</tr>
					<tr>
						<th>排序：</th>
						<td>${dfForm:input( "sort_order", data['sort_order'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
							
				</table>
			</div>
			<div class="form-actions" style=" text-align: center;">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>