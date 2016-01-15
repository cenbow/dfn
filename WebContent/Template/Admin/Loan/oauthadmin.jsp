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
			<li class="active"><a href="#A" data-toggle="tab">QQ互联登录设置</a></li>
			<li><a href="#B" data-toggle="tab">新浪微博登录设置</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table width="100%" cellpadding="2" cellspacing="2">
								<tbody>
									<tr>
										<td width="120">APPkey</td>
										<td><input type="text" class="input mr5" name="qq_key"
											value="101162987" /></td>
									</tr>
									<tr>
										<td>APPsecret</td>
										<td><input type="text" class="input mr5" name="qq_sec"
											value="acbc5edf9255b316fb812f837d083bcd" /></td>
									</tr>
									<tr>
										<td colspan="2"><a href="http://connect.qq.com/"
											target="_blank">点击此处</a>获取QQ互联APPKey及APPsecret</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="B">
							<table width="100%">
								<tbody>
									<tr>
										<td width="120">APPkey</td>
										<td><input type="text" class="input mr5" name="sina_key"
											value="1184624395" /></td>
									</tr>
									<tr>
										<td>APPsecret</td>
										<td><input type="text" class="input mr5" name="sina_sec"
											value="5481d369866435b121b09cebed80f37e" /></td>
									</tr>
									<tr>
										<td>授权回调页：</td>
										<td>http://demo.鼎峰P2P.com/index.php?g=api&m=oauth&a=callback&type=sina</td>
									</tr>
									<tr>
										<td>取消授权回调页：</td>
										<td>http://demo.鼎峰P2P.com</td>
									</tr>
									<tr>
										<td colspan="2"><a href="http://open.weibo.com/"
											target="_blank">点击此处</a>获取新浪微博APPKey及APPsecret</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">确定</button>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>