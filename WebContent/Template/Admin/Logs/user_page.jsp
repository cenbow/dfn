<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户ID</th>
					<th>状态</th>
					<th>说明</th>
					<th>时间</th>
					<th>IP</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty List.data }">
					<c:forEach items="${List.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.uid}</td>
							
							<td>${user.status eq 1?"成功":"失败"}</td>
							<td>${user.info}</td>
							<td>${user.time}</td>
							<td>${user.ip}</td>
						
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${List.pageBar}</div>
	</div>
