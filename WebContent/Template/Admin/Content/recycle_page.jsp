<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css" rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<style>
.length_3 {
	width: 180px;
}
</style>
<!--[if IE 7]> <link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<script type="text/javascript">//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/datePicker/datePicker.js" type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">

</head>
<body class="J_scroll_fixed">
	<div class="aui_state_focus"
		style="position: absolute; left: -9999em; top: 317px; width: auto; z-index: 1987;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div class="aui_titleBar">
													<div style="cursor: move;" class="aui_title">消息</div>
													<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
												</div></td>
										</tr>
										<tr>
											<td style="display: none;" class="aui_icon"><div
													style="background: none repeat scroll 0% 0% transparent;"
													class="aui_iconBg"></div></td>
											<td style="width: auto; height: auto;" class="aui_main"><div
													style="padding: 20px 25px;" class="aui_content">
													<div class="aui_loading">
														<span>loading..</span>
													</div>
												</div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													style="display: none;" class="aui_buttons"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td style="cursor: se-resize;" class="aui_se"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">页面回收</a></li>
		</ul>
		<form class="well form-search" method="post"
			action="/admin_page/recyclebin.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">时间： <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input autocomplete="off"
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" type="text"> 关键字： <input
						class="input length_2" name="keyword" style="width: 200px;"
						placeholder="请输入关键字..." type="text">
						<button class="btn">搜索</button>
					</span>
				</div>
			</div>
		</form>
		<form class="J_ajaxForm" action="" method="post">
			<div class="table_list">
				<table class="table table-hover" width="100%">
					<thead>
						<tr>
							<td width="16"><label><input class="J_check_all"
									data-direction="x" data-checklist="J_check_x" type="checkbox"></label></td>
							<td width="100">ID</td>
							<td>标题</td>
							<!-- <td>点击量</td> -->
							<td width="80">发布人</td>
							<td width="120"><span>发布时间</span></td>
							<td width="120">操作</td>
						</tr>
					</thead>
				</table>
				<div class="pagination"></div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					class="J_check_all" data-direction="y" data-checklist="J_check_y"
					id="check_all" type="checkbox">全选</label>
				<button class="btn J_ajax_submit_btn btn-primary" type="submit"
					data-action="/admin_page/clean.html" data-subcheck="true">删除</button>
			</div>
		</form>
	</div>
	<script src="statics/js/common.js"></script>
	<div id="calroot" style="display: none; position: absolute;">
		<div id="calhead">
			<a id="calprev"></a>
			<div id="caltitle">
				<select id="calmonth"></select><select id="calyear"></select>
			</div>
			<a id="calnext"></a>
		</div>
		<div id="calbody">
			<div id="caldays">
				<span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
			</div>
			<div id="calweeks"></div>
			<div class="caltime">
				<button type="button" class="btn btn_submit fr" name="submit">确认</button>
				<input id="calHour" class="input" min="0" max="23" size="2"
					value="0" type="number"><span>点</span><input id="calMin"
					class="input" size="2" min="1" max="59" value="0" type="number"><span>分</span>
			</div>
		</div>
	</div>
</body>
</html>