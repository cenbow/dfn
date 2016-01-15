<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>推广员</th>
					<th>推广码</th>
					<th>添加时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.xcode}</td>
							<td>${user.add_time}</td>
							<td><c:if test="${user.status == 1}">可用</c:if><c:if test="${user.status == 0}">无效</c:if></td>
							<td>
								<a href="${dfn:U('admin/Xcode/edit_page')}?id=${user.id}" class="J_dialog" title="修改"> 修改 </a> 
                            </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
