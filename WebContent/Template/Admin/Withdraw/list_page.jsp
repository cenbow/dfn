<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>					
					<th>提现金额</th>
					<th>手续费</th>
					<th>到帐金额</th>
					<th>真实姓名</th>
					<th>提现银行</th>
					<th>银行帐号</th>
					<th>开户行</th>
					<th>提现时间</th>
					<th>处理人</th>
					<th>处理时间</th>
					<th>处理说明</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
 <c:if test="${not empty list.data }">
			<c:forEach items="${list.data }" var="user"> 
				<tr>
					<td align="center">${user.id}</td>
					<td>${user.user_name}</td>					
					<td>${user.withdraw_money+user.withdraw_fee+user.adjust_fee}</td>
					<td>${user.withdraw_fee+user.adjust_fee}元</td>
					<td>${user.withdraw_money}元</td>
					<td>${user.real_name}</td>
					<td>${user.bank_name}</td>					
					<td>${user.bank_num}</td>
					<td>${user.add_time}</td>
					<td>${user.user_name}</td>				
					<td>${user.deal_time}</td>					
						<td>${user.deal_info}</td>
					<td>${user.deal_user}</td>	
					<td>
                    <c:choose>
							<c:when test="${user.withdraw_status eq '0'}"><a href="${dfn:U('admin/withdraw/edit')}?id=${user.id}"	class="J_dialog" title="充值处理   ">待处理</a></c:when>
							<c:when test="${user.withdraw_status eq '1'}"><a href="${dfn:U('admin/withdraw/edit')}?id=${user.id}"	class="J_dialog" title="充值处理   ">审核通过，处理中</a></c:when>
							<c:when test="${user.withdraw_status eq '2'}">提现完成</c:when>
							<c:when test="${user.withdraw_status eq '3'}">提现未通过</c:when>
						</c:choose>
                    </td>
				</tr>
 
			</c:forEach>
		</c:if> 


			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
