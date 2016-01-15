<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>发送内容</th>
					<th>发送时间</th>
					<th>接收人</th>
					<th>本次发送条数</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td><a target="_blank" href="#">${user.msg}</a></td>
							<td>${user.send_time}</td>
							<td>${user.receiver}</td>
							
							<td>${user.num}</td>
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar"  id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>