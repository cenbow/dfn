<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/user/index')}">会员列表</a></li>
		<li ><a href="${dfn:U('admin/user/user_add')}">添加会员 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/user/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">是否VIP：
							 ${dfForm:select( "isVip",vipSelect, isVip, dfForm_class, dfForm_style,dfForm_others)}
							
							会员类型： 
							${dfForm:select( "m#user_type",memberTypeSelect, defaultMap['m#user_type'], dfForm_class, dfForm_style,dfForm_others)}
							 
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
							手机号： 
							  ${dfForm:input( "m#user_phone", defaultMap['m#user_phone'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 真实姓名：
						     <label>
						     ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							 所属客服：
							  ${dfForm:input( "m#customer_name", defaultMap['m#customer_name'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							 余额：
							 
							 ${dfForm:select( "balanceType",balanceTypeSelect, defaultMap['balanceType'], dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:select( "compareSign",compareSignSelect, defaultMap['compareSign'], dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", defaultMap['balanceNum'], dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						    注册时间： 
							 <input class="input Wdate" style="width: 100px;" onFocus="WdatePicker()" type="text"	name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker()" name="endTime" value="${endTime}" />
								是否禁用：&nbsp;${dfForm:select( "m#is_ban",isBanSelect, defaultMap['m#is_ban'], dfForm_class,  dfForm_style,dfForm_others)}
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