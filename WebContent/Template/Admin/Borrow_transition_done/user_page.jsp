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
					<th>借款人</th>				
					<th>标题</th>
					<th>借款金额</th>					
					<th>借款期限</th>					
					<th>总流转数</th>
					<th>已流转数</th>					
					<th>借款时间</th>				
					<th>结束时间</th>			
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
 --%>
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.borrow_name}</td>
							<td>${user.borrow_money}</td>
							<td>${user.borrow_duration}个月</td>
							
							<td>${user.transfer_total}</td>
							<td>${user.transfer_out}</td>
							<td>${user.add_time}</td>
							
							<td>${user.deadline }</td>
							<td><a href="${dfn:U('admin/borrow_transition/money_edit')}?id=${user.id}"
								class="J_dialog" title="调整余额"> 编辑 </a> &nbsp;&nbsp; <a
								href="${dfn:U('admin/borrow_see/credit_edit')}?id=${user.id}"
								class="J_dialog" title="调整授信 "> 调整授信 </a> &nbsp;&nbsp;   <a
								href="${dfn:U('admin/borrow_see/user_edit')}">修改信息</a>  </td>
						</tr>
					<%-- </c:forEach>
				</c:if> --%>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>