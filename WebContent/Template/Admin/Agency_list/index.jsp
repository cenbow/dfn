<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/agency_list/index')}">代理商列表</a></li>
			<li><a href="${dfn:U('admin/agency_list/add_menu')}">添加代理商
			</a></li>
		</ul>

		<div id="indexPage">
			<div class="wrap J_check_wrap">
				<form class="well form-search" method="get"
					action="${dfn:U('admin/agency_list/index')}">
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20"> 最后登陆时间： <input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({lang:'zh-cn'})" type="text"
								name="startTime" value="${startTime}" /> - <input class="input Wdate" 
								style="width: 100px;" type="text" onFocus="WdatePicker({lang:'zh-cn'})" name="endTime" value="${endTime}" />




								所属角色： ${dfForm:select( "au#u_group_id",roleSelect, defaultMap['au#u_group_id'], dfForm_class, dfForm_style,dfForm_others)}

								禁用： ${dfForm:select( "au#is_ban",isBanSelect, defaultMap['au#is_ban'], dfForm_class, dfForm_style,dfForm_others)}

								用户名： ${dfForm:input( "au#user_name", defaultMap['au#user_name'], dfForm_class, dfForm_style,dfForm_others)}


								真实姓名： <label> ${dfForm:input( "au#real_name", defaultMap['au#real_name'], dfForm_class, dfForm_style,dfForm_others)}
							</label> <input type="submit" class="btn" id="searchButton" value="搜索">
								&nbsp;

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
		$("#page_bar a").live("click", function() {
			var url = $(this).attr("href");
			$.get(url, function(data) {
				$("#include_page").html(data);
			});
			return false;
		});
	</script>