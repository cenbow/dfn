<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/article/index')}">文章列表</a></li>
		<li ><a href="${dfn:U('admin/article/add_menu')}">添加文章 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/article/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">文章类型：
							 ${dfForm:select( "a#attr",attrSelect,data['a#attr'], dfForm_class, dfForm_style,dfForm_others)}
							
						
							标题关键词： 
							  ${dfForm:input( "a#title", defaultMap['a#title'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 栏目关键词：
						     <label>
						     ${dfForm:input( "c#cate_name", defaultMap['c#cate_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							发布人：
							  ${dfForm:input( "a#writer", defaultMap['a#writer'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							
						    添加时间： 
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

