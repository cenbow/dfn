<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>广告位置</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>添加时间</th>
					<th>广告类型</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td>${user.title}</td>
							<td>${user.start_time}</td>
							<td>${user.end_time}</td>
							
							<td>${user.add_time}</td>
							<td>
							<c:choose>
									<c:when test="${user.ad_type eq '1'}">普通广告</c:when>
									<c:when test="${user.ad_type eq '2'}">多图广告</c:when>
							</c:choose>
							</td>
							
							<td><a href="${dfn:U('admin/ad/edit')}?id=${user.id}"
								>修改| </a> &nbsp;&nbsp;  <a
						href="${dfn:U('admin/ad/deleteAd')}?id=${user.id}"
						class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>