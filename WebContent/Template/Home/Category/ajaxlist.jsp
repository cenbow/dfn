<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<ul>
<c:if test="${not empty artList.list }">
    <c:forEach items="${artList.list }" var="cate">
        <li><span>${cate.add_time}</span><a title="${cate.title}" href="${dfn:U('home/article/ajaxart')}?id=${cate.id}">${cate.title}</a></li>
    </c:forEach>
</c:if>
</ul>  
<div class="ifenye clearfix ajaxpagebar">${artList.pageBar}</div> 
