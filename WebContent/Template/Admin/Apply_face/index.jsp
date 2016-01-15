<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/apply_face/index')}">现场认证申请</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/apply_face/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">是否VIP：
							 ${dfForm:select( "isVip",vipSelect, isVip, dfForm_class, dfForm_style,dfForm_others)}
							
						
							 
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 真实姓名：
						     <label>
						     ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							认证状态：
							 ${dfForm:select( "v#apply_status",statusSelect, defaultMap['v#apply_status'], dfForm_class, dfForm_style,dfForm_others)}
							 
							
						    注册时间： 
							<input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
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
	$("#page_bar a").live('click',function() {
		var url = $(this).attr("href");
		$.get(url, function(data) {
			$("#include_page").html(data);
		});
		return false;
	});
</script>
