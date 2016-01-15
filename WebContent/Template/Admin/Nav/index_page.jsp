<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">排序</th>
					<th>ID</th>
					<th>显示名称</th>
					<th>是否显示</th>
					<th>是否新窗口打开</th>
					<th>链接</th>
					<th>管理操作</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty list.data }">
							<c:forEach items="${list.data }" var="user" >
								<c:set var="thisSortOrder" value="${user.id }#sort#sort_order" />
								<tr id="list_${user.id }">
									<td align="center">
										${dfForm:input( thisSortOrder, user.sort_order, dfForm_class, dfForm_style,dfForm_others)}
									</td>
									<td><a target="_blank">${user.id}</a></td>
									<td>${user.text}</td>
									<td>${user.is_show eq 1?'是':'否'}</td>
									<td>${user.is_open eq 1?'是':'否'}</td>
									<td>${user.url}</td>
				
									<td><a href="${dfn:U('admin/nav/menu_add')}?id=${user.id}"
										class="J_dialog" title="添加子菜单"> 添加子菜单 |</a> &nbsp;&nbsp; <a
										href="${dfn:U('admin/nav/menu_edit')}?id=${user.id}"
										class="J_dialog" title="修改"> 修改 | </a> &nbsp;&nbsp;  <a
										href="${dfn:U('admin/nav/deleteNav')}?id=${user.id}"
										class="J_ajax_del">删除</a> &nbsp;&nbsp;</td>
								</tr>
							</c:forEach>
								</c:if>
			</tbody>
		</table>
	<%-- 	<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div> --%>
		<br/>
	</div>
	

