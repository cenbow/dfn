<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp" %>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>认证手机号</th>
					<th>是否VIP</th>
					<th>可用余额</th>
					<th>冻结金额</th>
					<th>待收金额</th>				
					<th>注册时间</th>				
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.user_phone}</td>
							<td><c:choose>
									<c:when test="${user.isVip==1}">普通会员</c:when>
									<c:when test="${user.isVip==2}">借款人</c:when>									
								</c:choose>
							</td>
							<td>${user.account_money}元</td>
							<td>${user.money_freeze}元</td>
							<td>${user.money_collect}分</td>						
							<td>${user.reg_time }</td>
							
						</tr>
					</c:forEach>
				</c:if>
				
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp" %>