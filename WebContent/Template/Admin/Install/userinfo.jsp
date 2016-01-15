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
<div class="wrap jj">
	<ul class="nav nav-tabs">
			<li class="active"><a href="#">修改信息</a></li>
			<li><a href="#">修改密码</a></li>
	</ul>
	<div class="common-form">
		<form class="form-horizontal J_ajaxForm" method="post" action="/admin/user/userinfo_post.html">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="input01">昵称:</label>
					<div class="controls">
						<input class="input" name="id" value="21" type="hidden"> <input
							name="user_nicename" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input01">性别:</label>
					<div class="controls">
						<select name="sex">
							<option value="0" selected="selected">保密</option>
							<option value="1">男</option>
							<option value="2">女</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input-birthday">生日</label>
					<div class="controls">
						<input class="J_date date" id="input-birthday"
							placeholder="2013-01-04" name="birthday" value="0000-00-00"
							type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input-user_url">个人网址</label>
					<div class="controls">
						<input id="input-user_url" placeholder="http://鼎峰P2P.com"
							name="user_url" type="text">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input-signature">个性签名</label>
					<div class="controls">
						<textarea id="input-signature" placeholder="个性签名"
							name="signature"></textarea>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">更新</button>
				</div>
			</fieldset>
		</form>
	</div>
		
	<div style="display:none;" class="common-form">
		<form class="form-horizontal J_ajaxForm" method="post" action="/admin/setting/password_post.html">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="input01">原始密码:</label>
					<div class="controls">
						<input class="input-xlarge" id="input01" name="old_password"
							type="password">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input01">新密码:</label>
					<div class="controls">
						<input class="input-xlarge" id="input01" name="password"
							type="password">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input01">重复新密码:</label>
					<div class="controls">
						<input class="input-xlarge" id="input01" name="repassword"
							type="password">
					</div>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">更新</button>
				</div>
			</fieldset>
		</form>
	</div>
		
</div>
<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
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