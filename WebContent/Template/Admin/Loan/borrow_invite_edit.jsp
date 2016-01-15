<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
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


</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">借款信息</a></li>
			<li><a href="#">审核操作</a></li>
		</ul>
		<div class="common-form">
			<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/user/userinfo_post.html">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">借款标题:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">还款方式:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">借款标类型:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">借款用途:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">借款金额:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">年化利率:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">借款期限:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text"> 个月
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-signature">借款说明：</label>
						<div class="controls">
							<textarea id="input-signature" placeholder="个性签名"
								name="signature"></textarea>
						</div>
					</div>
				</fieldset>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/setting/password_post.html">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">借款管理费:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">募集时间(天)：</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text"> <span
								class="commonToolTip">在前台展示天数，如在担心在设定时间内不能募集完成，可修改延长</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">定向密码:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text"><span
								class="commonToolTip">不修改则留空</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">最多投标总额:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">处理方法：</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="radiobutton" type="radio" value="radiobutton"
								checked> 招标中 <input name="radiobutton" type="radio"
								value="radiobutton"> 流标
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-signature">审核说明：</label>
						<div class="controls">
							<textarea id="input-signature" placeholder="审核说明"
								name="signature"></textarea>
							<span class="commonToolTip">如果处理方式为 流标 则需要填写审核说明</span>
						</div>
					</div>

				</fieldset>
			</form>
		</div>
		<div class="form-actions">
			<button type="submit"
				class="btn btn-primary btn_submit  J_ajax_submit_btn">处理</button>
			&nbsp;&nbsp;<a href="javascript:;"
				onClick="window.history.back(-1);return false;">返回</a>
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