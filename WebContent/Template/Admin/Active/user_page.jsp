<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>咨询人</th>
					<th>真实姓名</th>
					<th>身份证号码</th>
					<th>联系电话</th>
					<th>借款金额</th>
					
					<th>公司名称</th>
					<th>借款用途</th>
					<th>地区</th>
					<th>添加时间</th>
					<th>操作</th>
					
				</tr>
			</thead>
			<tbody>
				<%-- <c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
 --%>
						<tr>
							<td align="center">${user.id}</td>
							<td><a target="_blank" href="#">${user.title}</a></td>
							<td>${user.start_time}</td>
							<td>${user.end_time}</td>
							
							<td>${user.add_time}</td>
							<td>${user.ad_type}</td>
							
							
							
							<td>${user.start_time}</td>
							<td>${user.end_time}</td>
							
							<td>${user.add_time}</td>
							<td>${user.ad_type}</td>
							
							<td><a href="${dfn:U('admin/active/edit')}?id=${user.id}"
								class="J_dialog" title="审核">审核  </a> &nbsp;&nbsp;  </td>
						</tr>
					<%-- </c:forEach>
				</c:if> --%>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp"%>