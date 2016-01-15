<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
        <table class="c_bonusInfo">
        	<tr>
            	<th width="30%">类型/面值</th>
            	<th width="20%">来源</th>
            	<th width="30%">使用期限</th>
            	<th width="20%">状态</th>
            </tr>
            <tr>
                <td colspan="4" style="border:none;text-align:left;padding-bottom:0;">*使用红包占自有资金投标金额的25%， 自有资金投标金额100，则可使用红包中的25块钱，总共投标125元,每个红包只能一次性使用，无法多次分别使用。</td>
            </tr>
    <c:if test="${not empty list.data }">
        <c:forEach items="${list.data }" var="user">
            <tr>
            	<td>
                	<div class="c_flagMoney">
                    	<p>
                             <c:choose>
                                <c:when test="${user.type ==1 || user.type==2 || user.type==4}">￥<b>${user.affect_money}</b></c:when>
                                <c:when test="${user.type ==3}"><b>${user.affect_money}</b>%</c:when>
                             </c:choose>
                        </p>
                        <p>
                             <c:choose>
                                <c:when test="${user.type ==1}">体验金</c:when>
                                <c:when test="${user.type ==2}">现金券</c:when>
                                <c:when test="${user.type ==3}">加息券</c:when>
                                <c:when test="${user.type ==4}">红包</c:when>
                             </c:choose>
                          </p>
                    </div>
                </td>
            	<td><span>${user.card}</span></td>
            	<td><span>${user.add_time}—${user.expired_time}</span></td>
            	<td><span><c:choose><c:when test="${user.type==4}">已用${user.use_money}</span></c:when><c:otherwise>${statusInfo[user.status]}</c:otherwise></c:choose></td>
            </tr>
        </c:forEach>
    </c:if>

        </table>
		<div class="pagination ajaxpagebar" data="include_page">${list.pageBar}</div>
