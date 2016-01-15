<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<div class="seccon_record mt20">
	<h2 class="seccon_tit seccon_tit2">
		<span class="sec_curspan">承接记录</span><span>转让明细</span>
	</h2>
	<div class="seccon_tbox">
		<div class="record_box">
			<ul class="record_list_text clear clearfix record_bb record_ft01">
				<li class="re_w60">序号</li>
				<li class="re_w110">投资人</li>
				<li class="re_w210">投资金额</li>
				<li class="re_w210">投资时间</li>
			</ul>

			<c:if test="${not empty investorList.list }">
				<c:forEach items="${investorList.list }" var="user">
					<ul class="record_list_text clear clearfix record_bb2 record_ft02">
						<li class="re_w60">${user.sn}</li>
						<li class="re_w110">${user.user_name}</li>
						<li class="re_w210">${user.receive_money}元</li>
						<li class="re_w210">${user.add_time}</li>
					</ul>
				</c:forEach>
			</c:if>

		</div>
		<!-- end 投资记录 -->
		<div class="record_box" style="display: none;">
			<ul class="record_list_text clear clearfix record_bb record_ft01">
				<li class="re_w60">期次</li>
				<li class="re_w110">收款日</li>
				<li class="re_w110">应收本金(元)</li>
				<li class="re_w100">应收利息(元)</li>
				<li class="re_w210">还款状态</li>
			</ul>
			<c:if test="${not empty repaymentList }">
				<c:forEach items="${repaymentList }" var="vl"   varStatus="foreach">
					<ul class="record_list_text clear clearfix record_bb2 record_ft02">
						<li class="re_w60">${vl.sort_order}/${vl.total}</li>
						<li class="re_w110">${vl.deadline}</li>
						<li class="re_w110">${vl.capital}</li>
						<li class="re_w100">${vl.interest}</li>
						<li class="re_w210">${vl.status_info}</li>
					</ul>
				</c:forEach>
			</c:if>
		</div>
		<!-- end 还款计划 -->
	</div>

</div>