<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/user_info/index')}">会员资料填写情况</a></li>		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/user_info/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							 
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 真实姓名：
						     <label>
						     ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							 所属客服：
							  ${dfForm:input( "m#customer_name", defaultMap['m#customer_name'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							
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
<script type="text/javascript">$(function(){ adminAjaxPageBar();});</script>

