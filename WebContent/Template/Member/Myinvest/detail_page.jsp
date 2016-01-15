<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<div class="df_member_zsecdetail" id="list_detail_${id}">
    <ul class="df_member_zsecdetailul df_member_zsecdetailulbg">
        <li class="df_member_zw80">当前/总(期)</li>
        <li class="df_member_zw170">应收本金</li>
        <li class="df_member_zw80">应收利息</li>
        <li class="df_member_zw80">利息管理费</li>
        <li class="df_member_zw80">实收本息</li>
        <li class="df_member_zw80">应还时间</li>
        <li class="df_member_zw80">还款状态</li>
    </ul>
    <c:if test="${not empty list }">
        <c:forEach items="${list }" var="detail">
            <ul class="df_member_zsecdetailul ">
                <li class="df_member_zw80">${detail.sort_order}/${detail.total}</li>
                <li class="df_member_zw170">${detail.capital}</li>
                <li class="df_member_zw80"><span>${detail.interest}元</span></li>
                <li class="df_member_zw80"><span>${detail.interest_fee}</span>元</li>
                <li class="df_member_zw80"><span>${detail.receive_interest+detail.receive_capital}</span></li>
                <li class="df_member_zw80">${detail.deadline}</li>
                <li class="df_member_zw80">${statusInfo[detail.status]}</li>
            </ul>
        </c:forEach>
    </c:if>
</div>