<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<div class="table_list">
	<table class="table table-hover">
		<thead>
			<tr>
				<th align="center">ID</th>
				<th>用户名</th>

				<th>所属客服</th>
				<th>申请类型</th>
				<th>原有额度</th>
				<th>申请额度</th>
				<th>审批额度</th>
				<th>申请时间</th>
				<th>审核说明</th>
				<th>处理人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%-- <c:if test="${not empty list.data }">
				<c:forEach items="${list.data }" var="user">
 --%>
					<tr>
						<td align="center">${user.id}</td>
						<td><a href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>

						<td>${user.customer_name}</td>
						<td>${user.apply_type}</td>
						<td>${user.old_limit}</td>
						<td>${user.apply_money}</td>
						<td>${user.credit_money}</td>
						<td>${user.add_time}</td>
						<td>${user.deal_info }</td>
						<td>${user.deal_user }</td>
						<td><a
							href="${dfn:U('admin/apply_limit/user_edit')}?id=${user.id}"
							class="J_dialog" title="贷款额度审核">审核 </a></td>
					</tr>
				<%-- </c:forEach>
			</c:if> --%>
		</tbody>
	</table>
	<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
</div>
<%@ include file="../Common/footer.jsp"%>