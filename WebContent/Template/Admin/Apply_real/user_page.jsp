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
					<th>是否VIP</th>
					<th>身份证号码</th>
					<th>身份证照片</th>
					<th>申请时间</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="user">

						<tr>
							<td align="center">${user.uid}</td>
							<td><a  href="${dfn:U('admin/user/user_name')}?id=${user.id}">${user.user_name}</a></td>
							<td>${user.real_name}</td>
							<td>${user.isVIP}</td>
							<td>${user.idcard}</td>
							<td>
								<c:if test="${not empty user.card_img }">
									cardfront:${user.PHP_cardfront}
									<br/>
									cardback:${user.PHP_cardback}
									<br/>
									cardhand:${user.PHP_cardhand}
								</c:if>
							</td>

							<td>${user.id_time}</td>
							<td>${user.reg_time }</td>
							<td>
                            <c:choose>
                            <c:when test="${user.id_status== '1'}">  
                            <span class="green">已通过</span>
                            </c:when>
                            <c:when test="${user.id_status== '2'}">  
                            <span class="red">未通过</span>
                            </c:when>
                            <c:otherwise> 
                            <a href="${dfn:U('admin/apply_real/user_edit')}?id=${user.uid}" class="J_dialog" title="实名认证审核"> 审核 </a>
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
<%@ include file="../Common/footer.jsp" %>