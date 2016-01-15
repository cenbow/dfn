<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<div class="table_list">
	<table class="table table-hover">
		<thead>
			<tr>
				<th align="center">ID</th>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>所属客服</th>
				<th>会员类型</th>
				<th>注册IP</th>
				<th>注册时间</th>
				<th>推荐人</th>
				<th>推荐/取消时间</th>
				<th>推荐类型</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${not empty list.data }">
				<c:forEach items="${list.data }" var="user">
					<tr>
						<td align="center">${user.id}</td>
						<td><a href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
						<td>${user.real_name}</td>
						<td>${user.customer_name}</td>
						<td><c:choose>
								<c:when test="${user.user_type eq '1'}">普通会员</c:when>
								<c:when test="${user.user_type eq '2'}">借款人</c:when>
								<c:when test="${user.user_type eq '5'}">机构</c:when>
							</c:choose></td>
						<td>${user.reg_ip}</td>
						<td>${user.reg_time}</td>

						<td>${user.refer_user_name}</td>
						<td>${user.recommend_time}</td>
						<td>${user.recommend_type}</td>

						<td>
                        	<a href="${dfn:U('admin/user_refer/editreward')}?id=${user.id}" class="J_dialog" title="设置推荐奖励"> 设置推荐奖励 </a> &nbsp;&nbsp;
                            <c:if test="${!empty user.refer_user_name}">
                            <a class="red J_ajax_confirm"	href="${dfn:U('admin/user_refer/removerefer')}?id=${user.id}" tip="确定要取消关联吗？">取消关联</a>
                            </c:if>
                            <c:if test="${empty user.refer_user_name}">
                            <a href="${dfn:U('admin/user_refer/appoint')}?id=${user.id}" class="J_dialog" title=" 指定推荐人"> 指定推荐人</a>
                            </c:if>
                          </td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
</div>
<%@ include file="../Common/footer.jsp"%>