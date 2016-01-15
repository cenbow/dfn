<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

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
					<th>客服</th>
					<th>禁用</th>
					<th>联系方式</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.real_name}</td>
							 
							<td>${roleSelect[user['u_group_id']]}
								
							</td>

							<td>${user.last_log_ip}</td>
							<td>${user.last_log_time}</td>
							<td><c:choose>
									<c:when test="${user.is_kf eq '1'}">是</c:when>
									<c:when test="${user.is_kf eq '0'}">否</c:when>

								</c:choose></td>
							<td><c:choose>
									<c:when test="${user.is_ban eq '1'}">是</c:when>
									<c:when test="${user.is_ban eq '0'}">否</c:when>

								</c:choose></td>
							<td>${user.contact}</td>

							<td><a	href="${dfn:U('admin/management/edit')}?id=${user.id}"> 修改 </a> &nbsp;&nbsp; 
                            <a href="${dfn:U('admin/management/delManagement')}?id=${user.id}"	class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar"   id="page_bar">${list.pageBar}</div>
	</div>
