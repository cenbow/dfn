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
					<th>充值方式</th>
					<th>充值金额</th>
					<th>手续费</th>
					<th>到帐金额</th>
					<th>充值时间</th>
					<th>充值状态</th>
					<th>对帐订单号</th>
					<th>处理人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
	<c:if test="${not empty list.data }">
			<c:forEach items="${list.data }" var="user" >
				<tr>
					<td align="center">${user.id}</td>
					<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
					<td>${user.real_name}</td>
					<td>${user.customer_name}</td>
					<td>${user.way}</td>
					<td>${user.money}元</td>
					<td>${user.fee}元</td>
					<td>${user.money_collect}元</td>				
					<td>${user.add_time }</td>
					<td><c:choose>
							<c:when test="${user.status eq '0'}">充值未完成</c:when>
							<c:when test="${user.status eq '1'}">充值成功</c:when>
							<c:when test="${user.status eq '2'}">签名不符</c:when>
							<c:when test="${user.status eq '3'}">充值失败</c:when>
						</c:choose></td>
						<td>${user.tran_id}</td>
					<td>${user.deal_user}</td>	
					<td>
                    <c:choose>
							<c:when test="${user.status eq '0'}">
                            <a href="${dfn:U('admin/recharge/edit')}?id=${user.id}"	class="J_dialog" title="充值处理   ">充值处理</a>
                    </c:when>
                    <c:otherwise>
                    ---
                    </c:otherwise>
                    </c:choose>
                    </td>
				</tr>
			</c:forEach>
		</c:if>

			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
