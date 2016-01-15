<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
                    <th>标号</th>
					<th>借款名称</th>
					<th>产品名称</th>
					<th>借款人</th>
					<th>真实姓名</th>
					<th>应还本金</th>
					<th>应还利息</th>
					<th>待还本金</th>
					<th>待还利息</th>
					<th>当前期数</th>
					<th>待还时间</th>
					<th>应还时间</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td>${user.borrow_id}</td>
							<td>${user.borrow_name}</td>
							<td>${borrowType[user.borrow_type]}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.capital}</td>
							<td>${user.interest}</td>
							<td>${user.capital-user.receive_capital}</td>
							<td>${dfn:getFloatValue(user.interest-user.receive_interest-user.interest_fee)}</td>
							<td>${user.sort_order}/${user.total}</td>
							<td>${user['deadline']}</td>
							<td><c:if test="${not empty user.repayment_time}">${dfn:date(user.repayment_time,"yyyy-MM-dd")}</c:if></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
