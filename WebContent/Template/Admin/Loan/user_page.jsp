<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>贷款主体</th>
					<th>贷款用途</th>
					<th>贷款金额</th>
					<th>贷款期限</th>
					<th>添加时间</th>
					<th>贷款类型</th>
					<th>审核</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td>${subject_select[user.loan_subject]}</td>
							<td>${user.purpose_borrowed}</td>
							<td>${user.amount_borrowed}</td>
							<td>${user.expired_borrowed}</td>
							
							<td>${user.add_time}</td>
							<td>
							 	${product_select[user.product] }
							</td>
							
							<td>
								<c:choose>
									<c:when test="${user.status == '0' }" >
											<a href="${dfn:U('admin/loan/edit')}?id=${user.id}" class="J_dialog" title="贷款审核"
												>审核</a> <%--  &nbsp;|&nbsp; <a
										href="${dfn:U('admin/loan/delete')}?id=${user.id}"
										class="J_ajax_del">删除</a> &nbsp;&nbsp;  --%>
									</c:when>
									<c:when test="${user.status == '-1' }" >
											 未通过
									</c:when>
									<c:when test="${user.status == '1' }" >
											 已通过
									</c:when>
									 
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>