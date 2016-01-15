<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/group/index')}">管理员角色</a></li>
			<li><a href="${dfn:U('admin/group/add_menu')}">添加角色 </a></li>
			<li class="active"><a href="${dfn:U('admin/group/edit_menu')}">修改管理员角色
			</a></li>

		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">基本属性</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/group/addGroup')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>


					<tr>
						<th width="200" class="control-label">角色名： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						<td>${dfForm:input( "groupname", data['groupname'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> --> <span class="commonToolTip">请输入角色名</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">角色描述：</th>
						<td><textarea id="groupinfo" class="myarea" name="groupinfo"
								cols="40" rows="5">${groupinfo }</textarea> <span
							class="commonToolTip">请输入角色描述</span></td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">角色状态：</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class,  dfForm_style,dfForm_others)}

							<span class="commonToolTip">请选择角色状态,禁用某角色后则其角色下所有管理员都禁用</span>
						</td>

					</tr>

				</table>
			</div>


			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>