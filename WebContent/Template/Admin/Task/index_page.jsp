<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr  align="center">
					<th  align="center" rowspan="2">ID</th>
					<th  align="center" rowspan="2">任务名</th>
					<th  align="center" colspan="4">运行时间</th>
					<th  rowspan="2">状态</th>
					<th  rowspan="2">操作</th>
				</tr>
				<tr  align="center">
					<th  align="center">月</th>
					<th  align="center">日</th>
					<th  align="center">小时</th>
					<th   align="center">分钟</th>
				</tr>
			</thead>
			<tbody>

				<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user"> --%>
				<tr>

					<td><a target="_blank" href="#">${user.id}</a></td>
					<td>${user.name}</td>
					<td>${user.month}</td>
					<td>${user.day}</td>
					<td>${user.hour}</td>
					<td>${user.min}</td>
					<td>${user.is_on}</td>

					<td><a href="${dfn:U('admin/task/edit')}?id=${user.id}">
							修改 </a> &nbsp;&nbsp;  <a
						href="http://demo.鼎峰P2P.com/admin_post/delete/tid/93.html"
						class="J_ajax_del">删除</a> &nbsp;&nbsp;<a
						href="${dfn:U('admin/task/show_edit')}?id=${user.id}"
						class="J_dialog" title="查看最后一次执行记录"> 查看最后一次执行记录</a> &nbsp;&nbsp;</td>
				</tr>
				<%-- </c:forEach>
				</c:if> --%>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
<script type="text/javascript">
	$("#page_bar ul li a").click(function() {
		var url = $(this).attr("href");
		$.get(url, function(data) {
			$("#include_page").html(data);
		});
		return false;
	});
</script>