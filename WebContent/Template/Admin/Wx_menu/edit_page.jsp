<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<%
	request.setAttribute("dfForm_style", "width:200px;");
%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
		<li ><a href="${dfn:U('admin/wx_menu/index')}">微信菜单管理</a></li>
		<li class="active"><a href="${dfn:U('admin/wx_menu/add_menu')}">添加菜单</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/wx_menu/editMenu')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th class="control-label">菜单类型：</th>
						<td>${dfForm:select( "type",typeSelect, data['type'], dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>	
					<tr>
						<th width="200" class="control-label">上级菜单： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>
							${dfForm:select( "parentid",parentid_Select, this_id, dfForm_class,  dfForm_style,dfForm_others)}
						</td>
					</tr>

					<tr>
						<th class="control-label">名称：</th>
						<td>${dfForm:input( "name", data['name'], dfForm_class, dfForm_style,dfForm_others)}
							</td>
					</tr>
					<tr>
						<th class="control-label">菜单内容：</th>
						<td>${dfForm:input( "content", data['content'], dfForm_class, dfForm_style,dfForm_others)}
							
						</td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:window.history.back(-1);">返回</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>