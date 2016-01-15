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

</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="http://demo.鼎峰P2P.com/admin/backup/index.html">数据备份</a></li>
		</ul>
		<div class="common-form">
			<form action="/admin/backup/index_post.html" method="post">
				<div class="table_list">
					<table class="table_form" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td align="right" width="150">每个分卷文件大小 :</td>
								<td><input name="sizelimit" class="input" value="10240"
									size="10" type="text"> K &nbsp;&nbsp;(推荐10M以下)</td>
							</tr>
							<tr>
								<td align="right">备份名称 :</td>
								<td><input name="backup_name" class="input" value="20150127_1"
									type="text"></td>
							</tr>
							<tr>
								<td align="right">备份类型 :</td>
								<td>
									<label>
									<input checked="checked" value="full" name="backup_type" onclick="javascript:$('#J_showtables').hide();" type="radio">
										全部备份<font class="gray">备份数据库所有表</font> &nbsp;&nbsp;
									</label> 
									<label>
									<input value="custom" name="backup_type" onclick="javascript:$('#J_showtables').show();" type="radio">
										自定义备份<font class="gray">根据自行选择备份数据表</font>
									</label>
								</td>
							</tr>
							<tr id="J_showtables">
								<td align="right">
									<label>
										<input name="selectall" checked="checked" value="" onclick="javascript:$('.J_checkitem').attr('checked', this.checked);" type="checkbox"> 
										选择全部 :
									</label>
								</td>
								<td colspan="2">
									<label class="checkbox inline" style="width: 200px;">
										<input name="backup_tables[sp_wx_message_location]" value="-1" checked="checked" class="J_checkitem" type="checkbox">&nbsp;&nbsp;
										sp_wx_message_location
									</label>
									<label class="checkbox inline" style="width: 200px;">
										<input name="backup_tables[sp_wx_message_text]" value="-1" checked="checked" class="J_checkitem" type="checkbox">&nbsp;&nbsp;
										sp_wx_message_text
									</label>
									<label class="checkbox inline" style="width: 200px;">
										<input name="backup_tables[sp_wx_message_voice]" value="-1" checked="checked" class="J_checkitem" type="checkbox">&nbsp;&nbsp;
										sp_wx_message_voice
									</label>
									<label class="checkbox inline" style="width: 200px;">
										<input name="backup_tables[sp_wx_user]" value="-1" checked="checked" class="J_checkitem" type="checkbox">&nbsp;&nbsp;
										sp_wx_user
									</label>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input name="dosubmit" value=" 开始备份数据 "
									class="btn btn_submit btn-primary" type="submit"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
<style type="text/css">
#J_showtables {
	display: none;
}
.checkbox.inline {
	margin-left: 10px;
}
</style>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>