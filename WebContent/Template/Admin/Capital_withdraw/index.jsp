<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/capital_withdraw/index')}">会员提现统计</a></li>
		<li ><a href="${dfn:U('admin/capital_withdraw/export')}">导出excel</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/capital_withdraw/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
							提现总金额：
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							
							提现次数：
		                     ${dfForm:select( "cbj",txSignSelect, cbj, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "totalTimes", totalTimes, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						
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
		var m$user_name = $("input[name=m#user_name]").val();
		var compareSign = $("select[name=compareSign]").val();
		var balanceNum = $("input[name=balanceNum]").val();
		var totalTimes = $("input[name=totalTimes]").val();
		var cbj = $("select[name=cbj]").val();
		
		url = (url+"?m$user_name="+	m$user_name	+"&compareSign="+compareSign
				+"&balanceNum="+balanceNum+"&totalTimes="+totalTimes+"&cbj="+cbj);
		window.open(url);
	} 
</script>
