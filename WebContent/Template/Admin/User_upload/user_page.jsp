<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>所属客服</th>
					<th>资料分类</th>
					<th>资料名称</th>
					<th>上传时间</th>
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
							<td>${user.customer_name}</td>
							<td>${egroupMap[user.type]}</td>
							<td>${user.data_name}</td>
							<td>${user.add_time }</td>
							<td><a
								href="${dfn:U('admin/user_upload/user_edit')}?id=${user.id}"
								class="J_dialog" title="会员上传资料审核"> 审核</a> </td>
						</tr>
					</c:forEach>
				</c:if>
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