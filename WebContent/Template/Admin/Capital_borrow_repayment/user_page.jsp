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
                    <th>标号</th>
					<th>投资人</th>
					<th>真实姓名</th>
					<th>应收本金</th>
					<th>应收利息</th>
					<th>使用奖励</th>
					<th>待收本金</th>
					<th>待收利息</th>
					<th>利息管理费</th>
					<th>当前期数</th>
					<th>借款名称</th>
					<th>产品名称</th>
					<th>待收时间</th>
					<th>应收时间</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.borrow_id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.capital}</td>
							<td>${user.interest}</td>
							<td>${user.use_reward_money}</td>
							<td>${user.capital-user.receive_capital}</td>
							<td>${dfn:getFloatValue(user.interest-user.receive_interest-user.interest_fee)}</td>
							<td>${user.interest_fee}</td>
							<td>${user.sort_order}/${user.total}</td>
							<td>${user.borrow_name}</td>
							<td>${borrowType[user.borrow_type]}</td>
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
