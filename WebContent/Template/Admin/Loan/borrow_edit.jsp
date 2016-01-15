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
			<li class="active"><a href="#">标的信息</a></li>
			<li><a href="#">图片资料</a></li>
		</ul>
		<script type="text/javascript">
			function getDataBW() {
				var borrow_id = $("#borrow_id").val();
				if (borrow_id == '') {
					alert("请输入ID");
					return false;
				}
				window.location.href = '/newadmin-BorrowEdit-index?id='
						+ borrow_id;
			}
		</script>
		<div class="common-form">
			<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/user/userinfo_post.html">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">标的ID:</label>
						<div class="controls">
							<td><input style="width: 200px" type="text" class="input"
								name="borrow_id" id="borrow_id" value="" /><span
								class="commonToolTip">借款ID</span><a href="javascript:;"
								onClick="getDataBW();">获取数据</a></td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">借款标题:</label>
						<div class="controls">
							<input style="width: 200px" type="text" class="input"
								name="borrow_id2" id="borrow_id2" value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-birthday">借款说明:</label>
						<div class="controls">
							<td><script type="text/javascript">
								window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
								window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
								var _editorAll = [];
							</script>

								<script type="text/javascript" charset="utf-8"
									src="http://www.ggmoney.com/statics/editer/uedit/editor_config.js"></script>

								<script type="text/javascript" charset="utf-8"
									src="http://www.ggmoney.com/statics/editer/uedit/editor_all_min.js"></script>
								<textarea name="borrow_info" id="borrow_info"></textarea> <script
									type="text/javascript">
									var _editor = UE.getEditor("borrow_info");
									_editorAll.push(_editor);
								</script>
							</td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-user_url"></label>
						<div class="controls"></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-signature"></label>
						<div class="controls"></div>
					</div>
					<div class="form-actions">
						<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
						&nbsp;&nbsp;<a href="javascript:;"
							onclick="window.history.back(-1);return false;">返回</a>
					</div>
				</fieldset>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/setting/password_post.html">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">借款方图片:</label>
						<div class="controls">
							<td><div class="swfUploadBar clearfix">
									<span id="spanButtonPlaceholder"></span>
									<div id="divFileProgressContainer"></div>
								</div></td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">图片类型:</label>
						<div class="controls">
							<td><input type="radio" class=" x_select" checked="checked"
								name="imgType" value="1" id="imgType_1" title="请选择您所上传图片的分类"><label
								for="imgType_1">项目相关资料</label></select></td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">项目相关图片预览:</label>
						<div class="controls">
							<input class="input-xlarge" id="input01" name="repassword"
								type="password">
						</div>
					</div>
					<div class="form-actions">
						<button type="submit"
							class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
						&nbsp;&nbsp;<a href="javascript:;"
							onclick="window.history.back(-1);return false;">返回</a>
					</div>
				</fieldset>
			</form>
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