<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">上传资料审核</a></li>

		</ul>
		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/user_upload/editUser_upload')}">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200">是否通过： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "status",radiobuttonSelect, data['status'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>
					<tr>
						<th width="200" height="40px">资料类型：</th>
						<td>${dfForm:input( "type", data['type'], dfForm_class, dfForm_style,dfForm_others)}


						</td>

					</tr>
					<tr>
						<th width="200" height="40px">处理说明：</th>
						<td><textarea class="myarea" name="deal_info" id="deal_info">${deal_info}</textarea>



							<span class="commonToolTip">处理说明</span></td>
					</tr>
					<tr>
						<th>资料详情：</th>
						<td><a href="" target="_blank"> 点击下载 </a></td>

					</tr>

				</table>
			</div>

			<div class="form-actions" >
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>