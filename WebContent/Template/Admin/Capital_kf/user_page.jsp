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
					<th>客服用户名</th>
					<th>真实姓名</th>
					<th>所属地区</th>
					<th>所属用户组</th>
					<th>成功投资</th>
					<th>成功借款</th>
					<th>客户会员数量</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.area_name}</td>
							<td>${user.u_group_name}</td>
							
							<td>${user.total_invest_money+user.total_tinvest_money}</td>
							<td>${user.total_borrow_money+user.total_tborrow_money}</td>
							<td>${user.vip_count}</td>
							
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>