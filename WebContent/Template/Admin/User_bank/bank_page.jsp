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
					<th>所属客服</th>
					<th>身份证号</th>
					<th>银行卡号</th>
					<th>开户行</th>
					<th>支行</th>
					<th>添加时间</th>
					<th>修改时间</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.customer_name}</td>
							<td>${user.idcard}</td>
							<td>${(empty user.bank_num)  ? '---':user.bank_num}</td>
							<td>${(empty user.bank_name)  ? '---':user.bank_name    }</td>
							<td>${(empty user.bank_address)  ? '---':user.bank_address    }</td>
							<td>${user.add_time}</td>
							<td>${(empty user.edit_time)  ? '未修改':user.edit_time  }</td>

						</tr>
					</c:forEach>

				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
 
<%@ include file="../Common/footer.jsp"%>