<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<meta name="description" content="This is page-header (.page-header > h1)">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css"	rel="stylesheet">
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--[if IE 7]> <link rel="stylesheet" href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<link rel="stylesheet"	href="${AdminStatics}/simpleboot/themes/flat/simplebootadminindex.min.css?">
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
	ReferUrl:"",
	HOST:"demo.鼎峰P2P.com",
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
function showUrl(){
	alert(GV.ReferUrl);	
}
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
					</a> <a class="btn btn-small btn-warning" href="${_WEB_ROOT_}" title="前台首页"
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
					<li style="display:none"><a href="#" class="dropdown-toggle"> <i
							class="fa fa-cogs normal"></i> <span class="menu-text normal">设置</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">个人信息</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/install/userinfo")}','111Admin','修改信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">修改信息</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/install/userinfo")}','113Admin','修改密码');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">修改密码</span>
									</a></li>
								</ul></li>
							<li><a href="javascript:openapp('${dfn:U("admin/install/site")}','115Admin','网站信息');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">网站信息</span>
							</a></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">邮箱配置</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/install/maileractive")}','129Admin','邮件模板');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">邮件模板</span>
									</a></li>
								</ul></li>
						</ul></li>
					<li style="display:none"><a href="#" class="dropdown-toggle"> <i
							class="fa fa-cogs normal"></i> <span class="menu-text normal">常用</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">						
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/public_common")}','115Admin','常用菜单');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">常用菜单</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/management_adminadd")}','14000changyong','添加管理员');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">添加管理员</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/task_exeaction")}','179000changyong','执守程序操作');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">执守程序操作</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/task_add")}','176000changyong','添加新任务');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">添加新任务</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/task_index")}','175000changyong','计划任务');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">计划任务</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/nav_add")}','142000changyong','添加导航');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">添加导航</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/nav_index")}','141000changyong','前台导航设置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">前台导航设置</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/menu_add")}','8000changyong','添加子菜单');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">添加子菜单</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/menu_index")}','4000changyong','后台菜单管理');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">后台菜单管理</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_sms")}','150000changyong','手机参数配置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">手机参数配置</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_borrow")}','134000changyong','借款相关参数配置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">借款相关参数配置</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_changegroup")}','135000changyong','修改后台入口');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">修改后台入口</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_attach")}','6000changyong','附件设置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">附件设置</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_email")}','5000changyong','邮件配置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">邮件配置</span>
							</a></li>
							<li><a href="javascript:openapp('${dfn:U("admin/commonly/config_index")}','3000changyong','站点配置');">
									<i class="fa fa-caret-right"></i> <span class="menu-text">站点配置</span>
							</a></li>							
						</ul></li>	
					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-group normal"></i> <span class="menu-text normal">会员管理</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">会员管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/user/index")}','50Admin','会员列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/user_info/index")}','64Admin','会员资料填写');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员资料填写情况</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/user_bank/index")}','225Admin','会员银行卡信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员银行卡信息</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">认证及申请管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/verify_phone/index")}','55Admin','手机认证会员');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">手机认证会员</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/apply_video/index")}','56Admin','视频认证申请');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">视频认证申请</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/apply_face/index")}','57Admin','现场认证申请');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">现场认证申请</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/apply_vip/index")}','58Admin','VIP申请');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">VIP申请</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/apply_real/index")}','59Admin','实名认证申请');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">实名认证申请</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/apply_limit/index")}','60Admin','贷款额度申请');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">贷款额度申请</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">其他</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/user_upload/index")}','62Admin','会员上传资料管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员上传资料管理</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/user_upload/egroup")}','71Admin','会员资料类型管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员资料类型管理</span>
									</a></li>
									
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">会员积分</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/user_credit/index")}','207Admin','查看会员积分明细');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">查看会员积分明细</span>
									</a></li>							
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">会员推荐管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/user_refer/index")}','219Admin','会员推荐情况');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员推荐情况</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/user_refer_log/index")}','220Admin','推荐统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">推荐统计</span>
									</a></li>
								</ul></li>
						</ul></li>

					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-group normal"></i> <span class="menu-text normal">网站管理</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">系统设置</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/nav/index")}','141Admin','前台导航设置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">前台导航设置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/task/index")}','175Admin','计划任务');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">计划任务</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/config/index")}','3Admin','站点配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">站点配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/menu/index")}','4Admin','后台菜单管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">后台菜单管理</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">管理员设置</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/management/index")}','15Admin','管理员列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">管理员列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/group/index")}','16Admin','管理员角色');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">管理员角色</span>
									</a></li>
								</ul></li>
							 <li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">代理商管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/agency_menu/index")}','260Admin','代理商菜单');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">代理商菜单</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/agency_list/index")}','258Admin','代理商列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">代理商列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/agency_group/index")}','259Admin','代理商角色');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">代理商角色</span>
									</a></li>
								</ul></li>	
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">附件管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/attachment/index")}','138Admin','附件列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">附件列表</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">日志管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/logs/loginlog")}','11Admin','后台登陆日志');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">后台登陆日志</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/logs/index")}','12Admin','后台操作日志');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">后台操作日志</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">数据库管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/db/index")}','191Admin','数据库列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">数据库列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/db/baklist")}','194Admin','备份管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">备份管理</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">地区管理</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/area/index")}','34Admin','地区列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">地区列表</span>
									</a></li>
								</ul></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-list normal"></i> <span class="menu-text normal">内容管理</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">文章及分类管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/article/index")}','24Admin','文章列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">文章列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/article_category/index")}','28Admin','文章分类');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">文章分类</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">广告内容管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/ad/index")}','186Admin','广告管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">广告管理</span>
									</a></li>
								</ul></li>
						</ul></li>

					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-group normal"></i> <span class="menu-text normal">资金统计</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">会员资金统计</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/capital_log/index")}','88Admin','会员资金变动记录');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员资金变动记录</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/reward_log/index")}','242Admin','会员奖金变动记录');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员奖金变动记录</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/capital_withdraw/index")}','83Admin','会员提现统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员提现统计</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/capital_recharge/index")}','82Admin','会员充值统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员充值统计</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/capital_user/index")}','79Admin','会员账户情况');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员账户情况</span>
									</a></li>
								</ul></li>
					<%-- 		<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">网站资金统计</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/capital_all/index")}','85Admin','网站资金统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">网站资金统计</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">客服服务统计</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/capital_kf/index")}','87Admin','客服服务统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">客服服务统计</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">投资排名统计</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/capital_rank/index")}','90Admin','客服排名统计');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">客投资排名统计</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i><span class="menu-text normal">余额宝</span><b
									class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/capital/balance")}','236Admin','会员余额宝明细');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员余额宝明细</span>
									</a></li>
								</ul></li> --%>
						</ul></li>
						
						<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-list normal"></i> <span class="menu-text normal">参数配置</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">常用参数配置</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<%-- <li><a href="javascript:openapp('${dfn:U("admin/cache_login/index")}','93Admin','第三方登陆配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">第三方登陆配置</span>
									</a></li> --%>
									<li><a href="javascript:openapp('${dfn:U("admin/cache_pay/index")}','94Admin','支付宝接口配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">支付宝接口配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/cache_level/index")}','95Admin','会员级别配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">会员级别配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/cache_bank/index")}','151Admin','提现银行设置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">提现银行设置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/Xcode/index")}','301Admin','体验码');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">体验码</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">贷款相关参数</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/cache_borrow/index")}','123Admin','费用设置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">费用设置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/cache_contract/index")}','204Admin','合同相关参数');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">合同相关参数</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">各类通知信息设置</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/sms_msg/index")}','216Admin','短信收发记录');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">短信收发记录</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/msg_email/index")}','148Admin','邮件通知信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">邮件通知信息</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/msg_phone/index")}','149Admin','手机通知信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">手机通知信息</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/msg_site/index")}','168Admin','站内信通知信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">站内信通知信息</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/cache_msgset/index")}','167Admin','信息通知设置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">信息通知设置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/site_msg/index")}','158Admin','站内信管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">站内信管理</span>
									</a></li>
								</ul></li>
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">自定义借款标参数</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_type/index")}?type=normal','209Admin','信用标配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">信用标配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_type/index")}?type=mortgage','210Admin','净值标配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">抵押标配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_type/index")}?type=vouch','211Admin','担保标配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">担保标配置</span>
									</a></li>
									 <li><a href="javascript:openapp('${dfn:U("admin/borrow_type/index")}?type=second','212Admin','秒还标配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">秒还标配置</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_type/index")}?type=net','213Admin','净值标配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">净值标配置</span>
									</a></li> 
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_type/type")}','214Admin','标种配置');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">标种配置</span>
									</a></li> 
								</ul></li>		
						</ul></li>
						
					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-list normal"></i> <span class="menu-text normal">充值提现</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">充值提现</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/recharge/index")}','99Admin','充值记录');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">充值记录</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/withdraw/index")}','100Admin','提现记录');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">提现记录</span>
									</a></li>
								</ul></li>							
						</ul></li>
					<!--<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-list normal"></i> <span class="menu-text normal">安全中心</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">安全中心</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/security/filetest")}','171Admin','安全夹全线检测');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">安全夹全线检测</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/security/filescan")}','172Admin','可疑文件扫描');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">可疑文件扫描</span>
									</a></li>
								</ul></li>							
						</ul></li>-->
					 
					<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-cloud normal"></i> <span class="menu-text normal">借款标管理</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
					</a>
						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">借款列表</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_check/index")}','105Admin','初审待审核');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">初审待审核</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_invite/index")}','107Admin','正在招标');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">正在招标</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_recheck/index")}','106Admin','满标复审待审核');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">满标复审待审核</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_repayment/index")}','108Admin','正在还款');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">正在还款</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_unfinish/index")}','110Admin','已流标');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">已流标</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_done/index")}','109Admin','已完成');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">已完成</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_failcheck/index")}','111Admin','初审未通过');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">初审未通过</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_failrecheck/index")}','112Admin','复审未通过');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">复审未通过</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_edit/edit")}','285Admin','修改借款信息');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">修改借款信息</span>
									</a></li>
								</ul></li>							

							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">逾期借款管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_expired/index")}','118Admin','逾期借款列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">逾期借款列表</span>
									</a></li>
									<li><a href="javascript:openapp('${dfn:U("admin/borrow_expired_user/index")}','119Admin','逾期借款会员');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">逾期借款会员</span>
									</a></li>
								</ul></li>	
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">留言管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/comment/index")}','163Admin','留言管理');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">留言管理</span>
									</a></li>									
								</ul></li>	
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">债权转让管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/credit_assignment/index")}','244Admin','债权转让列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">债权转让列表</span>
									</a></li>									
								</ul></li>
							 
							<li><a href="#" class="dropdown-toggle"> <i
									class="fa fa-caret-right"></i> <span class="menu-text">融资申请管理</span>
									<b class="arrow fa fa-angle-right"></b>
							</a>
								<ul class="submenu">
									<li><a href="javascript:openapp('${dfn:U("admin/active/index")}','271Admin','申请列表');">
											&nbsp;<i class="fa fa-angle-double-right"></i> <span
											class="menu-text">申请列表</span>
									</a></li>									
								</ul></li>				
							
						</ul></li>
						<li><a href="#" class="dropdown-toggle"> <i
							class="fa fa-list normal"></i> <span class="menu-text normal">贷款管理</span>
							<b class="arrow fa fa-angle-right normal"></b> <i
							class="fa fa-reply back"></i> <span class="menu-text back">返回</span>
							</a>
							<ul class="submenu">
								<li><a href="#" class="dropdown-toggle"> <i
										class="fa fa-caret-right"></i> <span class="menu-text">贷款审核</span>
										<b class="arrow fa fa-angle-right"></b>
								</a>
									<ul class="submenu">
										<li><a href="javascript:openapp('${dfn:U("admin/loan/index")}','919Admin','贷款审核');">
												&nbsp;<i class="fa fa-angle-double-right"></i> <span
												class="menu-text">贷款审核</span>
										</a></li>
									</ul>
								</li>
							</ul>
						</li>
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
				<iframe src="${dfn:U("admin/index/mains")}" style="width: 100%; height: 100%;" frameborder="0" id="appiframe-0" name="appiframe-0"
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