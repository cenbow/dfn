<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>借款人</th>
					<th>标题</th>
					<th>借款金额</th>
					<th>借款标种类</th>
					<th>已还金额</th>
					<th>还款方式</th>
					<th>借款期限</th>
					<th>借款手续费</th>
					<th>支付总利息</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.borrow_name}</td>
							<td>${user.borrow_money}</td>
							<td>${dfForm:fetch(user.borrow_type, borrow_typeMap)}</td>
							<td>${user.repayment_money}</td>
							<td>${dfForm:fetch(user.repayment_type, repayment_typeMap)}</td>
							<td>${user.borrow_duration}${user.unit}</td>
							<td>${user.borrow_fee}</td>
							<td>${user.repayment_interest }</td>
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
