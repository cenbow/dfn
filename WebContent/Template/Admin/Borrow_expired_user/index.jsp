<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/borrow_expired_user/index')}">逾期借款会员</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/borrow_expired_user/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
				
								
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn" id="toExcel" value="导出" onclick="excel('${dfn:U('admin/borrow_expired_user/toExcel')}');">
							
							</span>				</div>
					</div>
				</form>
				<div id="include_page" >
					<jsp:include page="user_page.jsp"/>
				</div>
		  </div> 
	</div>
	 
</div>
<script type="text/javascript">
	$(function(){ adminAjaxPageBar();});
	
	function excel(url){
		var m$user_name = $("input[name=m#user_name]").val();
		 
		
		url = url+"?m$user_name="+	m$user_name	 ;
		window.open(url);
	}
</script>
