<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/user_refer_log/index')}">推荐统计</a></li>

	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/user_refer_log/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">会员名： 
							  ${dfForm:input( "rw#user_name", defaultMap['rw#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							推荐人数：
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
								<input type="submit" class="btn" id="searchButton" value="搜索"> 
								
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
	 
	
</script>
<%@ include file="../Common/footer.jsp" %>