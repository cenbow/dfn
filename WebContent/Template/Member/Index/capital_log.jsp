<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
    <c:if test="${not empty capital_log.data }">
        <c:forEach items="${capital_log.data }" var="user">
            <div class="df_member_zsecpro1" id="list_${user.id}">
                <ul class="df_member_zsecul2">
                    <li class="df_member_zw60">${user.id}</li>
                    <li class="df_member_zw80">${moneyType[user['type']]}</li>
                    <li class="df_member_zw80">${dfn:compareNum(user['affect_money'],'0','<b class="green">','<b class="red">')}${user.affect_money}</b></li>
                    <li class="df_member_zw80">${user.account_money}</li>
                    <li class="df_member_zw80">${user.collect_money}</li>
                    <li class="df_member_zw80">${user.freeze_money}</li>
                    <li class="df_member_zw130">${user.add_time}</li>
                    <li class="df_member_zw200" title="${user.info}">${user.info}</li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty capital_log.data }">
		<div class="df_member_csf_pic">
			<img src="${MemberStatics}/images/mempic03.jpg">
		</div>
    </c:if>