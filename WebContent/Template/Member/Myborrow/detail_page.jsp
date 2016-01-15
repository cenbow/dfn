<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<div class="df_member_zsecdetail" id="list_detail_${id}">
    <ul class="df_member_zsecdetailul df_member_zsecdetailulbg">
        <li class="df_member_zw80">当前/总(期)</li>
        <li class="df_member_zw170">应还本金</li>
        <li class="df_member_zw80">应还利息</li>
        <li class="df_member_zw80">已还本金</li>
        <li class="df_member_zw80">已还利息</li>
        <li class="df_member_zw80">应还时间</li>
        <li class="df_member_zw80">实还时间</li>
        <li class="df_member_zw80">操作</li>
    </ul>
    <c:if test="${not empty list }">
        <c:forEach items="${list }" var="detail">
            <ul class="df_member_zsecdetailul ">
                <li class="df_member_zw80">${detail.sort_order}/${detail.total}</li>
                <li class="df_member_zw170">${detail.capital}</li>
                <li class="df_member_zw80"><span>${detail.interest}元</span></li>
                <li class="df_member_zw80"><span>${detail.receive_capital}元</span></li>
                <li class="df_member_zw80"><span>${detail.has_pay_interest}元</span></li>
                <li class="df_member_zw80">${detail.deadline}</li>
                <li class="df_member_zw80">${detail.repayment_time}</li>
                <li class="df_member_zw80">
                    <c:choose>
                    <c:when test="${detail.status==7}">
                    <a href="javascript:;" onclick="repaymentMoney('${detail.borrow_id}','${detail.sort_order}',this)">还款</a>
                    </c:when>
                    <c:otherwise>
                    ---
                    </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </c:forEach>
    </c:if>
</div>