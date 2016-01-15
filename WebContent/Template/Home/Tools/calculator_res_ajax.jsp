<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
 <!--bombbox start  -->
 <c:if test="${not empty errorMsg}">
 <div class="erromsg">${errorMsg}</div>
 
 </c:if>
 
 <c:if test="${not empty repaymentPlan}">
<p class="bombbox_ul">
<span class="mr30">投资总额: <strong>${repaymentPlan.invest_money}</strong> 元</span><span>到期本利: <strong>${repaymentPlan.left_pay_money}</strong> 元</span>
</p>
<h3 style="color:#555;font-size:16px;line-height:30px;text-indent:30px;">计算结果</h3>
<table class="bombbox_table" style="width:100%">
 <tr class="firsttr">
    <th>期数</th>
    <th>每月还款金额</th>
    <th>每月还款本金</th>
    <th>每月还款利息</th>
    <th>剩余还款金额</th>
 </tr>
				<c:forEach items="${repaymentPlan.list}" var="plan"   varStatus="foreach">
 <tr>
     <td>${foreach.index+1}</td>
     <td>${plan.this_all_pay}</td>
     <td>${plan.principal}</td>
     <td>${plan.interest}</td>
     <td>${plan.left_money}</td>
 </tr>
				</c:forEach>
</table>
 </c:if>
