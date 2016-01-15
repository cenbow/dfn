<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>标名</th>
					<th>转让金额</th>
					<th>转让溢价</th>
					<th>已转出金额</th>
					<th>平台手续费</th>
					<th>转让时间</th>
					<th>处理结果</th>
					<th>转让状态</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.id}</td>
							<td>${user.user_name}</td>
							<td>${user.borrow_name}</td>
							<td>${user.credit_money}元</td>
							<td>${user.transfer_fee}元</td>
							<td>${user.has_transfer}元</td>
							<td>${user.site_fee}元</td>
							<td>${user.add_time}</td>
							<td>${dfn:defaultValue(user.deal_info,'---')}</td>
							<td><c:choose>
									<c:when test="${user.status==0}"><a href="${dfn:SU(_thisUrl_,'edit')}?id=${user.id}"	class="J_dialog" title="转让审核 ">待审核</a></c:when>
									<c:when test="${user.status==1}"><a href="${dfn:SU(_thisUrl_,'edit')}?id=${user.id}"	class="J_dialog" title="转让审核 ">转让中</a></c:when>
									<c:when test="${user.status==2}">转让结束</c:when>
									<c:when test="${user.status==5}">申请未通过</c:when>
									<c:when test="${user.status==4}">转让完成</c:when>
								</c:choose></td>
							
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
