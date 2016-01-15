<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">网站信息</a></li>
			<li><a href="#B" data-toggle="tab">SEO设置</a></li>
			<li><a href="#C" data-toggle="tab">URL设置</a></li>
			<li><a href="#D" data-toggle="tab">用户同步</a></li>
			<li><a href="#E" data-toggle="tab">评论设置</a></li>
			<li><a href="#F" data-toggle="tab">用户名过滤</a></li>
			<li><a href="#G" data-toggle="tab">URL美化</a></li>
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
										<td width="180">网站名称：</td>
										<td><input class="input" name="options[site_name]"
											value="鼎峰P2PX演示" type="text"><span
											class="must_red">*</span> <input class="input"
											name="option_id" value="1" type="hidden"></td>
									</tr>
									<tr>
										<td>网站域名：</td>
										<td><input class="input" name="options[site_host]"
											value="http://tc2.im/" type="text"><span
											class="must_red">*</span></td>
									</tr>
									<tr>
										<td>安装路径：</td>
										<td><input class="input" name="options[site_root]"
											value="/" type="text"><span class="must_red">*&nbsp;&nbsp;如安装在根目录请填“/”</span></td>
									</tr>
									<tr>
										<td>模版方案：</td>
										<td><select name="options[site_tpl]"
											class="normal_select">
												<option value="simplebootx" selected="selected">simplebootx</option>
												<option value="simplebootx_mobile">simplebootx_mobile</option>
												<option value="simplebootx_mobile1">simplebootx_mobile1</option>
										</select></td>
									</tr>
									<tr>
										<td>开启手机模板：</td>
										<td><label class="checkbox inline"> <input
												name="options[mobile_tpl_enabled]" value="1" type="checkbox">
										</label></td>
									</tr>
									<tr>
										<td>后台风格：</td>
										<td><select name="options[site_adminstyle]"
											class="normal_select">
												<option value="bluesky">bluesky</option>
												<option value="flat" selected="selected">flat</option>
										</select></td>
									</tr>
									<tr>
										<td>备案信息：</td>
										<td><input class="input" name="options[site_icp]"
											value="dsadsadasdad" type="text"></td>
									</tr>
									<tr>
										<td>站长邮箱：</td>
										<td><input class="input" name="options[site_admin_email]"
											value="cmf@simplewind.net" type="text"></td>
									</tr>
									<tr>
										<td>统计代码：</td>
										<td><textarea name="options[site_tongji]" rows="5"
												cols="57">&lt;script
 type="text/javascript"&gt;
var _bdhmProtocol = (("https:" == document.location.protocol) ? " 
https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + 
"hm.baidu.com/h.js%3F044359aebafa125f0f2eacde160487cd' 
type='text/javascript'%3E%3C/script%3E"));
&lt;/script&gt; </textarea></td>
									</tr>
									<tr>
										<td>版权信息：</td>
										<td><textarea name="options[site_copyright]" rows="5"
												cols="57"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="B">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tbody>
									<tr>
										<td width="180">SEO标题:</td>
										<td><input class="input" name="options[site_seo_title]"
											value="鼎峰P2PX演示" type="text"></td>
									</tr>
									<tr>
										<td>SEO关键字:</td>
										<td><input class="input"
											name="options[site_seo_keywords]" type="text"></td>
									</tr>
									<tr>
										<td>SEO描述:</td>
										<td><textarea name="options[site_seo_description]"
												rows="5" cols="57"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="C">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<tbody>
									<tr>
										<td width="180">url模式：</td>
										<td><select name="options[urlmode]" class="normal_select">
												<option value="0">普通模式</option>
												<option value="1">PATHINFO模式</option>
												<option value="2" selected="selected">REWRITE模式</option>
										</select> <span class="must_red">*&nbsp;&nbsp;如果你开启的是REWRITE模式，请确保服务器支持REWRITE；</span>
										</td>
									</tr>
									<tr>
										<td>URL伪静态后缀：</td>
										<td><input class="input" name="options[html_suffix]"
											value="html" type="text"><span class="must_red">&nbsp;&nbsp;普通模式不支持</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="D">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<td width="200">开启Ucenter:</td>
										<td><input class="J_check"
											name="options[ucenter_enabled]" value="1" type="checkbox"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="E">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<td width="200">评论审核:</td>
										<td><input class="J_check"
											name="options[comment_need_check]" value="1" type="checkbox"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="F">
							<table class="table_form" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<td width="200">特殊用户名:</td>
										<td><textarea name="cmf_settings[banned_usernames]"
												rows="5" cols="57">鼎峰P2P,admin,cmf</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="G">
							<form class="J_ajaxForm" name="myform" id="myform"
								action="{:U('route/listorders')}" method="post">
								<fieldset>
									<div class="tabbable">
										<div class="tab-content">
											<div class="tab-pane active" id="A">
												<table width="100%" class="table table-hover">
													<thead>
														<tr>
															<th width="50">排序</th>
															<th width="50">ID</th>
															<th>原始网址</th>
															<th>显示网址</th>
															<th>状态</th>
															<th width="120">操作</th>
														</tr>
													</thead>
													<tbody>
														<php>$statuses=array('0'=>"已禁用","1"=>"已启用");</php>
														<tr>
															<td><input name='listorders'
																class="input input-order mr5" type='text' size='3'
																value=''></td>
															<td>45</td>
															<td>www.baidu.com</td>
															<td>www.baidu.com</td>
															<td>已禁用</td>
															<td><a href="#">修改</a>| <a href="#"
																class="J_ajax_dialog_btn" data-msg="确定启用吗？">启用</a>| <a
																href="#" class="J_ajax_dialog_btn" data-msg="确定禁用吗？">禁用</a>|
																<a href="#" class="J_ajax_del">删除</a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
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
</body>
</html>