<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
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
<!--[if IE 7]> <link rel="stylesheet" href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
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
<script src="${AdminStatics}/js/artDialog/iframeTools.js"
	type="text/javascript"></script>

<script src="${AdminStatics}/js/datePicker/datePicker.js"
	type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">
</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="active.jsp">添加新任务</a></li>
		</ul>
		<div class="wrap J_check_wrap">

			<div class="search_type cc mb10">
				<div class="mb10">
					<table class="table_form" cellpadding="2" cellspacing="2"
						width="100%">
						<tbody>

							<tr>
								<th width="200">任务名称：</th>
								<td><input type="text" class="input" name="name" id="name"
									value="" /></td>
							</tr>
							<tr>
								<th width="200">执行时间：</th>
								<td><input type="text" class="input" name="name" id="name"
									value="" /></td>
							</tr>
							<tr>
								<th width="200">月：</th>
								<td><input name="radiobutton" type="radio"
											value="radiobutton" checked>
								  <LABEL for="month_1">每月</LABEL>
								  <LABEL for="is_show_1"></LABEL>
                                  <input name="radiobutton" type="radio" value="radiobutton">
                                  <LABEL for="is_show_1"></LABEL>
                              <LABEL for="month_2">指定月份</LABEL></td>
							</tr>
							<tr id="month_set_tr" style="display: none">
								<th width="200">指月份：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="month_set" id="month_set" value="" /><span
									class="commonToolTip">输入数字月份，多个月份用英文逗号隔开，有效数字为(1-12)，如(1,2,10,11)</span></td>
							</tr>
							<tr>
								<th width="200">日期：</th>
								<td><input name="radiobutton" type="radio"
											value="radiobutton" checked>
                                  <LABEL for="day_1">每天</LABEL>
                                  <LABEL for="month_1"></LABEL>
                                  <LABEL for="is_show_1"></LABEL>
                                  <input name="radiobutton" type="radio" value="radiobutton">
                                  <LABEL for="is_show_1"></LABEL>
                                  <LABEL for="day_2">指定日期</LABEL>
                                <LABEL for="month_2">
                                <input name="radiobutton" type="radio" value="radiobutton"></LABEL>
                                <LABEL for="day_3">指定星期几</LABEL></td>
							</tr>
							<tr id="day_set_day_tr" style="display: none">
								<th width="200">指定日期：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="day_set" id="day_set" value="" /><span
									class="commonToolTip">输入数字日期，多个日期用英文逗号隔开，有效数字为(1-31)，如(1,2,18,25,28)</span></td>
							</tr>
							<tr id="day_set_week_tr" style="display: none">
								<th width="200">指定星期几：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="week_set" id="week_set" value="" /><span
									class="commonToolTip">输入数字，有效数字为(0-6)，0表示星期天，依此类推，一个星期内多天用英文逗号隔开，如(0,3,5)</span></td>
							</tr>
							<tr>
								<th width="200">小时：</th>
								<td><input name="radiobutton" type="radio"
											value="radiobutton" checked>
								  <LABEL for="hour_1">每小时</LABEL>
								  <LABEL for="month_1"></LABEL>
                                  <LABEL for="is_show_1"></LABEL>
                                  <input name="radiobutton" type="radio" value="radiobutton">
                                  <LABEL for="is_show_1"></LABEL>
                                  <LABEL for="hour_2">指定小时</LABEL>
                                <LABEL for="month_2"></LABEL></td>
							</tr>
							<tr id="hour_set_tr" style="display: none">
								<th width="200">指定小时：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="hour_set" id="hour_set" value="" /><span
									class="commonToolTip">输入数字，多个小时用英文逗号隔开，有效数字为(0-23)，如(0,1,2,18,20,23)</span></td>
							</tr>
							<tr>
								<th width="200">分钟：</th>
								<td><input name="radiobutton" type="radio"
											value="radiobutton" checked>
                                  <LABEL for="min_1">每分</LABEL>
                                  <LABEL for="hour_1"></LABEL>
                                  <LABEL for="month_1"></LABEL>
                                  <LABEL for="is_show_1"></LABEL>
                                  <input name="radiobutton" type="radio" value="radiobutton">
                                  <LABEL for="is_show_1"></LABEL>
                                  <LABEL for="min_2">指定分钟</LABEL>
                                  <LABEL for="hour_2"></LABEL>
                                  <LABEL for="month_2"></LABEL></td>
							</tr>
							<tr id="min_set_tr" style="display: none">
								<th width="200">指定分钟：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="min_set" id="min_set" value="" /><span
									class="commonToolTip">输入数字，多个分钟用英文逗号隔开，有效数字为(0-59)，如(0,1,2,43,54,57)</span></td>
							</tr>
							<tr>
								<th width="200">任务脚本地址：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="task_url" id="task_url" value="" /><span
									class="commonToolTip">输入执行此任务的脚本地址</span></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
					&nbsp;&nbsp;<a href="javascript:;"
						onClick="window.history.back(-1);return false;">返回</a>
				</div>
			</div>

		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script type="text/javascript"> 
function ckjump(obj){
	var type = $(obj).val();
	var id = $(obj).attr("name")+"_"+type+"_tr";
	$("#"+id).show();
	$(obj).siblings("input").each(function(k, v) {
		var stype = $(this).val();
		if(stype!="*"){
			var sid = $(this).attr("name")+"_"+stype+"_tr";
			$("#"+sid).hide();
		}
    });
}
</script>

</body>
</html>