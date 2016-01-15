<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>借款人</th>
					<th>标题</th>
					<th>借款种类</th>
					<th>借款金额</th>
					<th>已还金额</th>
					<th>还款方式</th>
					<th>借款期限</th>
					<th>即将还款日期</th>
					<th>即将还款金额</th>
					<th>本金</th>
					<th>利息</th>
					<th>期数</th>
					<th>借款手续费</th>
					<th>还款最终限期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td <c:if test="${current>user.deadline}">style="color:#F00"</c:if>>${user.borrow_name}</td>
							<td>
								${dfForm:fetch(user.borrow_type,borrow_typeMap)}
							</td>
							<td>${user.borrow_money}</td>
							<td>${user.repayment_money+user.repayment_interest}</td>
							
							<td>
							${dfForm:fetch(user.repayment_type,repayment_typeMap)}
							</td>
							<td>${user.borrow_duration}${user.unit}</td>
							<td>${user.this_deadline}</td>
							<td>${user.capital+user.interest}</td>
							<td>${user.capital}</td>
							<td>${user.interest}</td>
							<td>${user.sort_order}/${user.total}</td>
							<td>${user.borrow_fee}</td>
							<td>${dfn:date(user.deadline,"yyyy-MM-dd")}</td>
							<td><a href="${dfn:U('admin/borrow_repayment_user')}?borrow_id=${user.id}&sort_order=${user.sort_order}" target="_blank">代还</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
