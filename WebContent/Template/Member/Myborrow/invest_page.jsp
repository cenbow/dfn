<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>


<div class="df_member_zsec">
    <ul class="df_member_zsecul1">
        <li class="df_member_zw80">id</li>
        <li class="df_member_zw170">项目名称</li>
        <li class="df_member_zw80">借款金额</li>
        <li class="df_member_zw80">年化利率</li>
        <li class="df_member_zw80">应付利息</li>
        <li class="df_member_zw80">借款管理费</li>
        <li class="df_member_zw80">已还/总期数</li>
        <li class="df_member_zw80">合同/转让</li>
    </ul>
    <c:if test="${not empty list.data }">
        <c:forEach items="${list.data }" var="user">
            <div class="df_member_zsecpro1" id="list_${user.id}">
                <ul class="df_member_zsecul2">
                    <li class="df_member_zw80">【${user.id}】</li>
                    <li class="df_member_zw170"><a href="${user.url}">${user.borrow_name}</a></li>
                    <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.borrow_money}</span>元</li>
                    <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.borrow_interest_rate}</span>%</li>
                    <li class="df_member_zw80">${user.borrow_interest}</li>
                    <li class="df_member_zw80">${user.borrow_fee}</li>
                    <li class="df_member_zw80">
                    <c:choose>
                    <c:when test="${user.borrow_status==0}">
                    待初审
                    </c:when>
                    <c:when test="${user.borrow_status==2}">
                    募集中
                    </c:when>
                    <c:when test="${user.borrow_status==4}">
                    复审中
                    </c:when>
                    <c:otherwise>
                    ${user.has_pay}/${user.total}(<span class="df_member_zsecul2qishu" data="${user.id}">详情</span>)
                    </c:otherwise>
                    </c:choose>
                    <li>
                    <li class="df_member_zw80">
                    <c:choose>
                    <c:when test="${user.borrow_status==0}">
                    ---
                    </c:when>
                    <c:when test="${user.borrow_status==2}">
                    ---
                    </c:when>
                    <c:when test="${user.borrow_status==4}">
                    ---
                    </c:when>
                    <c:otherwise>
                    <a href=""  class="df_member_zsecul2a1">合同</a>/转让
                    </c:otherwise>
                    </c:choose>
                    </li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <div class="pagination ajaxpagebar" data="include_page">${list.pageBar}</div>
</div>
		
		 
	
