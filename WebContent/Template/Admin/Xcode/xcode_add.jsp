<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		 
		<form method="post" action="${dfn:U('admin/Xcode/add_xcode')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>


					<tr>
						<th width="200" class="control-label">推广码：   </th>
						<td>${dfForm:input( "xcode", "", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>

					<tr>
						<th width="200" class="control-label">推广员ID：   </th>
						<td>${dfForm:input( "ukey", "", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>
					 
                     
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="f" href="javascript:;" onClick="window.history.back(-1);">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>