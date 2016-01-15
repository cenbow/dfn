<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<div class="seccon_record mt20">
		<div class="record_box">
			<h2 class="pay_list_h2">
				<span>共<strong>${borrowInfo.total}</strong>期
				</span> <span>已还<strong>${repaymentPlan.has_pay_times}</strong>期</span> <span>已还本息${repaymentPlan.has_pay_money}元</span> <span>剩余期数${borrowInfo.total-repaymentPlan.has_pay_times}</span> <span>剩余本息${repaymentPlan.left_pay_money}元</span>
			</h2>
			<ul class="record_list_text clear clearfix record_bb record_ft01">
				<li class="re_w60">期数</li>
				<li class="re_w110">还款本金</li>
				<li class="re_w110">还款利息</li>
				<li class="re_w100">还款状态</li>
				<li class="re_w210">还款日期</li>

			</ul>
			<c:if test="${not empty repaymentPlan.list }">
				<c:forEach items="${repaymentPlan.list }" var="plan"   varStatus="foreach">
					<ul class="record_list_text clear clearfix record_bb2 record_ft02">
						<li class="re_w60">${foreach.index+1}</li>
						<li class="re_w110">
						<c:choose>
							<c:when test="${plan.principal=='.00'}">
								0.00
							</c:when>
							<c:otherwise>
								${plan.principal}
							</c:otherwise>
						</c:choose>
						</li>
						<li class="re_w110">${plan.interest}元</li>
						<li class="re_w100">${plan.repayment_status}</li>
						<li class="re_w210">${plan.deadline}</li>
					</ul>
				</c:forEach>
			</c:if>
		</div>
		<!-- end 还款计划 -->
</div>