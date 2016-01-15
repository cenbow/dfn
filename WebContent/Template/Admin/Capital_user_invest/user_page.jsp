<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">投资ID</th>
					<th>会员名</th>
					<th>真实姓名</th>
					<th>投标本金</th>
					<th>使用奖励</th>
					<th>标名</th>
					<th>标号</th>
					<th>投标时间</th>
					<th>审核状态</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.investor_capital}</td>
							<td>${user.use_reward_money}</td>
							<td>${user.borrow_name}</td>
							<td>${user.borrow_id}</td>
							<td>${dfn:date(user.add_time,"yyyy-MM-dd HH:mm:ss")}</td>
							<td>${istatus[user.status]}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
