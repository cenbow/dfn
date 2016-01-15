<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/task/index')}">计划任务</a></li>
		<li ><a href="${dfn:U('admin/task/add_menu')}">添加新任务 </a></li>
		<li ><a href="${dfn:U('admin/task/exeaction')}">执守程序操作 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
	
				<div id="include_page" >
					<jsp:include page="index_page.jsp"/>
				</div>
		  </div> 
	</div>
	 
</div>
<script type="text/javascript">
	 
	
</script>
<%@ include file="../Common/footer.jsp" %>