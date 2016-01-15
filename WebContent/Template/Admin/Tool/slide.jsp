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
.col-auto {
	overflow: hidden;
	_zoom: 1;
	_float: left;
	border: 1px solid #c2d1d8;
}

.col-right {
	float: right;
	width: 210px;
	overflow: hidden;
	margin-left: 6px;
	border: 1px solid #c2d1d8;
}

body fieldset {
	border: 1px solid #D8D8D8;
	padding: 10px;
	background-color: #FFF;
}

body fieldset legend {
	background-color: #F9F9F9;
	border: 1px solid #D8D8D8;
	font-weight: 700;
	padding: 3px 8px;
}

.list-dot {
	padding-bottom: 10px
}

.list-dot li, .list-dot-othors li {
	padding: 5px 0;
	border-bottom: 1px dotted #c6dde0;
	font-family: "宋体";
	color: #bbb;
	position: relative;
	_height: 22px
}

.list-dot li span, .list-dot-othors li span {
	color: #004499
}

.list-dot li a.close span, .list-dot-othors li a.close span {
	display: none
}

.list-dot li a.close, .list-dot-othors li a.close {
	background: url("/statics/images/cross.png") no-repeat left 3px;
	display: block;
	width: 16px;
	height: 16px;
	position: absolute;
	outline: none;
	right: 5px;
	bottom: 5px
}

.list-dot li a.close:hover, .list-dot-othors li a.close:hover {
	background-position: left -46px
}

.list-dot-othors li {
	float: left;
	width: 24%;
	overflow: hidden;
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

</head>
<body class="J_scroll_fixed">
<div class="wrap jj">	
	<ul class="nav nav-tabs">
			<li class="active"><a href="#">所有幻灯片</a></li>
			<li><a href="#">添加幻灯片</a></li>
	</ul>
	<div class="wrap J_check_wrap">
		<form class="well form-search" method="post" id="cid_form">
			<div class="search_type cc mb10">
				<div class="mb10">
					<select class="select_2" name="cid" style="width: 100px;"
						id="selected_cid">
						<option selected="selected" value="">全部</option>
						<option value="0">默认分类</option>
					</select>
				</div>
			</div>
		</form>
		<form class="J_ajaxForm" action="" method="post">
			<div class="table_list">
				<table class="table table-hover" width="100%">
					<thead>
						<tr>
							<th width="16"><label><input class="J_check_all"
									data-direction="x" data-checklist="J_check_x" type="checkbox"></label></th>
							<th width="50">排序</th>
							<th width="100">ID</th>
							<th>标题</th>
							<th>描述</th>
							<th>链接</th>
							<th>图片</th>
							<th width="45">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
				</table>
				<div class="p10">
					<div class="pages"></div>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					class="J_check_all" data-direction="y" data-checklist="J_check_y"
					id="check_all" type="checkbox">全选</label>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin/slide/listorders.html">排序</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin/slide/toggle/display/1.html"
					data-subcheck="true">显示</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin/slide/toggle/hide/1.html" data-subcheck="true">隐藏</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin/slide/delete.html" data-subcheck="true">删除</button>
			</div>
		</form>
	</div>

	<div style="display:none;" class="wrap J_check_wrap">
		<form name="myform" id="myform" action="#" method="post" class="form-horizontal J_ajaxForms" enctype="multipart/form-data">
			<div class="col-right">
				<div class="table_full">
					<table width="100%" cellpadding="2" cellspacing="2">
						<tr>
							<td><b>缩略图</b></td>
						</tr>
						<tr>
							<td>
								<div style="text-align: center;">
									<input type='hidden' name='slide_pic' id='thumb' value=''> <a
										href='javascript:void(0);'
										onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','content','12','b6ba209759e147124653ac77362ef2bd');return false;">
										<img src='statics/images/icon/upload-pic.png'
										id='thumb_preview' width='135' height='113'
										style='cursor: hand' />
									</a> <input type="button" class="btn"
										onclick="$('#thumb_preview').attr('src','/statics/images/icon/upload-pic.png');$('#thumb').val('');return false;"
										value="取消图片">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-auto">
				<div class="table_full">
					<table width="100%" cellpadding="2" cellspacing="2">
						<tr>
							<th width="80">栏目</th>
							<td><select name="slide_cid" class="normal_select">
									<option value="0">默认分类</option>
							</select></td>
						</tr>
						<tr>
							<th width="80">幻灯片名称</th>
							<td><input type="text" style="width: 400px;" name="slide_name"
								id="title" value="" style="color:"
								class="input input_hd J_title_color" placeholder="请输入幻灯片名称"
								onkeyup="strlen_verify(this, 'title_len', 160)" /> <span
								class="must_red">*</span></td>
						</tr>
						<tr>
							<th width="80">链接地址：</th>
							<td><input type='text' name='slide_url' value=''
								style='width: 400px' class='input  input_hd J_title_color'></td>
						</tr>
						<tr>
							<th width="80">描述</th>
							<td><input type='text' name='slide_des' value=''
								style='width: 400px' class='input  input_hd J_title_color'></td>
						</tr>
						<tr>
							<th width="80">幻灯片内容</th>
							<td><textarea name='slide_content' id='description'
									style='width: 98%; height: 200px;'></textarea></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="form-actions">
				<button class="btn btn-primary btn_submit J_ajax_submit_btn"
					type="submit">提交</button>
				<a class="btn" href="/admin/slide">返回</a>
			</div>
		</form>
	</div>

</div>
<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript" src="${AdminStatics}/js/content_addtop.js"></script>
<script>
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});
setCookie('refersh_time', 0);
function refersh_window() {
    var refersh_time = getCookie('refersh_time');
    if (refersh_time == 1) {
        window.location.reload();
    }
}
setInterval(function(){
	refersh_window()
}, 3000);
$(function () {
	$("#selected_cid").change(function(){
		$("#cid_form").submit();
	});
});

</script>
</body>
</html>