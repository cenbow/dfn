<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>

<div class="seccon_record mt20">
	<div class="seccon_tbox">
        <c:if test="${not empty investorList.data }">
		<div class="record_box">
			<ul class="record_list_text clear clearfix record_bb record_ft01">
				<li class="re_w60">序号</li>
				<li class="re_w110">投资人</li>
				<li class="re_w110">投资金额</li>
				<li class="re_w210">投资时间</li>
				<li class="re_w60">投资方式</li>
			</ul>

				<c:forEach items="${investorList.data }" var="user">
					<ul class="record_list_text clear clearfix record_bb2 record_ft02">
						<li class="re_w60">${user.sn}</li>
						<li class="re_w110">${dfn:hideCard(user.user_name,3,10)}</li>
						<li class="re_w110">${user.investor_capital}元</li>
						<li class="re_w210">${user.add_time}</li>
						<li class="re_w60"><c:choose>
								<c:when test="${user.is_auto=='1'}">自动</c:when>
								<c:when test="${user.is_auto=='0'}">手动</c:when>
							</c:choose></li>
					</ul>
				</c:forEach>
					<!-- pagelink start -->
					<div class="sec_pagelink">
						<div class="fr">${investorList.pageBar}</div>
					</div>
					<!-- pagelink end  -->
		</div>
        </c:if>
        <c:if test="${empty investorList.data }">
        暂无投资记录
        </c:if>
		<!-- end 投资记录 -->
	</div>
</div>