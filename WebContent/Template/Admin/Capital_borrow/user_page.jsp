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
					<th>借款人</th>
					<th>真实姓名</th>
					<th>借款金额</th>
					<th>应付利息</th>
					<th>已还金额</th>
					<th>待还金额</th>
					<th>年化利率</th>
					<th>借款期限</th>
					<th>产品名称</th>
					<th>到期时间</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.borrow_money}</td>
							<td>${user.borrow_interest}</td>
							<td>${user.repayment_money+user.repayment_interest}</td>
							<td>${user.dh}</td>
							<td>${user.borrow_interest_rate}%</td>
							<td>${user.borrow_duration}${user.unit}</td>
							<td>${borrowType[user.borrow_type]}</td>
							<td>${user.deadline}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
