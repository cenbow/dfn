<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>


<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/withdraw/index')}">提现记录</a></li>
		
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="post"	action="${dfn:U('admin/withdraw/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">会员名：
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
							
							真实姓名： 
							 ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
							 
							处理人： 
							  ${dfForm:input( "r#deal_user", defaultMap['r#deal_user'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							提现状态：
						     <label>
						     ${dfForm:select( "r#withdraw_status", statusSelect, defaultMap['r#withdraw_status'],dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							
							提现金额：
							 
							
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						    提现时间： 
							  <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />
								
								<input type="submit" class="btn" id="searchButton" value="搜索"> 
								&nbsp;
								<input type="button" class="btn" id="toExcel" value="导出" onclick="excel('${dfn:U('admin/withdraw/toExcel')}');">
							
							</span>				</div>
					</div>
				</form>
				<div id="include_page" >
					<jsp:include page="list_page.jsp"/>
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
	
	function excel(url){
		var m$user_name = $("input[name=m#user_name]").val();
		var mi$real_name = $("input[name=mi#real_name]").val();
		var r$deal_user = $("input[name=r#deal_user]").val();
		var r$withdraw_status = $("select[name=r#withdraw_status]").val();
		
		var compareSign = $("select[name=compareSign]").val();
		var balanceNum = $("input[name=balanceNum]").val();
		var startTime = $("input[name=startTime]").val();
		var endTime = $("input[name=endTime]").val();
		
		url = (url+"?m$user_name="+	m$user_name	
				+"&mi$real_name="+mi$real_name
				+"&r$deal_user="+r$deal_user
				+"&r$withdraw_status="+r$withdraw_status
				+"&compareSign="+compareSign
				+"&balanceNum="+balanceNum+"&startTime="+startTime+"&endTime="+endTime);
		window.open(url);
	}
</script>
<%@ include file="../Common/footer.jsp" %>