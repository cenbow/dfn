<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	<div class="jj dialogBox" style="width: 550px">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">实名认证审核</a></li>
			
		</ul>
		<form method="post"  class="J_ajaxForm"  action="${dfn:U('admin/apply_real/do_edit')}"><input type = "hidden" name = "uid" value="${uid }" />
		<div class="common-form cwh">
						<table >
							<tr>
								<th width="200">奖励积分：
									
								</th>
								<td>
									${dfForm:input( "user.credits", data['user.credits'], dfForm_class, dfForm_style,dfForm_others)}
									<!-- <input type="text"  name="m_type" > -->
								<!-- <a target="_blank"
									href="user.jsp">egspoon</a> --><span class="commonToolTip">如不奖励积分则不用填</span></td>
							</tr>
							<tr>
								<th width="200" height="40px">是否通过：</th>
								<td>
								${dfForm:select( "id_status",statusSelect, data['id_status'], dfForm_class,  dfForm_style,dfForm_others)}
								</td>
								
							 
							 </tr>
							
							
							</table>
		</div>

		
					<div  class="form-actions" style = "text-align:center;">
									<button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
									&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
					</div>
				
						
</form>


	</div>
<%@ include file="../Common/footer.jsp" %>