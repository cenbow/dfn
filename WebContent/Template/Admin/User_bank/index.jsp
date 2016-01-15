<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>


<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/user_bank/index')}">会员银行卡信息</a></li>

		</ul>

		<div id="indexPage">
			<div class="wrap J_check_wrap">
				<form class="well form-search" method="get"
					action="${dfn:U('admin/user_bank/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20"> 开户行： ${dfForm:input( "mb#bank_name", defaultMap['mb#bank_name'], dfForm_class, dfForm_style,dfForm_others)}

								会员名： ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}


								真实姓名： <label> ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
												</label>
							
								 所属客服： ${dfForm:input( "m#customer_name", defaultMap['m#customer_name'], dfForm_class, dfForm_style,dfForm_others)}
								
								&nbsp;&nbsp; 添加时间： <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />

								<input type="submit" class="btn" id="searchButton" value="搜索">
								&nbsp; <input type="button" class="btn" id="toExcel" value="导出" onclick="excel('${dfn:U('admin/user_bank/toExcel')}');">
							
							</span>
						</div>
					</div>
				</form>
				<div id="include_page">
					<jsp:include page="bank_page.jsp" />
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
$(function(){ adminAjaxPageBar();});

function excel(url){
	var m$user_name = $("input[name=m#user_name]").val();
	var mb$bank_name = $("input[name=mb#bank_name]").val();
	var mi$real_name = $("input[name=mi#real_name]").val();
	var m$customer_name = $("input[name=m#customer_name]").val();
	 
	var startTime = $("input[name=startTime]").val();
	var endTime = $("input[name=endTime]").val();
	
	url = (url+"?m$user_name="+	m$user_name	+"&mb$bank_name="+mb$bank_name
			+"&mi$real_name="+mi$real_name
			+"&m$customer_name="+m$customer_name
			+"&startTime="+startTime+"&endTime="+endTime);
	window.open(url);
}
</script>

	