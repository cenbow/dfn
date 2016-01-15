<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css" rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css" rel="stylesheet" />
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style>
.length_3 {
	width: 180px;
}
</style>
<!--[if IE 7]> <link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<script type="text/javascript">
	//全局变量
	var GV = {
		DIMAUB : "/",
		JS_ROOT : "statics/js/",
		TOKEN : ""
	};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
			<li class="active"><a href="#">友情链接</a></li>
			<li><a href="#">添加链接</a></li>
	</ul>
	<div class="common-form">
		<form method="post" class="J_ajaxForm"
			action="/admin/link/listorders.html">
			<div class="table_list">
				<table width="100%" class="table table-hover">
					<thead>
						<tr>
							<th width="16"><label><input type="checkbox"
									class="J_check_all" data-direction="x"
									data-checklist="J_check_x"></label></th>
							<th width="50">排序</th>
							<th>ID</th>
							<th>链接名称</th>
							<th>链接地址</th>
							<th width="45">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" class="J_check"
								data-yid="J_check_y" data-xid="J_check_x" name="ids[]"
								value="1"></td>
							<td><input name='listorders[1]'
								class="input input-order mr5" type='text' size='3' value='0'></td>
							<td>1</td>
							<td>鼎峰P2P</td>
							<td><a href="http://www.鼎峰P2P.com" target="_blank">http://www.鼎峰P2P.com</a></td>
							<td>显示</td>
							<td><a href="/admin/link/edit/id/1.html">修改</a>| <a
								href="/admin/link/delete/id/1.html" class="J_ajax_del">删除</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form-actions">
					<label class="checkbox inline" for="check_all"><input
						type="checkbox" class="J_check_all" data-direction="y"
						data-checklist="J_check_y" id="check_all">全选</label>
					<button class="btn btn-primary btn_submit mr10 J_ajax_submit_btn"
						type="submit">排序</button>
					<button class="btn btn-primary J_ajax_submit_btn" type="submit"
						data-action="/admin/link/toggle/display/1.html"
						data-subcheck="true">显示</button>
					<button class="btn btn-primary J_ajax_submit_btn" type="submit" data-action="/admin/link/toggle/hide/1.html" data-subcheck="true">隐藏</button>
				</div>
			</div>
		</form>
	</div>
	
	<div style="display:none;" class="common-form">
			<form method="post" class="form-horizontal J_ajaxForm" action="/admin/link/add_post.html">
				<div class="table_list">
					<table cellpadding="2" cellspacing="2" width="100%">
						<tbody>
							<tr>
								<td width="180">链接名称:</td>
								<td><input type="text" class="input" name="link_name"
									value=""><span class="must_red">*</span></td>
							</tr>
							<tr>
								<td>链接地址:</td>
								<td><input type="text" class="input" name="link_url"
									value=""><span class="must_red">*</span></td>
							</tr>
							<tr>
								<td>链接图标:</td>
								<td><input type="text" class="input" name="link_image"
									value=""></td>
							</tr>
							<tr>
								<td>打开方式:</td>
								<td><select name="link_target" class="normal_select">
										<option value="_blank">新标签页打开</option>
										<option value="_self">本窗口打开</option>
								</select></td>
							</tr>
							<tr>
								<td>描述:</td>
								<td><textarea name="link_description" rows="5" cols="57"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit J_ajax_submit_btn">添加</button>
					<a class="btn" href="/admin/link">返回</a>
				</div>
			</form>
		</div>
</div>	
<script src="${AdminStatics}/js/common.js?"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
</body>
</html>