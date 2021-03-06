<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>标题</th>
					<th>所属栏目</th>
					<th>文章类型</th>
					<th>发布人</th>
					<th>添加时间</th>
					<th>管理员操作</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('home/article/index')}?id=${user.id}" target="_blank">${user.title}</a></td>
							<td>${user.cate_name}</td>
							<td>
								<c:choose>
									<c:when test="${ user.attr eq '1'}">普通</c:when>
								</c:choose>
							<td>${user.writer}</td>
							<td>${user.add_time}</td>
							
							<td><a href="${dfn:U('admin/article/edit_page')}?id=${user.id}"
								>修改| </a> &nbsp;&nbsp;  <a href="${dfn:U('admin/article/deleteArticle')}?id=${user.id}" class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>