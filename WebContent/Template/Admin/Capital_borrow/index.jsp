<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:SU(_thisUrl_,'index')}">借款还款统计</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:SU(_thisUrl_,'index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
                              借款人： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
                              标号： 
							  ${dfForm:input( "b#id", defaultMap['b#id'], dfForm_class, dfForm_style,dfForm_others)}
                              标名： 
							  ${dfForm:input( "b#borrow_name", defaultMap['b#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
							  借款金额：							 
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 待还金额：							 
		                     ${dfForm:select( "tbj",tbjSignSelect, tbj, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "tmoney", tmoney, dfForm_class,  dfForm_style,dfForm_others)}
							 产品名称：							 
		                     ${dfForm:select( "b#borrow_type",borrowType, defaultMap['b#borrow_type'], dfForm_class, dfForm_style,dfForm_others)}
							 借款期限：							 
		                     ${dfForm:input( "b#borrow_duration", defaultMap['b#borrow_duration'], dfForm_class,  dfForm_style,dfForm_others)}
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