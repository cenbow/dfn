<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/apply_limit/index')}">贷款额度申请</a></li>	
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/apply_limit/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">所选客服：
							 ${dfForm:select( "user_name",customerSelect, kfid, dfForm_class, dfForm_style,dfForm_others)}
							审核状态：
							 ${dfForm:select( "v#apply_type",apply_limit_typeSelect, defaultMap['v#apply_type'], dfForm_class, dfForm_style,dfForm_others)}
							
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							
						     审核状态： 
							${dfForm:select( "v#apply_status",statusSelect, defaultMap['v#apply_status'], dfForm_class, dfForm_style,dfForm_others)}
							 
							
						    注册时间： 
							 <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								<input type="submit" id="searchButton" class="btn" value="搜索"> 
								
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

