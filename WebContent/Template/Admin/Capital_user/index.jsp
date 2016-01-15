<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/capital_user/index')}">会员充值统计</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/capital_user/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
							余额：							 
							 ${dfForm:select( "balanceType",balanceTypeSelect, balanceType, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							
							提现总金额：							 
							
		                     ${dfForm:select( "tbj",compareSignSelect, tbj, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "tmoney", tmoney, dfForm_class,  dfForm_style,dfForm_others)}
							
							充值总金额：							 
							
		                     ${dfForm:select( "cbj",compareSignSelect, cbj, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "cmoney", cmoney, dfForm_class,  dfForm_style,dfForm_others)}
							
						
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
<script type="text/javascript">$(function(){ adminAjaxPageBar();});</script>
<script type="text/javascript">
	function excel(url){
		var m$user_name = $("input[name=m#user_name]").val();
		var mi$real_name = $("input[name=mi#real_name]").val();
		var cmoney = $("input[name=cmoney]").val();
		var cbj = $("select[name=cbj]").val();
		var tmoney = $("input[name=tmoney]").val();
		var tbj = $("select[name=tbj]").val();
		
		var compareSign = $("select[name=compareSign]").val();
		var balanceNum = $("input[name=balanceNum]").val();
		var balanceType = $("input[name=balanceType]").val();
		
		url = (url+"?m$user_name="+	m$user_name	
				+"&cmoney="+cmoney
				+"&cbj="+cbj
				+"&tmoney="+tmoney
				+"&tbj="+tbj
				+"&compareSign="+compareSign
				+"&balanceNum="+balanceNum
				+"&balanceType="+balanceType
				);
		window.open(url);
	}
</script>
<%@ include file="../Common/footer.jsp"%>