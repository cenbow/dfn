<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="jj dialogBox" style="width: 600px; height:150px;">
		 
		<form method="post" action="${dfn:U('admin/Xcode/do_edit')}" class="form-horizontal J_ajaxForm">
            <input type="hidden" name="id" 	value="${data.id}" />
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" height="40px" class="control-label">是否有效：</th>
						<td>${dfForm:select( "status",statusSelect, data['status'], dfForm_class,  dfForm_style,dfForm_others)}
						
						<span class="commonToolTip">标记为无效以后就不能正常推荐</span>
						</td>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">推广码：</th>
						<td>${dfForm:input( "xcode", data['xcode'], dfForm_class, dfForm_style,dfForm_others)}
						
						<span class="commonToolTip"></span>
						</td>

					</tr>
					 
				</table>
			</div>

			 
			<div class="form-actions" >
				<button type="submit"	class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>