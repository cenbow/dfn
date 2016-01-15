<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<c:if test="${not empty invest_log.data }">
    <c:forEach items="${invest_log.data }" var="user">
        <div class="df_member_zsecpro1" id="list_${user.id}">
            <ul class="df_member_zsecul2">
                <li class="df_member_zw170"><a href="${user.url}">${user.borrow_name}</a></li>
                <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.investor_capital}</span>元</li>
                <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.borrow_interest_rate}</span>%</li>
                <li class="df_member_zw110">${user.invest_time}</li>
                <li class="df_member_zw110">${user.deadline}</li>
                <li class="df_member_zw80">${user.has_pay}/${user.total}<li>
                <li class="df_member_zw110">${user.investor_interest}</li>
                <li class="df_member_zw110">${user.investor_interest+user.investor_capital}</li>
            </ul>
        </div>
    </c:forEach>
</c:if>
    <c:if test="${empty invest_log.data }">
		<div class="df_member_csf_pic">
			<img src="${MemberStatics}/images/mempic03.jpg">
		</div>
    </c:if>