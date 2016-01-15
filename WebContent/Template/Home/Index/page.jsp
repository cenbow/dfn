<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
			<div class="starpro_list_box mt10">
				<div class="list_one">
					<ul class="list_one_tit" style="border-top:0px">
						<li class="w350">借款项目</li>
						<li class="w125">年化收益</li>
						<li class="w200">借款金额</li>
						<li class="w100">借款周期</li>
						<li class="w125">项目进度</li>
						<li class="w125"></li>
					</ul>
                         <c:if test="${not empty borrowList.data }">
                            <c:forEach items="${borrowList.data }" var="bo">
                     
                            <ul class="list_one_tit2 clear">
                                <li class="w350 list_one_ft01"><img style="margin-top:10px;" src="${HomeStatics}/images/borrowico/${bo.borrow_type}.png"/><a href="${bo.url}">${bo.borrow_name}</a></li>
                                <li class="w125"><strong>${bo.borrow_interest_rate}%</strong></li>
                                <li class="w200 litabmoney">${bo.borrow_money}元</li>
                                <li class="w100 litabmoney">${bo.borrow_duration}${bo.duration_unit}</li>
                                <li class="w125"><span
                                    class="ui-progressbar-mid ui-progressbar-mid-${bo.progress}">${bo.progress}%</span></li>
                                <li class="w125">
                        <c:choose>
                        	<c:when test="${bo.borrow_status == 6}">
                                <a class="starpro_btn2" href="${bo.url}">还款中</a>
                            </c:when>
                        	<c:when test="${bo.borrow_status == 4}">
                                <a class="starpro_btn2" href="${bo.url}">复审中</a>
                            </c:when>
                        	<c:when test="${bo.borrow_status == 7}">
                                <a class="starpro_btn2" href="${bo.url}">已完成</a>
                            </c:when>
                        	<c:when test="${bo.collect_time < currentTime}">
                                <a class="starpro_btn2" href="${bo.url}">已结束</a>
                            </c:when>
                        	<c:when test="${bo.borrow_status == 6}">
                                <a class="starpro_btn2" href="${bo.url}">还款中</a>
                            </c:when>
							<c:otherwise>
							<a href="${bo.url}" class="starpro_btn2">立即投资</a>
                            </c:otherwise>
                         </c:choose>
                         </li>
                            </ul>
                         </c:forEach>
                    </c:if> 
				</div>

				 <p class="list_more">
					<a href="${dfn:U('home/invest/index')}">查看更多理财投资项目</a>
				</p> 
			</div>
