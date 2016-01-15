<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">支付接口配置</a></li>
			<li><a href="#">线下充值银行</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="wrap J_check_wrap">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#A" data-toggle="tab">宝付</a></li>
						<li><a href="#B" data-toggle="tab">网银在线</a></li>
						<li><a href="#C" data-toggle="tab">智付</a></li>
						<li><a href="#D" data-toggle="tab">腾付通</a></li>
						<li><a href="#E" data-toggle="tab">通联支付</a></li>
						<li><a href="#F" data-toggle="tab">新生支付</a></li>
						<li><a href="#G" data-toggle="tab">财付通</a></li>
						<li><a href="#H" data-toggle="tab">环讯</a></li>
						<li><a href="#I" data-toggle="tab">国付宝</a></li>
					</ul>
					<form class="J_ajaxForms" name="myform" id="myform"
						action="/admin/setting/site_post.html" method="post">
						<fieldset>
							<div class="tabbable">
								<div class="tab-content">
									<div class="tab-pane active" id="A">
										<div class="h_a">宝付</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" checked="checked"
														name="pay[baofoo][enable]" value="1"
														id="pay[baofoo][enable]_1"><label
														for="pay[baofoo][enable]_1">是</label><input type="radio"
														name="pay[baofoo][enable]" value="0"
														id="pay[baofoo][enable]_2"><label
														for="pay[baofoo][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[baofoo][name]" id="pay[baofoo][name]" value="宝付" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[baofoo][feerate]" id="pay[baofoo][feerate]"
														value="0.2" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[baofoo][MerCode]" id="pay[baofoo][MerCode]"
														value="123" /></td>
												</tr>
												<tr>
													<th>商户证书：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[baofoo][pkey]"
														id="pay[baofoo][pkey]" value="123123" /></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="B">
										<div class="h_a">网银在线</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" checked="checked"
														name="pay[chinabank][enable]" value="1"
														id="pay[chinabank][enable]_1"><label
														for="pay[chinabank][enable]_1">是</label><input
														type="radio" name="pay[chinabank][enable]" value="0"
														id="pay[chinabank][enable]_2"><label
														for="pay[chinabank][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[chinabank][name]" id="pay[chinabank][name]"
														value="网银在线" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[chinabank][feerate]"
														id="pay[chinabank][feerate]" value="100" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[chinabank][MerCode]"
														id="pay[chinabank][MerCode]" value="22834342" /></td>
												</tr>
												<tr>
													<th>商户key：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[chinabank][MerKey]"
														id="pay[chinabank][MerKey]"
														value="2013jiudairuiyingHUA1206" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="C">
										<div class="h_a">智付</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[dinpay][enable]"
														value="1" id="pay[dinpay][enable]_1"><label
														for="pay[dinpay][enable]_1">是</label><input type="radio"
														name="pay[dinpay][enable]" value="0"
														id="pay[dinpay][enable]_2"><label
														for="pay[dinpay][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[dinpay][name]" id="pay[dinpay][name]" value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[dinpay][feerate]" id="pay[dinpay][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商家号：</th>
													<td><input type="text" class="input"
														name="pay[dinpay][MerCode]" id="pay[dinpay][MerCode]"
														value="" /></td>
												</tr>
												<tr>
													<th>密钥：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[dinpay][key]"
														id="pay[dinpay][key]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="D">
										<div class="h_a">腾付通</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[tftpay][enable]"
														value="1" id="pay[tftpay][enable]_1"><label
														for="pay[tftpay][enable]_1">是</label><input type="radio"
														name="pay[tftpay][enable]" value="0"
														id="pay[tftpay][enable]_2"><label
														for="pay[tftpay][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[tftpay][name]" id="pay[tftpay][name]" value="" /></td>
												</tr>
												<tr>
													<th>手续费：</th>
													<td><input type="text" class="input"
														name="pay[tftpay][feerate]" id="pay[tftpay][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户id：</th>
													<td><input type="text" class="input"
														name="pay[tftpay][MerCode]" id="pay[tftpay][MerCode]"
														value="" /></td>
												</tr>
												<tr>
													<th>私钥密码：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[tftpay][key]"
														id="pay[tftpay][key]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="E">
										<div class="h_a">通联支付</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[allinpay][enable]"
														value="1" id="pay[allinpay][enable]_1"><label
														for="pay[allinpay][enable]_1">是</label><input type="radio"
														name="pay[allinpay][enable]" value="0"
														id="pay[allinpay][enable]_2"><label
														for="pay[allinpay][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[allinpay][name]" id="pay[allinpay][name]"
														value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[allinpay][feerate]" id="pay[allinpay][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[allinpay][MerCode]" id="pay[allinpay][MerCode]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户key：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[allinpay][key]"
														id="pay[allinpay][key]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="F">
										<div class="h_a">新生支付</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[hanpay][enable]"
														value="1" id="pay[hanpay][enable]_1"><label
														for="pay[hanpay][enable]_1">是</label><input type="radio"
														name="pay[hanpay][enable]" value="0"
														id="pay[hanpay][enable]_2"><label
														for="pay[hanpay][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[hanpay][name]" id="pay[hanpay][name]" value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[hanpay][feerate]" id="pay[hanpay][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[hanpay][MerCode]" id="pay[hanpay][MerCode]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户key：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[hanpay][pkey]"
														id="pay[hanpay][pkey]" value="" /></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="tab-pane" id="G">
										<div class="h_a">财付通</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[tenpay][enable]"
														value="1" id="pay[tenpay][enable]_1"><label
														for="pay[tenpay][enable]_1">是</label><input type="radio"
														name="pay[tenpay][enable]" value="0"
														id="pay[tenpay][enable]_2"><label
														for="pay[tenpay][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[tenpay][name]" id="pay[tenpay][name]" value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[tenpay][feerate]" id="pay[tenpay][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[tenpay][partner]" id="pay[tenpay][partner]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户key：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[tenpay][key]"
														id="pay[tenpay][key]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="H">
										<div class="h_a">环讯</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[ips][enable]"
														value="1" id="pay[ips][enable]_1"><label
														for="pay[ips][enable]_1">是</label><input type="radio"
														name="pay[ips][enable]" value="0" id="pay[ips][enable]_2"><label
														for="pay[ips][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[ips][name]" id="pay[ips][name]" value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[ips][feerate]" id="pay[ips][feerate]" value="" /></td>
												</tr>
												<tr>
													<th>商户号：</th>
													<td><input type="text" class="input"
														name="pay[ips][MerCode]" id="pay[ips][MerCode]" value="" /></td>
												</tr>
												<tr>
													<th>商户key：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[ips][MerKey]"
														id="pay[ips][MerKey]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="I">
										<div class="h_a">国付宝</div>
										<div class="table_full">
											<table width="100%" class="table_form ">
												<tr>
													<th width="200">是否启用：</th>
													<td><input type="radio" name="pay[guofubao][enable]"
														value="1" id="pay[guofubao][enable]_1"><label
														for="pay[guofubao][enable]_1">是</label><input type="radio"
														name="pay[guofubao][enable]" value="0"
														id="pay[guofubao][enable]_2"><label
														for="pay[guofubao][enable]_2">否</label></select></td>
												</tr>
												<tr>
													<th>显示名称：</th>
													<td><input type="text" class="input"
														name="pay[guofubao][name]" id="pay[guofubao][name]"
														value="" /></td>
												</tr>
												<tr>
													<th>充值手续费：</th>
													<td><input type="text" class="input"
														name="pay[guofubao][feerate]" id="pay[guofubao][feerate]"
														value="" /></td>
												</tr>
												<tr>
													<th>商户代码：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[guofubao][merchantID]"
														id="pay[guofubao][merchantID]" value="" /></td>
												</tr>
												<tr>
													<th>商户识别码：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[guofubao][VerficationCode]"
														id="pay[guofubao][VerficationCode]" value="" /></td>
												</tr>
												<tr>
													<th>国付宝帐号：</th>
													<td><input style="width: 300px" type="text"
														class="input" name="pay[guofubao][virCardNoIn]"
														id="pay[guofubao][virCardNoIn]" value="" /></td>
												</tr>
											</table>
										</div>

									</div>
								</div>
							</div>
							<div class="btn_wrap">
								<div class="btn_wrap_pd">
									<button class="btn btn_submit mr10 J_ajax_submit_btn"
										type="submit">保存</button>
									&nbsp;&nbsp;<a href="javascript:;"
										onclick="window.history.back(-1);return false;">返回</a>
								</div>
							</div>
						</fieldset>
					</form>

				</div>

				<div style="display: none;" class="common-form">
					<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
						action="/newadmin-Article-doadd" method="post">
						<div class="J_tabs_contents">
							<div class="table_list">
								<table id="area_list" width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<thead>
										<tr>
											<th class="line_l">序号</th>
											<th class="line_l">银行名称</th>
											<th class="line_l">开户支行</th>
											<th class="line_l">银行帐户</th>
											<th class="line_l">开户人</th>
											<th class="line_l">操作</th>
										</tr>
									</thead>
								</table>

								<button class="btn" style="margin-top: 5px"
									onClick="addone();return false;">添加一个银行</button>
							</div>

							<script type="text/javascript">
								var xss = parseInt() || 0;
								function addone() {
									xss++;
									var htmladd = '<tr overstyle="on" id="list_'+xss+'">';
									htmladd += '<td>' + xss + '</td>';
									htmladd += '<td><input type="text" class="input" style="width:100px" name="payOff['+xss+'][name]" value="" /></td>';
									htmladd += '<td><input type="text" class="input" style="width:200px" name="payOff['+xss+'][start]" value="" /></td>';
									htmladd += '<td><input type="text" class="input" style="width:200px" name="payOff['+xss+'][end]" value="" /></td>';
									htmladd += '<td><input type="text" class="input" style="width:100px" name="payOff['+xss+'][icoName]" value="" /></td>';
									htmladd += '<td><a href="javascript:void(0);" onclick="delx('
											+ xss + ');">删除</a></td>';
									htmladd += '</tr>';
									$(htmladd).appendTo("#area_list");
								}
								function delx(id) {
									if (confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?"))
										$("#list_" + id).remove();
								}
							</script>
							<div style="overflow: hidden">
								<h2>线下充值注意事项:</h2>
								<script type="text/javascript">
									window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
									window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
									var _editorAll = [];
								</script>

								<script type="text/javascript" charset="utf-8"
									src="http://www.ggmoney.com/statics/editer/uedit/editor_config.js"></script>

								<script type="text/javascript" charset="utf-8"
									src="http://www.ggmoney.com/statics/editer/uedit/editor_all_min.js"></script>
								<textarea name="payOff[ps]" id="payOff[ps]"></textarea>



								<script type="text/javascript">
									var _editor = UE.getEditor("payOff[ps]");
									_editorAll.push(_editor);
								</script>
							</div>

						</div>
						<div class="btn_wrap">
							<div class="btn_wrap_pd">
								<button class="btn btn_submit mr10 J_ajax_submit_btn"
									type="submit">保存</button>
								&nbsp;&nbsp;<a href="javascript:;"
									onclick="window.history.back(-1);return false;">返回</a>
							</div>
						</div>


					</form>
				</div>
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
	<script type="text/javascript">
		function _beforeGetValue() {
			$.each(_editorAll, function(k, v) {
				v.sync();
			})
		}
	</script>

	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>