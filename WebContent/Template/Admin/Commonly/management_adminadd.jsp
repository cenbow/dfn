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
			<li class="active"><a href="active.jsp">添加管理员</a></li>
		</ul>
		<div class="wrap J_check_wrap">

			<div class="search_type cc mb10">
				<div class="mb10">
					<table class="table_form" cellpadding="2" cellspacing="2"
						width="100%">
						<tbody>

							<tr>
								<th >用户名</th>
								<td><input type="test" name="user_name" class="input"
									id="user_name"> <span class="gray">请输入用户名</span></td>
							</tr>

							<tr>
								<th>密码</th>
								<td><input type="password" name="password" class="input"
									id="password" value=""> <span class="gray">请输入密码</span></td>
							</tr>
							<tr>
								<th>确认密码</th>
								<td><input type="password" name="pwdconfirm" class="input"
									id="pwdconfirm" value=""> <span class="gray">请输入确认密码</span></td>
							</tr>

							<tr>
								<th>所属地区</th>
								<td><select name="province" id="province">
										<option value="0">选择省份</option>
								</select> <select name="city" id="city">
										<option value="0">选择县/市</option>
								</select> <select name="area" id="area">
										<option value="0">选择地址</option>
								</select> <span class="gray">管理员所在地区</span></td>
							</tr>
							<tr>
								<th>联系方式</th>
								<td><input type="text" name="contact" value=""
									class="input" id="contact" size="30"> <span
									class="gray">联系方式</span></td>
							</tr>
							<tr>
								<th>真实姓名</th>
								<td><input type="text" name="real_name" value=""
									class="input" id="real_name"></td>
							</tr>
							<tr>
								<th>所属角色</th>
								<td><select name="u_group_id">
										<option value="52" selected>网站测试</option>
										<option value="51" selected>所有权限</option>
										<option value="54" selected>客服经理</option>
										<option value="55" selected>合作机构</option>
										<option value="57" selected>设计师</option>
										<option value="58" selected>运营经理</option>
										<option value="59" selected>业务总监</option>
								</select></td>
							</tr>
							<tr>
								<th>是否客服</th>								
								<td><select name="is_kf">
										<option value="0">否</option>
										<option value="1">是</option>
								</select></td>
							</tr>
							<tr>
								<th>状态</th>
								
								<td><select name="is_ban">
										<option value="0">开启</option>
										<option value="1">禁止</option>
								</select></td>
							</tr>
							<tr>
								<th>备注</th>
								<td><textarea name="info" rows="2" cols="20" id="remark"
										class="inputtext" style="height: 100px; width: 500px;"></textarea></td>
							</tr>

						</tbody>
					</table>

				

					

					<div class="pagination"></div>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
					&nbsp;&nbsp;<a class="btn"  href="javascript:;"
						onClick="window.history.back(-1);return false;">返回</a>
				</div>

			</div>

		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script>
		$(".nav-tabs li")
				.click(
						function() {
							var index = $(this).index();
							$(this).addClass("active").siblings().removeClass(
									"active");
							$(".J_check_wrap").eq(index).show().siblings(
									".J_check_wrap").hide();
						});

		function refersh_window() {
			var refersh_time = getCookie('refersh_time');
			if (refersh_time == 1) {
				window.location = "/admin_post/index.html";
			}
		}
		setInterval(function() {
			refersh_window();
		}, 2000);

		$(function() {
			setCookie("refersh_time", 0);
			Wind.use('ajaxForm', 'artDialog', 'iframeTools', function() {
				//批量移动
				$('#J_Content_remove').click(
						function(e) {
							var str = 0;
							var id = tag = '';
							$("input[name='ids[]']").each(function() {
								if ($(this).attr('checked')) {
									str = 1;
									id += tag + $(this).val();
									tag = ',';
								}
							});
							if (str == 0) {
								art.dialog.through({
									id : 'error',
									icon : 'error',
									content : '您没有勾选信息，无法进行操作！',
									cancelVal : '关闭',
									cancel : true
								});
								return false;
							}
							var $this = $(this);
							art.dialog.open(
									"/index.php?g=portal&m=AdminPost&a=move&ids="
											+ id, {
										title : "批量移动",
										width : "80%"
									});
						});
			});
		});

		//setInterval(function(){public_lock_renewal();}, 10000);
		$(".J_ajax_close_btn").on('click', function(e) {
			e.preventDefault();
			Wind.use("artDialog", function() {
				art.dialog({
					id : "question",
					icon : "question",
					fixed : true,
					lock : true,
					background : "#CCCCCC",
					opacity : 0,
					content : "您确定需要关闭当前页面嘛？",
					ok : function() {
						setCookie("refersh_time", 1);
						window.close();
						return true;
					}
				});
			});
		});

		/*	
		 /////---------------------
		 Wind.use('validate', 'ajaxForm', 'artDialog', function () {
		 //javascript
		
		 //编辑器
		 editorcontent = new baidu.editor.ui.Editor();
		 editorcontent.render( 'content' );
		 try{editorcontent.sync();}catch(err){};
		 //增加编辑器验证规则
		 jQuery.validator.addMethod('editorcontent',function(){
		 try{editorcontent.sync();}catch(err){};
		 return editorcontent.hasContents();
		 });
		 var form = $('form.J_ajaxForms');
		 //ie处理placeholder提交问题
		 if ($.browser.msie) {
		 form.find('[placeholder]').each(function () {
		 var input = $(this);
		 if (input.val() == input.attr('placeholder')) {
		 input.val('');
		 }
		 });
		 }
		 //表单验证开始
		 form.validate({
		 //是否在获取焦点时验证
		 onfocusout:false,
		 //是否在敲击键盘时验证
		 onkeyup:false,
		 //当鼠标掉级时验证
		 onclick: false,
		 //验证错误
		 showErrors: function (errorMap, errorArr) {
		 //errorMap {'name':'错误信息'}
		 //errorArr [{'message':'错误信息',element:({})}]
		 try{
		 $(errorArr[0].element).focus();
		 art.dialog({
		 id:'error',
		 icon: 'error',
		 lock: true,
		 fixed: true,
		 background:"#CCCCCC",
		 opacity:0,
		 content: errorArr[0].message,
		 cancelVal: '确定',
		 cancel: function(){
		 $(errorArr[0].element).focus();
		 }
		 });
		 }catch(err){
		 }
		 },
		 //验证规则
		 rules: {'post[post_title]':{required:1},'post[post_content]':{editorcontent:true}},
		 //验证未通过提示消息
		 messages: {'post[post_title]':{required:'请输入标题'},'post[post_content]':{editorcontent:'内容不能为空'}},
		 //给未通过验证的元素加效果,闪烁等
		 highlight: false,
		 //是否在获取焦点时验证
		 onfocusout: false,
		 //验证通过，提交表单
		 submitHandler: function (forms) {
		 $(forms).ajaxSubmit({
		 url: form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
		 dataType: 'json',
		 beforeSubmit: function (arr, $form, options) {
		
		 },
		 success: function (data, statusText, xhr, $form) {
		 if(data.status){
		 setCookie("refersh_time",1);
		 //添加成功
		 Wind.use("artDialog", function () {
		 art.dialog({
		 id: "succeed",
		 icon: "succeed",
		 fixed: true,
		 lock: true,
		 background: "#CCCCCC",
		 opacity: 0,
		 content: data.info,
		 button:[
		 {
		 name: '继续添加？',
		 callback:function(){
		 reloadPage(window);
		 return true;
		 },
		 focus: true
		 },{
		 name: '返回列表页',
		 callback:function(){
		 location='/admin_post/index.html';
		 return true;
		 }
		 }
		 ]
		 });
		 });
		 }else{
		 isalert(data.info);
		 }
		 }
		 });
		 }
		 });
		 });
		 ////-------------------------
		 });
		 */
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
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: none repeat scroll 0% 0% rgb(255, 255, 255);"></div>
</body>
</html>