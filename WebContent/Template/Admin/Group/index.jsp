<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/group/index')}">管理员角色</a></li>
		<li ><a href="${dfn:U('admin/group/add')}">添加角色 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<div id="include_page" >
					<jsp:include page="list_page.jsp"/>
				</div>
		  </div> 
	</div>
	 
</div>
<script type="text/javascript">$(function(){ adminAjaxPageBar();});</script>
<%@ include file="../Common/footer.jsp"%>