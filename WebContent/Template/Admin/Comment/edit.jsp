<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/comment/index')}">留言管理</a></li>
		<li class="active"><a href="${dfn:U('admin/comment/edit')}">留言审核 </a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/comment/edit')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">是否通过： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>

					<tr>
						<th class="control-label">用户名：</th>
						<td>${dfForm:input( "uname", data['uname'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">借款标题：</th>
						<td>${dfForm:input( "name", data['name'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">评论内容：</th>
						<td><textarea name="comment" rows="5" cols="57">${data['comment']}</textarea></td>

					</tr>
								
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>