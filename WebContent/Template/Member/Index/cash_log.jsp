<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
    <c:if test="${not empty withdraw_log.data }">
        <c:forEach items="${withdraw_log.data }" var="user">
            <div class="df_member_zsecpro1" id="cash_${user.id}">
                <ul class="df_member_zsecul2">
					<li class="df_member_w90">${user.add_time}</li>
					<li class="df_member_w200"><span class="df_member_zsecul2span1">${user.withdraw_money+user.withdraw_fee}</span>元</li>
					<li class="df_member_w90"><b class="red">${user.withdraw_fee}</b>元</li>
					<li class="df_member_w160"><b class="green">${user.withdraw_money}</b>元</li>
					<li class="df_member_w150">${statusInfo[user.withdraw_status]}</li>
					<li class="df_member_w200">${user.t_tran_id}</li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty withdraw_log.data }">
		<div class="df_member_csf_pic">
			<img src="${MemberStatics}/images/mempic03.jpg">
		</div>
    </c:if>