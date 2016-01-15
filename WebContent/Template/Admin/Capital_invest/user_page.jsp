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
					<th>会员名</th>
					<th>真实姓名</th>
					<th>投标次数</th>
					<th>资金使用量(金额*期限)</th>
					<th>投标本金</th>
					<th>已收本金</th>
					<th>待收本金</th>
					<th>应收利息</th>
					<th>实收利息</th>
					<th>应付利息管理费</th>
					<th>已付利息管理费</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.num}</td>
							<td>${user.investor_capital_duration}</td>
							<td>${user.investor_capital}</td>
							<td>${user.receive_capital}</td>
							<td>${user.investor_capital-user.receive_capital}</td>
							<td>${user.investor_interest}</td>
							<td>${user.receive_interest}</td>
							<td>${user.invest_fee}</td>
							<td>${user.paid_fee}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
