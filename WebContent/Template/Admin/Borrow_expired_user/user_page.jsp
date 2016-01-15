<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>客服</th>
					<th>总逾期期数</th>
					<th>总逾期金额</th>
					<th>总逾期本金</th>
					<th>总逾期利息</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.customer_name}</td>
							<td>${user.tc}</td>
							
							
							<td>${user.capital_all}</td>
							
							<td>${user.total_expired }</td>
							
							<td>${user.interest_all}</td>
							
							
							
							
			
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>