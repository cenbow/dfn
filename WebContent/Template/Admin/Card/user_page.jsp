<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>card</th>
					<th>affect_money</th>
					<th>target_id</th>
					<th>到期时间</th>
					<th>IP地址</th>
					<th>添加时间</th>
					<th>使用时间</th>
					<th>使用金额</th>
					 			
				</tr>
			</thead>
			<tbody>
<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
				
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.card}</td>
							<td>${user.affect_money}</td>
							<td>${user.target_id}</td>
							<td>${user.expired_time}</td>
							<td>${user.add_ip}</td>
							<td>${user.add_time}</td>
							<td>${user.use_time}</td>
							<td>${user.use_money}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp" %>