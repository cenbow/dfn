<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css"
	rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css"
	rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css"
	rel="stylesheet">
<link
	href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


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
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js"
	type="text/javascript"></script>
<script src="${AdminStatics}/js/datePicker/datePicker.js"
	type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">

</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">手机参数配置</a></li>
		</ul>
		<div class="common-form">
			<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/user/userinfo_post.html">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">短信接口帐号:</label>
						<div class="controls">
							<td><input  type="text" class="input" name="smsUser" id="smsUser" value="shixinda"/><span class="commonToolTip">购买短信后获得的短信接口帐号</span></td>

						</div>
				</div>
					<div class="control-group">
						<label class="control-label" for="input01">短信接口密码:</label>
						<div class="controls">
							<td><input  type="password" class="input" name="smsPass" id="smsPass" value="230023"/><span class="commonToolTip">购买短信后获得的短信接口密码</span></td>

						</div>
				</div>
					<div class="control-group">
						<label class="control-label" for="input-birthday">短信使用状态:</label>
						<div class="controls">
							  <td id="sms_state">载入中...</td>


						</div>
				</div>
					
				</fieldset>
			</form>
			<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
					&nbsp;&nbsp;<a  class="btn" href="javascript:;"
						onClick="window.history.back(-1);return false;">返回</a>
				</div>
		</div>

		

</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
	</script>
	
</body>
</html>