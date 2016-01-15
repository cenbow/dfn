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
					<th>用户名</th>
				
					<th>交易类型</th>
					<th>影响金额</th>
					<th>奖金余额</th>
					
					<th>发生时间</th>
				
					<th>变动原因</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							
							<td>${typeSelect[user.type]}</td>
							<td>${user.affect_money}</td>
							
							<td>${user.reward_money}元</td>
							
							<td>${user.add_time}</td>
							<td>${user.info}</td>
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>