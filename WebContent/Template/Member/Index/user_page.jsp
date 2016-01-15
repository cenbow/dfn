<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
		<c:if test="${not empty list.data }">
			<c:forEach items="${list.data }" var="user">
				<ul class="df_member_csf_boxul2">
					<li class="df_member_w90">${user.add_time}</li>
					<li class="df_member_w200">${user.type}</li>
					<li class="df_member_w90">${user.borrow_user}</li>
					<li class="df_member_w160">${user.investor_capital}</li>
					<li class="df_member_w150">${user.investor_capital}</li>
					<li class="df_member_w260">${user.info}</li>
				</ul>
			</c:forEach>
		</c:if>
    <c:if test="${empty list.data }">
		<div class="df_member_csf_pic">
			<img src="${MemberStatics}/images/mempic03.jpg">
		</div>
    </c:if>