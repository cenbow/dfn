<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/nav/user_add')}">添加导航</a></li>
		
		</ul>
		
		<form method="post"   action="${dfn:U('admin/nav/addNav')}">
		<div class="common-form cwh">
			<table>
					<tr>
						<th width="200">上级菜单： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "parent_id",parent_idSelect, data['parent_id'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						<span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>

					<tr>
						<th>是否新窗口打开：</th>
							<td>${dfForm:select( "is_open",is_openSelect, data['is_open'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						<span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th>是否显示：</th>
						<td>${dfForm:select( "is_show",is_showSelect, data['is_show'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<tr>
						<th>显示名称：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th>链接地址：</th>
						<td>${dfForm:input( "url", data['url'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> -->

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