<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">查看表结构</a></li>
		</ul>
		<form method="post" class="J_ajaxForm"
			action="${dfn:U('admin/db/editDb')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table class="table table-hover">
					<table>
						<tr>
							<th>字段：</th>
							<th>类型：</th>
							<th>索引：</th>
							<th>默认值：</th>
							<th>其他：</th>
						</tr>
					</table>
					<tbody>
						<tr>
							<td>${user.Field}</td>
							<td>${user.Type}</td>
							<td>${user.Key}</td>
							<td>${user.Default}</td>
							<td>${user.Extra}</td>
						</tr>
					</tbody>
				</table>
			</div>


			

		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>