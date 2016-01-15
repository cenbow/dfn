<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ taglib uri="http://www.dfp2p.com" prefix="dfn"%>
<!DOCTYPE html>
<html style="overflow: hidden;" lang="zh_CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<title>${_siteInfo_.siteName}</title>
<meta name="description"
	content="This is page-header (.page-header > h1)">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css"
	rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css"
	rel="stylesheet">
<link
	href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!--[if IE 7]> <link rel="stylesheet" href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<link rel="stylesheet"
	href="${AdminStatics}/simpleboot/themes/flat/simplebootadminindex.min.css?">
<!--[if lte IE 8]> <link rel="stylesheet" href="${AdminStatics}/simpleboot/css/simplebootadminindex-ie.css?" /> 
<![endif]-->


<style>
.navbar .nav_shortcuts .btn {
	margin-top: 5px;
}

/*-----------------导航hack--------------------*/
.nav-list>li.open {
	position: relative;
}

.nav-list>li.open .back {
	display: none;
}

.nav-list>li.open .normal {
	display: inline-block !important;
}

.nav-list>li.open a {
	padding-left: 7px;
}

.nav-list>li .submenu>li>a {
	background: #fff;
}

.nav-list>li .submenu>li a>[class*="fa-"]:first-child {
	left: 20px;
}

