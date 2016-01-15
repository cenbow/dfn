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
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
 --%>
						<tr>
							<td align="center">${user.id}</td>
							<td><a target="_blank" href="#">${user.user_name}</a></td>
							
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