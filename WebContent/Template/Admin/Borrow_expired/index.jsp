<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/borrow_expired/index')}">逾期借款列表</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/borrow_expired/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							借款标题：
						     <label>
						     ${dfForm:input( "bi#borrow_name", defaultMap['bi#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							
							 借款总金额：
							 
							
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						   应还款时间： 
							 <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn" id="toExcel" value="导出" onclick="excel('${dfn:U('admin/borrow_expired/toExcel')}');">
							
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
		var m$user_name = $("input[name=m#user_name]").val();
		var bi$borrow_name = $("input[name=bi#borrow_name]").val();
		var compareSign = $("select[name=compareSign]").val();
		var balanceNum = $("input[name=balanceNum]").val();
		
		var startTime = $("input[name=startTime]").val();
		var endTime = $("input[name=endTime]").val();
		
		url = (url+"?m$user_name="+	m$user_name	+"&bi$borrow_name="+bi$borrow_name
				+"&compareSign="+compareSign
				+"&balanceNum="+balanceNum+"&startTime="+startTime+"&endTime="+endTime);
		window.open(url);
	}
</script>
