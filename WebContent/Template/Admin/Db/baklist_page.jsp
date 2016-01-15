<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="16"><label><input class="J_check_all"
							data-direction="x" data-checklist="J_check_x" type="checkbox"></label></th>

					<th align="center">序号</th>
					<th>文件夹名称</th>
					<th>备份时间</th>
					<th>备份说明</th>				
					<th>大小</th>				
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="checkbox[]" value="${user.dirname}"
								type="checkbox"></td>
							<td align="center">${user.key}</td>
							<td><a target="_blank" href="#">${user.dirname}</a></td>
							<td>${user.baktime}</td>
							<td>${user.bakdetail}</td>

							<td>${user.size}</td>						
					

							<td><a href="${dfn:U('admin/db/user_edit')}?id=${user.id}"
								class="J_dialog" title="查看${user.name}表结构"> 查看表结构 </a>
								&nbsp;&nbsp;  </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<%@ include file="../Common/footer.jsp"%>