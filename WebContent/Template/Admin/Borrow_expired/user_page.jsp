<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">标的ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>客服</th>
					<th>借款标题</th>
					<th>期数</th>
					<th>应还时间</th>
					<th>应还金额</th>
					<th>应还本金</th>
					
					<th>应还利息</th>
					<th>逾期天数</th>
					<th>罚金</th>
					<th>催收费</th>
					<th>借款总金额</th>
					
					<th>操作</th>
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
							<td>${user.borrow_name}</td>
							
							<td>${user.sort_order}</td>
							<td>${user.deadline}</td>
							<td>${user.interest+user.capital}</td>
							
							<td>${user.capital }</td>
							
							<td>${user.interest}</td>
							<td>${user.breakday}</td>
							<td>${user.expired_money}</td>
							
							<td>${user.call_fee}</td>
							<td>${user.borrow_money}</td>
							
							
							
							
							<td><a href="${dfn:U('admin/borrow_expired/edit')}?id=${user.id}"
								class="J_dialog" title="调整余额"> 代还 </a> &nbsp;&nbsp;   </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar"  id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>