<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/logs/loginlog')}">后台登陆日志</a></li>
		</ul>

		<div id="indexPage">
			<div class="wrap J_check_wrap">
				<form class="well form-search" method="get"		action="${dfn:U('admin/logs/loginlog')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20">搜索： ${dfForm:input( "l#info", defaultMap['l#info'], dfForm_class, dfForm_style,dfForm_others)}



								用户名： <label> ${dfForm:input( "l#username", defaultMap['l#username'], dfForm_class, dfForm_style,dfForm_others)}
							</label> IP: ${dfForm:input( "l#loginip", defaultMap['l#loginip'], dfForm_class,  dfForm_style,dfForm_others)}
								时间： <input class="input length_2 J_date date"
								style="width: 90px;" autocomplete="off" type="text"
								name="startTime" value="${startTime}" /> - <input
								class="input length_2 J_date date" style="width: 90px;"
								autocomplete="off" type="text" name="endTime" value="${endTime}" />

								<input type="submit" class="btn" id="searchButton" value="搜索">
								<input type="submit" class="btn" id="searchButton"
								value="删除一月前数据">

							</span>
						</div>
					</div>
				</form>
				<div id="include_page">
					<jsp:include page="loginlog_page.jsp" />
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$("#page_bar a").live("click", function() {
			var url = $(this).attr("href");
			$.get(url, function(data) {
				$("#include_page").html(data);
			});
			return false;
		});
	</script>
<%@ include file="../Common/footer.jsp"%>