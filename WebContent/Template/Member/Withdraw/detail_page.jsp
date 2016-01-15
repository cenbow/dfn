<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<div class="df_member_zsec">
    <ul class="df_member_zsecul1">
        <li class="df_member_w150">提现时间</li>
        <li class="df_member_w150">提现金额（元）</li>
        <li class="df_member_w90">手续费</li>
        <li class="df_member_w150">到帐金额</li>
        <li class="df_member_w90">提现状态</li>
        <li class="df_member_w150">订单号</li>
    </ul>
    <c:if test="${not empty list.data }">
        <c:forEach items="${list.data }" var="user">
            <div class="df_member_zsecpro1" id="list_${user.id}">
                <ul class="df_member_zsecul2">
					<li class="df_member_w150">${user.add_time}</li>
					<li class="df_member_w150"><span class="df_member_zsecul2span1">${user.withdraw_money+user.withdraw_fee}</span>元</li>
					<li class="df_member_w90"><b class="red">${user.withdraw_fee}</b>元</li>
					<li class="df_member_w150"><b class="green">${user.withdraw_money}</b>元</li>
					<li class="df_member_w90">${statusInfo[user.withdraw_status]}</li>
					<li class="df_member_w150">${user.t_tran_id}</li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <div class="pagination ajaxpagebar" data="include_page">${list.pageBar}</div>
</div>
		
		 
	
