<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">序号</th>
					<th>角色名称</th>
					<th>角色描述</th>
					<th>状态</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				 <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="group">

						<tr id="list_${group.group_id}">
						<td align="center">${group.group_id}</td>
							<td align="center">${group.groupname}</td>
							<td>${group.groupinfo}</td>
							
							<td><c:choose>
									<c:when test="${group.status==1}">启用</c:when>
									<c:when test="${group.status==0}">禁用</c:when>
								</c:choose>
                                </td>
							
							<td> <a	href="${dfn:U('admin/group/edit')}?id=${group.group_id}"> 修改 | </a> &nbsp;&nbsp;  <a href="${dfn:U('admin/group/do_delete')}?id=${group.group_id}"	class="J_ajax_del">删除</a> &nbsp;&nbsp;</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>