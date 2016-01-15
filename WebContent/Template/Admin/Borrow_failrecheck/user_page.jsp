<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>借款人</th>
					<th>借款种类</th>
					<th>标题</th>
					<th>借款金额</th>
					<th>还款方式</th>
					<th>借款期限</th>
					<th>处理时间</th>
					<th>处理说明</th>
					
					<th>处理人</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${dfForm:fetch(user.borrow_type, borrow_typeMap)}</td>
							<td>${user.borrow_name}</td>
							<td>${user.borrow_money}</td>
							
							<td>${dfForm:fetch(user.repayment_type, repayment_typeMap)}</td>
							<td>${user.borrow_duration}</td>
							<td>${user.deal_time_2}</td>
							
							<td>${user.deal_info_2 }</td>
							<td>${user.deal_user_2 }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>