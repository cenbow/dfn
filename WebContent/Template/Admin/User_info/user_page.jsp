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
					<th  >基本资料</th>
					<th  >联系方式</th>
					<th>单位资料</th>
					<th>财务状况</th>
					<th>房产资料</th>
					<th>联保情况</th>
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
							<td >${not empty user.contact?'已填写':'未填写' }</td>
							<td >${not empty user.contact?'已填写':'未填写'}</td>
							<td>${not empty user.department?'已填写':'未填写'}</td>
							<td>${not empty user.financial?'已填写':'未填写'}</td>
							<td>${not empty user.house?'已填写':'未填写'}</td>
							<td>${not empty user.ensure?'已填写':'未填写'}</td>
							<td><a href="${dfn:U('admin/user_info/view')}?id=${user.id}"
								class="J_dialog" title="${user.user_name}的详细资料"> 查看 </a>
								&nbsp;&nbsp;</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp" %>