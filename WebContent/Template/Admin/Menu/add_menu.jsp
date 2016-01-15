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
			<li ><a href="${dfn:U('admin/menu/index')}">后台菜单管理</a></li>
		<li class="active"><a  href="${dfn:U('admin/menu/add_menu')}">添加子菜单  </a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/menu/addMenu')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">上级： <input type="hidden" name="id"
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
						<th class="control-label">项目：</th>
						<td>${dfForm:input( "app", data['app'], dfForm_class, dfForm_style,dfForm_others)}
							
						</td>
					</tr>
					<tr>
						<th class="control-label">模块：</th>
						<td>${dfForm:input( "model", data['model'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th class="control-label">方法：</th>
						<td>${dfForm:input( "action", data['action'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th class="control-label">关联方法：</th>
						<td>${dfForm:input( "add_action", data['add_action'], dfForm_class, dfForm_style,dfForm_others)}
						
						</td>
					</tr>
					<tr>
						<th class="control-label">参数：</th>
						<td>${dfForm:input( "data", data['data'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th class="control-label">备注：</th>
						<td><textarea  name="remark">${data['remark'] }</textarea>

						
						</td>
					</tr>
					
					<tr>
						<th class="control-label">状态：</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>	
					<tr>
						<th class="control-label">类型：</th>
						<td>${dfForm:select( "type",typeSelect, data['type'], dfForm_class, dfForm_style,dfForm_others)}
						<span class="commonToolTip"> 注意：“权限认证+菜单”表示加入后台权限管理，纯碎是菜单项请不要选择此项。</span></td>
					</tr>			
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:window.history.back(-1);">返回</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>