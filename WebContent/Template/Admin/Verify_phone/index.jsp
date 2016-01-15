<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/verify_phone/index')}">手机认证会员</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/verify_phone/index')}">
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
						    
							 手机号码：
							  ${dfForm:input( "mi#user_phone", defaultMap['mi#user_phone'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							
						    注册时间： 
							 <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								是否禁用：&nbsp;
								${dfForm:select( "m#is_ban",isBanSelect, defaultMap['m#is_ban'], dfForm_class,  dfForm_style,dfForm_others)}
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
$(function(){ adminAjaxPageBar();});
	
</script>
