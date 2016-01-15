<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">序号</th>
					<th>角色名称</th>
					<th>角色描述</th>
					<th>状态</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
 --%>
						<tr>
						<td align="center">${user.group_id}</td>
							<td align="center">${user.groupname}</td>
							<td><a target="_blank" href="#">${user.groupinfo}</a></td>
							
							<td><c:choose>
									<c:when test="${user.status==1}">启用</c:when>
									<c:when test="${user.status==2}">借款人</c:when>
									
								</c:choose></td>
							
							<td> <a
						href="${dfn:U('admin/group/edit_menu')}?id=${user.id}"
						> 修改 | </a> &nbsp;&nbsp;  <a
						href="http://demo.鼎峰P2P.com/admin_post/delete/tid/93.html"
						class="J_ajax_del">删除</a> &nbsp;&nbsp;</td>
						</tr>
					<%-- </c:forEach>
				</c:if> --%>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>