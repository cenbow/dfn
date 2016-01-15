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
					<th>用户名</th>
					<th>真实姓名</th>
					<th>所属角色</th>
					<th>最后登录IP</th>
					<th>最后登录时间</th>
					<th>禁用</th>
					<th>联系方式</th>

					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a target="_blank" href="#">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${roleSelect[user.u_group_id]}</td>
							<td>${user.last_log_ip}</td>

							<td>${user.last_log_time}</td>

							<td><c:choose>
									<c:when test="${user.is_ban=='1'}">是</c:when>
									<c:when test="${user.is_ban=='2'}">否</c:when>

								</c:choose></td>
							<td>${user.contact}</td>
							<td><a
								href="${dfn:U('admin/agency_list/edit')}?id=${user.id}">
									修改 </a> &nbsp;&nbsp;<a
								href="${dfn:U('admin/agency_list/delAgency_list')}?id=${user.id}"
								class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>