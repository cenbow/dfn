<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/Xcode/index')}">列表</a></li>
		<li ><a href="${dfn:U('admin/Xcode/xcode_add')}">添加 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/Xcode/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">是否有效：
							 ${dfForm:select( "x#status",statusSelect, defaultMap['x#status'], dfForm_class, dfForm_style,dfForm_others)}
							 
                             推广码：${dfForm:input( "x#xcode", defaultMap['x#xcode'], dfForm_class, dfForm_style,dfForm_others)}
							 
							 
                             推广员：${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn" id="toExcel" value="导出" onClick="excel('${dfn:SU(_thisUrl_,'toExcel')}');">
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
		var x$status = $("input[name=x#status]").val();
		
		url = (url+"?x$status="+x$status);
		window.open(url);
	}
</script>
<%@ include file="../Common/footer.jsp"%>