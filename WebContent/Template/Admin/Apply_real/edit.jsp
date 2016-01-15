<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/apply_real/index')}">实名认证申请</a></li>
		<li class="active"><a href="${dfn:U('admin/apply_real/edit')}">审核实名认证 </a></li>
		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">实名认证审核</a></li>			
		</ul>
		<form method="post"   action="${dfn:U('admin/apply_real/addUser')}">
		<div class="common-form cwh">
			<table >
							<tr>
								<th width="200">奖励积分：
									<input type = "hidden" name = "id" value="${data.id }" />
								</th>
								<td>
									${dfForm:input( "user.credits", data['user.credits'], dfForm_class, dfForm_style,dfForm_others)}
									<!-- <input type="text"  name="m_type" > -->
								<!-- <a target="_blank"
									href="user.jsp">egspoon</a> --> <span class="commonToolTip">如不奖励积分则不用填</span></td></td>
							</tr>
							<tr>
								<th width="200" height="40px">是否通过：</th>
								<td>
								${dfForm:select( "is_ban",radiobuttonSelect, data['is_ban'], dfForm_class,  dfForm_style,dfForm_others)}
								</td>
								
							 
							 </tr>
							
							
							</table>
		</div>

		
						<div class="form-actions">
							<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
						</div>

		
		</form>
</div>
<%@ include file="../Common/footer.jsp" %>