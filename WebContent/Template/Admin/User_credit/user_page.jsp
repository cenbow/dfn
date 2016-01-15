<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>交易类型</th>
					<th>影响积分</th>
					<th>帐户积分</th>
					<th>发生时间</th>
					<th>变动原因</th>					
				</tr>
			</thead>
			<tbody>
<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
				
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td><c:choose>
									<c:when test="${user.type eq 1}">正常还款</c:when>
									<c:when test="${user.type eq 2}">迟还</c:when>									
									<c:when test="${user.type eq 3}">提前还款</c:when>									
									<c:when test="${user.type eq 4}">提前还款</c:when>									
									<c:when test="${user.type eq 5}">实名认证</c:when>									
									<c:when test="${user.type eq 6}">视频认证</c:when>									
									<c:when test="${user.type eq 7}">现场认证</c:when>									
									<c:when test="${user.type eq 8}">VIP审核</c:when>									
									<c:when test="${user.type eq 9}">管理员操作</c:when>									
									<c:when test="${user.type eq 10}">普通标投标</c:when>									
									<c:when test="${user.type eq 11}">流转标投标</c:when>									
									<c:when test="${user.type eq 12}">兑换商品消耗</c:when>									
								</c:choose></td>
							<td>${user.affect_credits}分</td>
							<td>${user.account_credits}分</td>						
						
							<td>${user.add_time }</td>
							
							<td>${user.info}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
<%@ include file="../Common/footer.jsp" %>