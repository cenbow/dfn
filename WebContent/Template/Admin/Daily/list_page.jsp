<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table class="table table-hover">
			<thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>产品总金额</th>
                <th>已募集金额</th>
                <th>投资起点</th>
                <th>年利率</th>
                <th>最低持有时间</th>
                <th>产品到期时间</th>
                <th>操作</th>
              </tr>
			</thead>
			<tbody>
				<c:if test="${not empty list.data }">
					<c:forEach items="${list.data }" var="vo">

                      <tr overstyle='on' id="list_${vo.id}">
                        <td>${vo.id}</td>
                        <td title="${vo.product_name}">${vo.product_name}</td>
                        <td>${vo.product_money}</td>
                        <td>${vo.has_invest_money}</td>
                        <td>${vo.invest_min}</td>
                        <td>${vo.expect_interest_rate}%</td>
                        <td>${vo.invest_min_duration}天</td>
                        <td>${dfn:date(vo.end_count_time,"yyyy-MM-dd HH:mm")}</td>
                        <td>
                            <c:choose>
                                <c:when test="${vo.status==0}"><a href="${dfn:SU(_thisUrl_,'edit')}?id=${vo.id}">修改</a></c:when>
                                <c:when test="${vo.status==1}">已完成</c:when>
                                <c:when test="${vo.status==2}">已结束</c:when>
                            </c:choose>
                        </td>
                      </tr>

					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="pagination ajaxpagebar" data="include_page" id="page_bar">${list.pageBar}</div>
	</div>
</form>
