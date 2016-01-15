<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div style="width:500px">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">UID</th>
					<th>用户名</th>
					<th>推荐人数</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>					
							<td><a href="${dfn:SU(_thisUrl_,'logdetail')}?m%23recommend_id=${user.id}&pagebar=logdetail" class="J_dialog" title="二推荐详情 "> ${dfn:defaultValue(user.num,'0')} </a> </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</div>
<%@ include file="../Common/footer.jsp" %>