<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">会员资料类型管理</a></li>
		</ul>
		<form method="post" class="J_ajaxForm" action="${dfn:U('admin/user_upload/doEdit_sort_order')}">
			<div class="table_list">
				<table class="table table-hover">
					<thead>
						<tr>
							<th align="center">排序</th>
							<th>ID</th>
							<th>分类名称</th>
							<th>管理操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty list.data }">
							<c:forEach items="${list.data }" var="user">
								<c:set var="thisSortOrder" value="${user.id }#sort#sort_order" />
						<tr id="list_${user.id }">
									<td>
										${dfForm:input( thisSortOrder, user.sort_order, dfForm_class, dfForm_style,dfForm_others)}	
									</td>
									<td align="center">${user.id}</td>
									<td>${user.text}</td>
									<td><a
										href="${dfn:U('admin/user_upload/egroup_add')}?id=${user.id}"
										class="J_dialog" title="添加子分类"> 添加子分类 </a> &nbsp;&nbsp; <a
										href="${dfn:U('admin/user_upload/egroup_edit')}?id=${user.id}"
										class="J_dialog" title=" 修改"> 修改</a> &nbsp;&nbsp; <a
										href="${dfn:U('admin/user_upload/egroup_delete')}?id=${user.id}"
										class="J_ajax_del">删除</a> &nbsp;&nbsp;</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>

				</table>
				<%-- <div class="pagination ajaxpagebar" data="include_page"
					id="page_bar">${list.pageBar}</div> --%>
			</div>
			<div class="form-actions">
							<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$("#page_bar ul li a").click(function() {
			var url = $(this).attr("href");
			$.get(url, function(data) {
				$("#include_page").html(data);
			});
			return false;
		});
	</script>
	<%@ include file="../Common/footer.jsp"%>