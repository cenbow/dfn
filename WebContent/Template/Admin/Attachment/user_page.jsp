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
					<th>上传类型</th>
					<th>附件名称</th>
					<th>附件大小</th>
					<th>上传时间</th>
					<th>说明</th>
					<th>管理操作</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.event_type}</td>
							<td>${user.name}</td>
							
							<td>${user.size}</td>
							<td>${user.add_time}</td>
							<td>${user.info}</td>							
							<td><a href="${dfn:U('admin/attachment/user_edit')}?id=${user.id}"
								class="J_dialog" >  预览 </a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>



<%@ include file="../Common/footer.jsp"%>