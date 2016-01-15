<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/attachment/index')}">附件列表</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/attachment/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">上传类型：
							 ${dfForm:select( "a#event_type", event_typeSelect, defaultMap['a#event_type'], dfForm_class, dfForm_style,dfForm_others)}
							
							附件类型： 
							${dfForm:select( "a#extension",extensionSelect, defaultMap['a#extension'], dfForm_class, dfForm_style,dfForm_others)}
							 
							会员名： 
							 ${dfForm:select( "userType",userTypeSelect, userType, dfForm_class, dfForm_style,dfForm_others)}
						   
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class,  dfForm_style,dfForm_others)}
							 说明：
						     <label>
						     ${dfForm:input( "a#info", defaultMap['a#info'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						 
						    上传时间： 
							 <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								
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