.nav-list>li ul.submenu ul.submenu>li a>[class*="fa-"]:first-child {
	left: 30px;
}
/*----------------导航hack--------------------*/
</style>
<script>//全局变量
var GV = {
	HOST:"demo.鼎峰P2P.com",
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script src="${AdminStatics}/assets/js/index.js"></script>

</head>
<body style="min-width: 900px;" screen_capture_injected="true">
	<div style="display: none;" id="loading">
		<i class="loadingicon"></i> <span>正在加载...</span>
	</div>
	<div id="right_tools_wrapper">
		<!--
<span id="right_tools_clearcache" title="清除缓存" onclick="javascript:openapp('/admin/setting/clearcache.html','right_tool_clearcache','清除缓存');">
<i class="fa fa-trash-o right_tool_icon"></i></span>		
-->
		<span id="refresh_wrapper" title="刷新当前页"> <i
			class="fa fa-refresh right_tool_icon"></i>
		</span>
	</div>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a href="" class="brand"> <small> <img	src="${AdminStatics}/images/icon/logo-18.png">${_siteInfo_.siteName}后台	</small></a>
				<div class="pull-left nav_shortcuts">
					<a class="btn btn-small btn-success" href="#" title="分类管理"> <i
						class="fa fa-th"></i>
					</a> <a class="btn btn-small btn-info" href="#" title="文章管理"> <i
						class="fa fa-pencil"></i>
					</a> <a class="btn btn-small btn-warning" href="${_WEB_ROOT_}/" title="前台首页"
						target="_blank"> <i class="fa fa-home"></i>
					</a> <a class="btn btn-small btn-danger" href="#" title="清除缓存"> <i
						class="fa fa-trash-o"></i>
					</a>
				</div>
				<ul class="nav simplewind-nav pull-right">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="${AdminStatics}/images/icon/logo-18.png" alt="${_ADMIN_.user_name}"> <span
							class="user-info"> <small>欢迎,</small>${_ADMIN_.user_name}
						</span> <i class="fa fa-caret-down"></i>
					</a>
						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<!--<li><a href="#"> <i class="fa fa-cog"></i> 站点管理
							</a></li>
							<li><a href="#"> <i class="fa fa-user"></i> 个人资料
							</a></li><li class="divider"></li>-->
							
							<li><a href="${dfn:U('Admin/login/loginOut')}"><i class="fa fa-sign-out"></i>安全退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		
	</div>
	<div class="main-container container-fluid">
		<div class="sidebar" id="sidebar">
			<!-- <div class="sidebar-shortcuts" id="sidebar-shortcuts"> </div> -->
			<div style="height: 860px;" id="nav_wraper">
				<ul class="nav nav-list">

						<c:if test="${not empty menuList }" >
							<c:forEach var ="menu_1" items="${menuList }" varStatus="varStatusName"><c:if test="${fn:contains(hasMenu, menu_1['id']) &&( menu_1['status'] eq '1')}">
							
								<li><a href="javascript:;" class="dropdown-toggle"> <i
										class="fa fa-list-${varStatusName.index+1} normal"></i> <span class="menu-text normal">${menu_1['name'] }</span>
										<b class="arrow fa fa-angle-right normal"></b> <i
										class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
									</a>
									<ul class="submenu">
										<c:if test="${not empty menu_1['son'] }" > 
											<c:forEach var ="menu_2" items="${menu_1['son'] }"><c:if test="${fn:contains(hasMenu, menu_2['id'])&&( menu_1['status'] eq '1')}">
												
													<li><a href="javascript:;" class="dropdown-toggle">
                                                    	<i class="fa fa-caret-right"></i>
                                                        <span class="menu-text">${menu_2['name'] }</span>
														<b class="arrow fa fa-angle-right"></b>
														</a>
														<ul class="submenu">
															<c:if test="${not empty menu_2['son'] }" > 
																<c:forEach var ="menu_3" items="${menu_2['son'] }"><c:if test="${fn:contains(hasMenu, menu_3['id'])&&( menu_3['status'] eq '1')}">
																		<c:set var ="temp" value="${menu_3['app']}/${menu_3['model']}/${menu_3['action'] }" />
																			<li id="_li_${menu_3['id']}0Admin"><a href="javascript:openapp('${dfn:U(temp)}<c:if test="${not empty menu_3['data']}">?${menu_3['data']}</c:if>','${menu_3['id']}0Admin','${menu_3['name'] }');">
																					&nbsp;<i class="fa fa-angle-double-right"></i>
                                                                                    <span class="menu-text">${menu_3['name'] }</span>
																			</a></li>

																	</c:if>
																</c:forEach>
															</c:if>
														</ul>
													</li>							
												</c:if>
											</c:forEach>
										</c:if>
									</ul>
								</li>
								</c:if>
							</c:forEach>
						 </c:if>
				</ul>
			</div>
		</div>
		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<a style="display: none;" id="task-pre" class="task-changebt">←</a>
				<div id="task-content">
					<ul class="macro-component-tab"	id="task-content-inner">
						<li class="macro-component-tabitem noclose" app-id="0"	app-url="/"	app-name="首页"><span class="macro-tabs-item-text">首页</span></li>
					</ul>
					<div style="clear: both;"></div>
				</div>
				<a style="display: none;" id="task-next" class="task-changebt">→</a>
			</div>
			<div style="height: 860px;" class="page-content" id="content">
				<iframe src="${dfn:U('admin/index/mains')}" style="width: 100%; height: 100%;" frameborder="0" id="appiframe-0" name="appiframe-0"
					class="appiframe"></iframe>
			</div>
		</div>
	</div>
	<script src="${AdminStatics}/js/jquery.js"></script>
	<script src="${AdminStatics}/js/bootstrap.js"></script>
	<script>	var b = $("#sidebar").hasClass("menu-min");
	var a = "ontouchend" in document;
	$(".nav-list").on(
			"click",
			function(g) {
				var f = $(g.target).closest("a");
				if (!f || f.length == 0) {
					return
				}
				if (!f.hasClass("dropdown-toggle")) {
					if (b && "click" == "tap"
							&& f.get(0).parentNode.parentNode == this) {
						var h = f.find(".menu-text").get(0);
						if (g.target != h && !$.contains(h, g.target)) {
							return false
						}
					}
					return
				}
				var d = f.next().get(0);
				if (!$(d).is(":visible")) {
					var c = $(d.parentNode).closest("ul");
					if (b && c.hasClass("nav-list")) {
						return
					}
					c.find("> .open > .submenu").each(
							function() {
								if (this != d
										&& !$(this.parentNode).hasClass(
												"active")) {
									$(this).slideUp(150).parent().removeClass(
											"open")
								}
							})
				} else {
				}
				if (b && $(d.parentNode.parentNode).hasClass("nav-list")) {
					return false;
				}
				$(d).slideToggle(150).parent().toggleClass("open");
				return false;
			});
	</script>

</body>
</html>