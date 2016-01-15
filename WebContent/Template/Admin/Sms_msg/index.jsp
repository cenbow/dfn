<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/sms_msg/index')}">短信收发记录</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/sms_msg/index')}">
				
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							接收人： 
							  ${dfForm:input( "s#receiver", defaultMap['s#receiver'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 信息内容：
						     <label>
						     ${dfForm:input( "s#msg", defaultMap['s#msg'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							
						     发送时间： 
							 <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
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

