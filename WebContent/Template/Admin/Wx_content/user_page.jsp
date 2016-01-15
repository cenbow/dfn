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
					<th>消息类型</th>
					<th>事件key</th>
					<th>触发次数</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr id="list_${user.id}">
							<td align="center">${user.id}</td>
							<td>${user.title}</td>
							<td>
							<c:choose>
									<c:when test="${user.msg_type eq 'news'}">图文</c:when>
									<c:when test="${user.msg_type eq 'text'}">文本</c:when>
							</c:choose>
							</td>
							<td>${user.event_key}</td>
							<td>${user.click}</td>
							<td><a href="${dfn:U('admin/wx_content/edit')}?id=${user.id}">修改| </a> &nbsp;&nbsp; 
                            <a	href="${dfn:U('admin/wx_content/deleteAd')}?id=${user.id}"	class="J_ajax_del">删除</a> &nbsp;&nbsp; </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>