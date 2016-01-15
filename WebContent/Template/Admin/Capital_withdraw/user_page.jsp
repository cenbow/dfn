<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">UID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>提现总金额</th>
					<th>提现总手续费</th>
					<th>提现总次数</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.uid}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							<td>${user.totalWithdrawMoney}</td>
							<td>${user.totalWithdrawFee}元</td>
							<td>${user.totalTimes}</td>
							
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>