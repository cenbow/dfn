<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj" >
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/management/index')}">管理员列表</a></li>
			<li class="active"><a href="${dfn:U('admin/management/user_add')}">添加管理员 </a></li>
		</ul>
		<form method="post" 
			action="${dfn:U('admin/management/addManagement')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">用户名： 
						</th>
						<td>${dfForm:input( "user_name", data['user_name'], dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">请输入用户名</span>
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">密码：</th>
						<td>${dfForm:input( "user_pass", "", dfForm_class, dfForm_style,dfForm_others)}
						
						<span class="commonToolTip">请输入密码(不修改则留空)</span>
						</td>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">确认密码：</th>
						<td>${dfForm:input( "user_pass_re", "", dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">请输入确认密码(不修改则留空)</span>

						</td>
					</tr>
					<tr>
						<th class="control-label">所属地区：</th>
						<td>${dfForm:select( "province",provinceSelect, data['province'], dfForm_class, dfForm_style,dfForm_others)}
						${dfForm:select( "city",citySelect, data['city'], dfForm_class, dfForm_style,dfForm_others)}
						${dfForm:select( "area",areaSelect, data['area'], dfForm_class, dfForm_style,dfForm_others)}
						<span class="commonToolTip">管理员所在地区</span>
					</tr>
					<tr>
						<th class="control-label">联系方式：</th>
						<td>${dfForm:input( "contact", data['contact'], dfForm_class, dfForm_style,dfForm_others)}


							<span class="commonToolTip">如不修改则留空</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">真实姓名：</th>
						<td>${dfForm:input( "real_name", data['real_name'], dfForm_class, dfForm_style,dfForm_others)}
							
						</td>
					</tr>
					<tr>
						<th class="control-label">所属角色：</th>
							<td>${dfForm:select( "u_group_id",roleSelect, data['u_group_id'], dfForm_class, dfForm_style,dfForm_others)}

						</td>
					</tr>
					<tr>
						<th class="control-label">是否客服：</th>
							<td>${dfForm:select( "is_kf",iskfSelect, data['is_kf'], dfForm_class, dfForm_style,dfForm_others)}

							
						</td>
					</tr>
					<tr>
						<th class="control-label">平台ID：</th>
						<td>${dfForm:input( "uid", data['uid'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">推广员才需要填</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">是否禁用：</th>
							<td>${dfForm:select( "is_ban",isBanSelect, data['is_ban'], dfForm_class, dfForm_style,dfForm_others)}

							
						</td>
					</tr>
					<tr>
						<th class="control-label">备注：</th>
						<td><textarea id="info" class="inputtext"
								style="height: 100px; width: 500px;" cols="20" rows="2"
								name="info">${info }</textarea>
							<span class="commonToolTip">客户测试专用</span>
						</td>
					</tr>
				</table>
			</div>

			
			<div class="form-actions" >
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>