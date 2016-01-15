<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<form method="post" action="${dfn:U('admin/nav/doEdit_sort_order')}">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/nav/index')}">前台导航设置</a></li>
		</ul>
		
		<div id = "indexPage" >
			<div class="wrap J_check_wrap" >
		
					<div id="include_page" >
						<jsp:include page="index_page.jsp"/>
					</div>
			  </div> 
		</div>
		 <div class="form-actions">
			<button  type="submit"
			class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
			&nbsp;&nbsp;<a class="btn" href="javascript:;" onClick="window.history.back(-1);return false;">返回</a>
		</div>
	</form>
</div>
<script type="text/javascript">$(function(){ adminAjaxPageBar();});</script>
<%@ include file="../Common/footer.jsp" %>