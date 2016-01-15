<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/themes/flat/theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/css/simplebootadmin.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/js/artDialog/skins/default.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"
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
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/wind.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/ajaxForm.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/artDialog/artDialog.js"
	type="text/javascript"></script>

</head>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="${dfn:U('admin/loan/transition_index')}">流转中的借款</a></li>
			<li><a href="${dfn:U('admin/loan/transition_edit')}"
				data-toggle="tab">编辑流转标</a></li>
			<li><a href="${dfn:U('admin/loan/transition_add')}"
				data-toggle="tab">添加流转标</a></li>
		</ul>


		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">基本信息</a></li>
			<li><a href="#B" data-toggle="tab">借款方资料</a></li>
			<li><a href="#C" data-toggle="tab">借款方图片资料</a></li>
			<li><a href="#D" data-toggle="tab">用户同步</a></li>
		</ul>

		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tbody>
									<tr>
										<td width="180">是否显示：</td>
										<td><input name="radiobutton" type="radio"
											value="radiobutton" checked> <LABEL for="is_show_1">不显示</LABEL>
											<input name="radiobutton" type="radio" value="radiobutton">
											<LABEL for="is_show_1">显示</LABEL><span class="commonToolTip">是否在前台显示</span></td>
									</tr>
									<tr>
										<td>借款标题：</td>
										<td><input class="input" name="options[site_host]"
											type="text"></td>
									</tr>
									<tr>
										<td>最小流转单位：</td>
										<td><input class="input" name="options[site_root]9"
											type="text"></td>
									</tr>
									<tr>
										<td>总流转份数：</td>
										<td><input class="input" name="options[site_root]2"
											type="text"></td>
									</tr>
									<tr>
										<td>借款金额：</td>
										<td><input class="input" name="options[site_root]3"
											type="text"> </label></td>
									</tr>
									<tr>
										<td>年化利率：</td>
										<td><input class="input" name="options[site_root]4"
											type="text"><span class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td>每月增加年利率（每月）：</td>
										<td><input class="input" name="options[site_root]5"
											type="text"><span class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td>网站奖励（每月）：</td>
										<td><input class="input" name="options[site_root]6"
											type="text"><span class="commonToolTip">%</span></td>
									</tr>
									<tr>
										<td>借款期限:</td>
										<td><input class="input" name="options[site_root]7"
											type="text"><span class="commonToolTip">填整数，表示月数,前台显示给会员看，不参与计算可投期限</span></td>
									</tr>
									<tr>
										<td>最低认购期限：</td>
										<td><input class="input" name="options[site_root]8"
											type="text"><span class="commonToolTip">填整数，表示月数</span></td>
									</tr>
									<tr>
										<td>流转结束时间：</td>
										<td><input type="text" class="input length_2 J_date date" name="deadline" id="deadline" value=""><span
											class="commonToolTip">不会在前台显示，此时间只是在会员投标时程序计算会员可投月数</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="B">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tbody>
									<tr>
										<td width="180">借款人:</td>
										<td><span id="buname"></span><a style="margin-left: 20px"
											href="javascript:;"
											onClick="dialogUrl('/newadmin-BorrowTransition-showuser','选择借款人','','',450);">选择借款人</a><input
											type="hidden" id="borrow_uid" name="borrow_uid" value="" /></td>
									</tr>

									<tr>
										<td>借款方商业概述:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57"></textarea></td>
									</tr>
									<tr>
										<td>借款方资产情况:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57"></textarea></td>
									</tr>
									<tr>
										<td>借款方资金用途:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57"></textarea></td>
									</tr>
									<tr>
										<td>风险控制措施:</td>
										<td><textarea name="textarea"
												rows="5" cols="57"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="C">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<td width="180">借款方图片：</td>
										<td><div class="swfUploadBar clearfix">
												<span id="spanButtonPlaceholder"></span>
												<div id="divFileProgressContainer"></div>
											</div></td>

									</tr>
									<tr>
										<td>图片预览：</td>
										<td>
											<div id="thumbnails"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="D">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tbody>
									<tr>
										<td width="180">原始债权金额：</td>
										<td><input class="input" name="options[site_name]"
											type="text"></td>
									</tr>
									<tr>
										<td>原始债务人：</td>
										<td><input class="input" name="options[site_host]"
											type="text"></td>
									</tr>
									<tr>
										<td>原始债权年化利率：</td>
										<td><input class="input" name="options[site_root]"
											type="text"></td>
									</tr>
									<tr>
										<td>原始债权起止日期：</td>
										<td><input class="input" name="options[site_root]10"
											type="text"></td>
									</tr>
									<tr>
										<td>原始债权期限：</td>
										<td><input class="input" name="options[site_host]2"
											type="text"></td>
									</tr>
									<tr>
										<td>总流转期数：</td>
										<td><input class="input" name="options[site_root]9"
											type="text"></td>
									</tr>
									<tr>
										<td>流转总金额：</td>
										<td><input class="input" name="options[site_root]2"
											type="text"></td>
									</tr>
									<tr>
										<td>每期流转份数：</td>
										<td><input class="input" name="options[site_root]3"
											type="text"></td>
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

			</fieldset>
		</form>
	</div>
	<script type="text/javascript" src="statics/js/common.js"></script>
	<script>
		/////---------------------
		Wind.use('validate', 'ajaxForm', 'artDialog', function() {
			//javascript
			var form = $('form.J_ajaxForms');
			//ie处理placeholder提交问题
			if ($.browser.msie) {
				form.find('[placeholder]').each(function() {
					var input = $(this);
					if (input.val() == input.attr('placeholder')) {
						input.val('');
					}
				});
			}
			//表单验证开始
			form.validate({
				//是否在获取焦点时验证
				onfocusout : false,
				//是否在敲击键盘时验证
				onkeyup : false,
				//当鼠标掉级时验证
				onclick : false,
				//验证错误
				showErrors : function(errorMap, errorArr) {
					//errorMap {'name':'错误信息'}
					//errorArr [{'message':'错误信息',element:({})}]
					try {
						$(errorArr[0].element).focus();
						art.dialog({
							id : 'error',
							icon : 'error',
							lock : true,
							fixed : true,
							background : "#CCCCCC",
							opacity : 0,
							content : errorArr[0].message,
							cancelVal : '确定',
							cancel : function() {
								$(errorArr[0].element).focus();
							}
						});
					} catch (err) {
					}
				},
				//验证规则
				rules : {
					'options[site_name]' : {
						required : 1
					},
					'options[site_host]' : {
						required : 1
					},
					'options[site_root]' : {
						required : 1
					}
				},
				//验证未通过提示消息
				messages : {
					'options[site_name]' : {
						required : '请输入网站名称！'
					},
					'options[site_host]' : {
						required : '请输入网站域名！'
					},
					'options[site_root]' : {
						required : '请输入安装路径！'
					}
				},
				//给未通过验证的元素加效果,闪烁等
				highlight : false,
				//是否在获取焦点时验证
				onfocusout : false,
				//验证通过，提交表单
				submitHandler : function(forms) {
					$(forms).ajaxSubmit({
						url : form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
						dataType : 'json',
						beforeSubmit : function(arr, $form, options) {

						},
						success : function(data, statusText, xhr, $form) {
							if (data.status) {
								setCookie("refersh_time", 1);
								//添加成功
								Wind.use("artDialog", function() {
									art.dialog({
										id : "succeed",
										icon : "succeed",
										fixed : true,
										lock : true,
										background : "#CCCCCC",
										opacity : 0,
										content : data.info,
										button : [ {
											name : '确定',
											callback : function() {
												return true;
											},
											focus : true
										}, {
											name : '关闭',
											callback : function() {
												return true;
											}
										} ]
									});
								});
							} else {
								alert(data.info);
							}
						}
					});
				}
			});
		});
		////-------------------------
	</script>
	<script type="text/javascript">
		(function() {
			var tab_tit = document.getElementById('think_page_trace_tab_tit')
					.getElementsByTagName('span');
			var tab_cont = document.getElementById('think_page_trace_tab_cont')
					.getElementsByTagName('div');
			var open = document.getElementById('think_page_trace_open');
			var close = document.getElementById('think_page_trace_close').childNodes[0];
			var trace = document.getElementById('think_page_trace_tab');
			var cookie = document.cookie
					.match(/thinkphp_show_page_trace=(\d\|\d)/);
			var history = (cookie && typeof cookie[1] != 'undefined' && cookie[1]
					.split('|'))
					|| [ 0, 0 ];
			open.onclick = function() {
				trace.style.display = 'block';
				this.style.display = 'none';
				close.parentNode.style.display = 'block';
				history[0] = 1;
				document.cookie = 'thinkphp_show_page_trace='
						+ history.join('|')
			}
			close.onclick = function() {
				trace.style.display = 'none';
				this.parentNode.style.display = 'none';
				open.style.display = 'block';
				history[0] = 0;
				document.cookie = 'thinkphp_show_page_trace='
						+ history.join('|')
			}
			for (var i = 0; i < tab_tit.length; i++) {
				tab_tit[i].onclick = (function(i) {
					return function() {
						for (var j = 0; j < tab_cont.length; j++) {
							tab_cont[j].style.display = 'none';
							tab_tit[j].style.color = '#999';
						}
						tab_cont[i].style.display = 'block';
						tab_tit[i].style.color = '#000';
						history[1] = i;
						document.cookie = 'thinkphp_show_page_trace='
								+ history.join('|')
					}
				})(i)
			}
			parseInt(history[0]) && open.click();
			tab_tit[history[1]].click();
		})();
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