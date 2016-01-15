<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>


<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/user_upload/index')}">会员上传资料管理</a></li>
			</a></li>
		</ul>

		<div id="indexPage">
			<div class="wrap J_check_wrap">
				<form class="well form-search" method="get"
					action="${dfn:U('admin/user_upload/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">所选客服： ${dfForm:select( "m#customer_id",customerMap, defaultMap['m#customer_id'], dfForm_class, dfForm_style,dfForm_others)}
								会员名： ${dfForm:input( "m#user_name", defaultMap['m#user_name'], dfForm_class, dfForm_style,dfForm_others)}


								真实姓名： <label> ${dfForm:input( "mi#real_name", defaultMap['mi#real_name'], dfForm_class, dfForm_style,dfForm_others)}
							</label> 
							资料类型： ${dfForm:select( "u#type",egroupMap, defaultMap['u#type'], dfForm_class, dfForm_style,dfForm_others)}

								审核状态： ${dfForm:select( "u#status",isVerifySelect, defaultMap['u#status'], dfForm_class, dfForm_style,dfForm_others)}
								上传时间：  <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />

								<input type="submit" class="btn" id="searchButton" value="搜索">
							</span>
						</div>
					</div>
				</form>
				<div id="include_page">
					<jsp:include page="user_page.jsp" />
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		
	</script>
	<%@ include file="../Common/footer.jsp"%>