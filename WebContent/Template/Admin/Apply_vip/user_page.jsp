<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>所选客服</th>
					<th>申请说明</th>
					<th>省</th>
					<th>市</th>
					<th>区</th>
					<th>申请时间</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user"> --%>
				
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.customer_name}</td>
							<td>${user.des}</td>
							<td>${user.province_now}</td>
							<td>${user.city_now}</td>
							<td>${user.area_now}</td>
							<td>${user.add_time}</td>
							<td>${user.reg_time }</td>
							<td> <a
								href="${dfn:U('admin/apply_vip/user_edit')}?id=${user.id}"
								class="J_dialog" title="VIP申请"> 审核 </a></td>
						</tr>
					<%-- </c:forEach>
				</c:if> --%>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp" %>