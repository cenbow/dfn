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
					<th>地区名称</th>
					<th>地区排序</th>
					<th>是否开启子站</th>
					
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.name}</td>
							<td>${user.sort_order}</td>
						
							<td>
								${user.domain}
							</td>
							
							<td><a href="${dfn:U('admin/area/add_page')}?id=${user.id}"
								> 添加下级地区 </a> &nbsp;&nbsp; <a
								href="${dfn:U('admin/area/edit_page')}?id=${user.id}"
								>  编辑</a> &nbsp;&nbsp;  <a
						href="http://demo.鼎峰P2P.com/admin_post/delete/tid/93.html"
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