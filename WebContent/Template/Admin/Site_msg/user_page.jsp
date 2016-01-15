<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>信息标题</th>
					<th>发送时间</th>
					<th>是否已读</th>
					<th>读取时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
				
						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.title}</td>
							<td>${user.send_time}</td>
							<td>
								<c:choose>
									<c:when test="${user.has_read=='1'}">已读取</c:when>
									<c:when test="${user.has_read=='0'}">未读取</c:when>
								</c:choose></td>
							<td>${(user.has_read == '1970-01-01 08:00:00')?'未读取':user.read_time}</td>						
							<td><a href="${dfn:SU(_thisUrl_,'delete')}?id=${user.id}" class="J_ajax_del">删除</a> &nbsp;&nbsp;  </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>