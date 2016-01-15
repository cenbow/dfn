<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/agency_list/index')}">代理商列表</a></li>
			<li class="active"><a href="${dfn:U('admin/agency_list/add_menu')}">添加代理商</a></li>

		</ul>
		<form method="post"
			action="${dfn:U('admin/agency_list/addAgency_list')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">用户名： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						<td>${dfForm:input( "user_name", data['user_name'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> --> <span class="commonToolTip">
								请输入用户名</span>
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">密码：</th>
						<td>${dfForm:input( "user_pass", data['user_pass'], dfForm_class, dfForm_style,dfForm_others)}

							<span class="commonToolTip">请输入密码(不修改则留空)</span>
						</td>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">确认密码：</th>
						<td>${dfForm:input( "pwdconfirm", data['pwdconfirm'], dfForm_class, dfForm_style,dfForm_others)}

							<span class="commonToolTip"> 请输入确认密码(不修改则留空)</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">手机：</th>
						<td>${dfForm:input( "user_phone", data['user_phone'], dfForm_class, dfForm_style,dfForm_others)}
					</tr>
					<tr>
						<th class="control-label">邮箱：</th>
						<td>${dfForm:input( "user_email", data['user_email'], dfForm_class, dfForm_style,dfForm_others)}


						</td>
					</tr>
					<tr>
						<th class="control-label">真实姓名：</th>
						<td>${dfForm:input( "real_name", data['real_name'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="password" class="input"
									name="re_user_pass" id="re_user_pass" value="" /> -->
						</td>
					</tr>
					<tr>
						<th class="control-label">身份证号：</th>
						<td>${dfForm:input( "idcard", data['idcard'], dfForm_class, dfForm_style,dfForm_others)}

						</td>
					</tr>
					<tr>
						<th class="control-label">所属角色：</th>
						<td>${dfForm:select( "u_group_id",roleSelect, data['u_group_id'], dfForm_class, dfForm_style,dfForm_others)}

							<%-- ${dfForm:input( "remark", data['remark'], dfForm_class, dfForm_style,dfForm_others)} --%>

						</td>
					</tr>
					<tr>
						<th class="control-label">状态：</th>
						<td>${dfForm:select( "is_ban",isBanSelect, data['is_ban'], dfForm_class, dfForm_style,dfForm_others)}


						</td>
					</tr>
					<tr>
						<th class="control-label">备注：</th>
						<td><textarea name="info" rows="2" cols="20" id="info"
								class="inputtext" ></textarea>


						</td>
					</tr>
				</table>
			</div>


			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>