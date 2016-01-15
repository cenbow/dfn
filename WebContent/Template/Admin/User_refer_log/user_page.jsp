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
					<th>会员类型</th>
					<th>推荐人数</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.ruid}</td>
							<td>${user.user_name}</td>					
							<td>${listlevelMap[user.user_leve]}</td>
							<td><a href="${dfn:SU(_thisUrl_,'logdetail')}?m%23recommend_id=${user.ruid}&pagebar=logdetail"	class="J_dialog" title="一级推荐详情 "> ${user.num} </a> </td>
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