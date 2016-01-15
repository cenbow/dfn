<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/capital_log/index')}">会员资金变动记录</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/capital_log/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							
							
							交易类型： 
							${dfForm:select( "l#type",typeSelect, defaultMap['l#type'], dfForm_class, dfForm_style,dfForm_others)}
							 
							交易对方： 
							  ${dfForm:input( "l#target_uname", defaultMap['l#target_uname'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 变动原因：
						     <label>
						     ${dfForm:input( "l#info", defaultMap['l#info'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							
							影响金额：
							 
							
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						   交易时间： 
							  <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
								<input type="submit"class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn" id="toExcel" value="导出" onClick="excel('${dfn:U('admin/capital_log/toExcel')}');">
							
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
	$(function(){ $(function(){ adminAjaxPageBar();});});
	
	function excel(url){
		var m$user_name = $("input[name=m#user_name]").val();
		var l$type = $("select[name=l#type]").val();
		var l$target_uname = $("input[name=l#target_uname]").val();
		var l$info = $("input[name=l#info]").val();
		var compareSign = $("select[name=compareSign]").val();
		var balanceNum = $("input[name=balanceNum]").val();
		var startTime = $("input[name=startTime]").val();
		var endTime = $("input[name=endTime]").val();
		
		url = (url+"?m$user_name="+	m$user_name	+"&l$type="+l$type
				+"&l$info="+l$info
				+"&l$target_uname="+l$target_uname
				+"&compareSign="+compareSign
				+"&balanceNum="+balanceNum+"&startTime="+startTime+"&endTime="+endTime);
		window.open(url);
	}
</script>
<%@ include file="../Common/footer.jsp"%>