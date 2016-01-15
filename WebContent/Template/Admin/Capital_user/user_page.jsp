<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">UID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>总余额</th>
					<th>可用余额</th>
					<th>冻结金额</th>
					<th>待收金额</th>
					<th>提现总金额</th>
					<th>充值总金额</th>
					<th>注册时间</th>
					
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.money_freeze+user.account_money+user.money_collect}</td>
							<td>${user.account_money}</td>
							
							<td>${user.money_freeze}</td>
							<td>${user.money_collect}</td>
							<td>${user.totalWithdrawMoney}</td>
							
							<td>${user.totalMoney}</td>
							<td>${user.reg_time}</td>
							
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>