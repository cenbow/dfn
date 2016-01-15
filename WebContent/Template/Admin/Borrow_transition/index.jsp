<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>

<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${dfn:U('admin/borrow_transition/index')}">流转中的借款</a></li>
		<li ><a href="${dfn:U('admin/borrow_transition/edit')}">编辑流转标 </a></li>
		<li ><a href="${dfn:U('admin/borrow_transition/add')}">添加流转标 </a></li>
	</ul>
	
	<div id = "indexPage" >
		<div class="wrap J_check_wrap" >
				<form class="well form-search" method="get"	action="${dfn:U('admin/borrow_transition/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">
							会员名： 
							  ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}
						   
							 
							 借款标题：
						     <label>
						     ${dfForm:input( "bi#borrow_name", defaultMap['bi#borrow_name'], dfForm_class, dfForm_style,dfForm_others)}
						    </label>
						    
							 借款周期：
							  ${dfForm:input( "b#borrow_duration", defaultMap['b#borrow_duration'], dfForm_class, dfForm_style,dfForm_others)}
							 &nbsp;&nbsp;
							 
							借款金额：
							 
							
		                     ${dfForm:select( "compareSign",compareSignSelect, compareSign, dfForm_class, dfForm_style,dfForm_others)}
		                     ${dfForm:input( "balanceNum", balanceNum, dfForm_class,  dfForm_style,dfForm_others)}
							 <br />
						    提交借款时间： 
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

