<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<div class="sec_pro_list_l fl mr20">

	 <c:if test="${not empty transferList.data }">
		<c:forEach items="${transferList.data }" var="bo"> 
			<div class="sec_pro_list_one">
				<h2 class="pro_list_h2">${bo.borrow_name}</h2>
				<ul class="pro_list_ul">
					<li class="w245"><span>年化收益：<strong>${bo.borrow_interest_rate}%</strong></span>
						<span>转让金额：${bo.credit_money}元</span></li>
					<li class="w150"><span>借款周期：<strong>${bo.borrow_duration}</strong>${bo.duration_unit}
					</span> <span>起投金额：${bo.borrow_min}元</span></li>
					<li class="presswper zw100"><span
						class="ui-progressbar-mid ui-progressbar-mid-${bo.progress}" style="line-height: 40px;">${bo.progress}%</span></li>
					<li class="zw160 "><span>可投金额：${bo.need}元</span>
                        <c:choose>
                        	<c:when test="${bo.status == 2}">
                                <a class="invest_btn" href="${bo.url}">已转让</a>
                            </c:when>
                        	<c:when test="${bo.status == 1}">
                                <a href="${bo.url}" class="invest_btn">转让中</a>
                            </c:when>
							<c:otherwise>
							<a class="invest_btn" href="javascript:;">已结束</a>
                            </c:otherwise>
                         </c:choose>
                    
                    </li>
				</ul>
			</div>
		 </c:forEach>
	</c:if> 

	<!-- pagelink start -->
	<div class="sec_pagelink">
		<div class="fr">${transferList.pageBar}</div>
	</div>
	<!-- pagelink end  -->
</div>