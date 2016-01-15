<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<%
	request.setAttribute("dfForm_style", "width:200px;");
%>
<body class="J_scroll_fixed">
	<div class="jj dialogBox" style="width:600px">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">修改导般</a></li>
			
		</ul>
		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/nav/editNav')}">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200">上级菜单： <input type="hidden" name="id"	value="${data.id }" />
						</th>
						<td>${dfForm:select( "parent_id",parentId_Select, data['parent_id'], dfForm_class,  dfForm_style,dfForm_others)}
							</td>
					</tr>

					<tr>
						<th>是否新窗口打开：</th>
							<td>${dfForm:select( "is_open",is_OpenSelect, data['is_open'], dfForm_class,  dfForm_style,dfForm_others)}
							</td>
					</tr>
					<tr>
						<th>是否显示：</th>
						<td>${dfForm:select( "is_show",is_OpenSelect, data['is_show'], dfForm_class,  dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th>显示名称：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th>链接地址：</th>
						<td><textarea name="url"  >${data.url }</textarea>
							

						</td>
					</tr>					
				</table>
			</div>

			
			<div class="form-actions" style="width: '100%'; text-align: center;">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>