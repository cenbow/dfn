<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th align="center">ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>手机号</th>
					<th>所属客服</th>
					<th>会员类型</th>
					<th>可用余额</th>
					<th>冻结金额</th>
					<th>待收金额</th>
					<th>会员等级</th>
					<th>注册时间</th>
					<th>操作</th>
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
							<td>${user.customer_name}</td>
							<td><c:choose>
									<c:when test="${user.user_type==1}">投资人</c:when>
									<c:when test="${user.user_type==2}">借款人</c:when>
									<c:when test="${user.user_type==5}">机构</c:when>
								</c:choose></td>
							<td>${user.account_money}元</td>
							<td>${user.money_freeze}元</td>
							<td>${user.money_collect}元</td>
							<td>${listlevelMap[user.user_leve]}</td>
							<td>${user.reg_time }</td>
							<td><a href="${dfn:U('admin/user/money_edit')}?id=${user.id}" class="J_dialog"  title="调整余额"> 调整余额 </a> 
                            &nbsp;&nbsp; <a href="${dfn:U('admin/user/card_edit')}?id=${user.id}"	class="J_dialog" title="添加卡券 "> 添加卡券 </a> 
                            &nbsp;&nbsp; <a href="${dfn:U('admin/user/credit_edit')}?id=${user.id}"	class="J_dialog" title="调整授信 "> 调整授信 </a> 
                            &nbsp;&nbsp; <a	href="${dfn:U('admin/user/user_edit')}?id=${user.id}">修改信息</a> 
                            &nbsp;&nbsp; <a	href="${dfn:U('admin/common/postborrow')}?id=${user.id}" target="_blank">发标</a> 
                            </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
