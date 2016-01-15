<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>


<div class="df_member_zsec">
    <ul class="df_member_zsecul1">
        <li class="df_member_zw170">项目名称</li>
        <li class="df_member_zw80">投资金额</li>
        <li class="df_member_zw80">收益率</li>
        <li class="df_member_zw80">投资/计息日</li>
        <li class="df_member_zw80">结束期</li>
        <li class="df_member_zw80">已还/总期数</li>
        <li class="df_member_zw80">合同/转让</li>
    </ul>
    <c:if test="${not empty list.data }">
        <c:forEach items="${list.data }" var="user">
            <div class="df_member_zsecpro1" id="list_${user.id}">
                <ul class="df_member_zsecul2">
                    <li class="df_member_zw170"><a href="${user.url}">${user.borrow_name}</a></li>
                    <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.investor_capital}</span>元</li>
                    <li class="df_member_zw80"><span class="df_member_zsecul2span1">${user.borrow_interest_rate}</span>%</li>
                    <li class="df_member_zw80">${user.invest_time}</li>
                    <li class="df_member_zw80">${user.deadline}</li>
                    <li class="df_member_zw80">
                    <c:choose>
                    <c:when test="${user.status==1}">
                    竞标中
                    </c:when>
                    <c:when test="${user.status==2}">
                    投标失败
                    </c:when>
                    <c:when test="${user.status==3}">
                    投标失败
                    </c:when>
                    <c:otherwise>
                    ${user.has_pay}/${user.total}(<span class="df_member_zsecul2qishu" data="${user.id}" style="color:rgb(46, 166, 226)">还款详情</span>)
                    </c:otherwise>
                    </c:choose>
                    
                    <li>
                    <li class="df_member_zw80">
                    <c:choose>
                    <c:when test="${user.status==1}">
                    ---
                    </c:when>
                    <c:when test="${user.status==2}">
                    ---
                    </c:when>
                    <c:when test="${user.status==3}">
                    ---
                    </c:when>
                    <c:otherwise>
                    <a href="${dfn:U('member/contract/index')}?id=${user.id}" target="_blank" class="df_member_zsecul2a1">合同</a>
                    </c:otherwise>
                    </c:choose>
                    <c:if test="${user.status==4}">/
                    </c:if>                  
                    </li>
                </ul>

            </div>
        </c:forEach>
    </c:if>
    <div class="pagination ajaxpagebar" data="include_page">${list.pageBar}</div>
</div>
		
		 
	
