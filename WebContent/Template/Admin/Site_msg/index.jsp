<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/site_msg/index')}">站内信管理</a></li>
		<li ><a href="${dfn:U('admin/site_msg/menu')}">编辑 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/site_msg/index')}">
				
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 真实姓名：
						     <label>
						     ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							信息标题：
							  ${dfForm:input( "i#title", defaultMap['i#title'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							 是否已读：
							 ${dfForm:select( "i#has_read",readSelect, defaultMap['i#has_read'], dfForm_class, dfForm_style,dfForm_others)}
							
							是否重要通知： 
							${dfForm:select( "i#is_important",importantSelect, defaultMap['i#is_important'], dfForm_class, dfForm_style,dfForm_others)}
							 
							 
							
						  发送时间： 
							 <input  class="input length_2 J_date date" style="width: 90px;"
								autocomplete="off" type="text" name = "startTime" value="${startTime}" />
								-
								<input class="input length_2 J_date date" 
								style="width: 90px;" autocomplete="off" type="text" name="endTime" value="${endTime}" /> 
								
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

