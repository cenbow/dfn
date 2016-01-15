<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:SU(_thisUrl_,'index')}">投标待收统计</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:SU(_thisUrl_,'index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
                              会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
                              会员ID： 
							  ${dfForm:input( "m#id", defaultMap['m#id'], dfForm_class, dfForm_style,dfForm_others)}
                              标名： 
							  ${dfForm:input( "b#borrow_name", defaultMap['b#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
                              标ID： 
							  ${dfForm:input( "b#id", defaultMap['b#id'], dfForm_class, dfForm_style,dfForm_others)}
                              投资状态： 
							 ${dfForm:select( "i#status",istatus, defaultMap['i#status'], dfForm_class, "",dfForm_others)}
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn"id="export" value="导出">
							</span>				</div>
					</div>
				</form>
				<div id="include_page" >
					<jsp:include page="user_page.jsp"/>
				</div>
		  </div> 
	</div>
	 
</div>
<script type="text/javascript">$(function(){ adminAjaxPageBar();});</script>
<%@ include file="../Common/footer.jsp"%>