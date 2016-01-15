<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

		<c:if test="${not empty recharge_log.data }">
			<c:forEach items="${recharge_log.data }" var="user">
				<ul class="df_member_zsecul2">
					<li class="df_member_w200">${user.add_time}</li>
					<li class="df_member_w200"><span class="df_member_zsecul2span1">${user.money}</span>元</li>
					<li class="df_member_w90"><b class="red">${user.fee}</b>元</li>
					<li class="df_member_w160"><b class="green">${user.money-user.fee}</b>元</li>
					<li class="df_member_w150">${statusInfo[user.status]}</li>
					<li class="df_member_w150">${user.tran_id}</li>
				</ul>
			</c:forEach>
		</c:if>
    <c:if test="${empty recharge_log.data }">
		<div class="df_member_csf_pic">
			<img src="${MemberStatics}/images/mempic03.jpg">
		</div>
    </c:if>