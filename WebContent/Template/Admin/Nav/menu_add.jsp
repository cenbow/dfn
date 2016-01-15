<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<%
	request.setAttribute("dfForm_style", "width:200px;");
%>
<body class="J_scroll_fixed">
	
	<div class="jj dialogBox" style="width:600px">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">添加导航 </a></li>
			
		
		</ul>
		
		<form method="post"   action="${dfn:U('admin/nav/addNav')}" class="form-horizontal J_ajaxForm">
		<div class="common-form cwh">
			<table>
					<tr>
						<th width="200" class="control-label">上级菜单：
						</th>
						<td>${dfForm:select( "parent_id",parentId_Select,this_id, dfForm_class,  dfForm_style,dfForm_others)}
							</td>
					</tr>

					<tr>
						<th class="control-label">是否新窗口打开：</th>
							<td>${dfForm:select( "is_open",is_OpenSelect, data['is_open'], dfForm_class,  dfForm_style,dfForm_others)}
							</td>
					</tr>
					<tr>
						<th class="control-label">是否显示：</th>
						<td>${dfForm:select( "is_show",is_OpenSelect, data['is_show'], dfForm_class,  dfForm_style,dfForm_others)}
						
						</td>
					</tr>
					<tr>
						<th class="control-label">显示名称：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							

						</td>
					</tr>
					<tr>
						<th class="control-label">链接地址：</th>
						<td>
						<textarea name="url"  >${url }</textarea>
						

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