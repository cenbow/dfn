<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:SU(_thisUrl_,'index')}">会员待收明细</a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:SU(_thisUrl_,'index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
                              投资人： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
                              标号： 
							  ${dfForm:input( "b#id", defaultMap['b#id'], dfForm_class, dfForm_style,dfForm_others)}
                              标名： 
							  ${dfForm:input( "b#borrow_name", defaultMap['b#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
							 产品名称：							 
		                     ${dfForm:select( "b#borrow_type",borrowType, defaultMap['b#borrow_type'], dfForm_class, dfForm_style,dfForm_others)}
							 期数：							 
		                     ${dfForm:input( "b#borrow_duration", defaultMap['b#borrow_duration'], dfForm_class,  dfForm_style,dfForm_others)}
                              回款状态： 
							 ${dfForm:select( "d#status",istatus, defaultMap['d#status'], dfForm_class, "",dfForm_others)}
						    应收时间： 
							 <input class="input Wdate" style="width: 100px;" onFocus="WdatePicker()" type="text"	name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker()" name="endTime" value="${endTime}" />
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
<script type="text/javascript">$(function(){ adminAjaxPageBar();});
	function excel(url){
		var parm='';
		$(".form-search input,.form-search select").each(function(index, element) {
            var name=$(this).attr("name");
			var value=$(this).val();
			if(typeof name!='undefined'){
				name=encodeURIComponent(name);
				value=encodeURIComponent(value);
				parm+=(parm=="")?(name+"="+value):("&"+name+"="+value);
			}
        });
		
		url = (url+"?"+parm);
		window.open(url);
	}
</script>
<%@ include file="../Common/footer.jsp"%>