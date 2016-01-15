<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/credit_assignment/index')}">债权转让列表</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/credit_assignment/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							转让人： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
							借款标题： 
							  ${dfForm:input( "b#borrow_name", defaultMap['b#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
							 转让金额：
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								
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