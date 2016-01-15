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
<script defer="defer" type="text/javascript" src="${AdminStatics}/js/zh-cn.js"></script>
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${AdminStatics}/ueditor/ueditor.css">
<script defer="defer" type="text/javascript" src="${AdminStatics}/ueditor/third-party/codemirror/codemirror.js"></script>

<link href="${AdminStatics}/ueditor/third-party/codemirror/codemirror.css" type="text/css" rel="stylesheet">
<script defer="defer" type="text/javascript" src="${AdminStatics}/ueditor/third-party/Zeroclipboard/ZeroClipboard.js"></script>

</head>
<body style="" class="J_scroll_fixed">
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
	<div style="" class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#" data-toggle="tab">用户邮箱激活设置</a></li>
		</ul>
		<div style="" class="common-form">
			<form style="" method="post" class="form-horizontal J_ajaxForm"
				action="/admin/mailer/active_post.html">
				<table style="" cellpadding="2" cellspacing="2" width="100%">
					<tbody style="">
						<tr>
							<td width="100">邮箱激活</td>
							<td><label class="radio inline" for="lightup_true"> <input
									checked="checked" id="lightup_true" class="radio"
									name="lightup" value="1" type="radio">开启
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
								class="radio inline" for="lightup_false"> <input
									id="lightup_false" class="radio" name="lightup" value="0"
									type="radio">关闭
							</label> <input name="option_id" value="" type="hidden"></td>
						</tr>
						<tr>
							<td>邮件标题</td>
							<td><input class="input mr5" name="options[title]"
								value="鼎峰P2P邮件激活通知." type="text"></td>
						</tr>
						<tr style="">
							<td style="">邮件模版</td>
							<td>
								<script type="text/javascript"  src="${AdminStatics}/ueditor/ueditor.config.js"></script>
								<script type="text/javascript"  src="${AdminStatics}/ueditor/ueditor.all.min.js"></script>
								<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
								<script type="text/javascript">
									var ue = UE.getEditor('editor',{
										textarea:'article_content',
										initialFrameHeight:500
									});
								</script>
								<span style="color:#ffb752;">请用http://#link#代替激活链接，#username#代替用户名</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">确定</button>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>