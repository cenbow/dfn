<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="/newadmin-cache_borrow_fee-index-menuid-123.shtml">邮件通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">注册激活</a></li>
			<li><a href="#B" data-toggle="tab">借款者提醒相关</a></li>
			<li><a href="#C" data-toggle="tab">投资款者提醒相关</a></li>
		</ul>
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="h_a">注册激活</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#LINK#:激活链接 2.#UserName#:用户名</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[reg][title]" id="msgEmail[reg][title]"
											value="光谷惠众注册账户激活" /><span class="commonToolTip">标题(reg)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><script type="text/javascript">
											window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
											window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
											var _editorAll = [];
										</script>

											<script type="text/javascript" charset="utf-8"
												src="http://www.ggmoney.com/statics/editer/uedit/editor_config.js"></script>

											<script type="text/javascript" charset="utf-8"
												src="http://www.ggmoney.com/statics/editer/uedit/editor_all_min.js"></script>
											<textarea name="msgEmail[reg][content]"
												id="msgEmail[reg][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp;您好，感谢您注册光谷惠众，您可以点击 #LINK# 激活你的账号!</p><p> &nbsp; &nbsp; &nbsp;(如上面的链接无法点击，您也可以复制链接，粘贴到您浏览器的地址内，然后按“回车Enter”键)</p><p> &nbsp; &nbsp; &nbsp;感谢您光临光谷惠众用户中心，我们的宗旨：为您提供优秀的产品和优质的服务！</p><p> &nbsp; &nbsp; &nbsp;现在就登录吧！http://www.ggmoney.com/。</p><p
													style="text-align: left">
													<br />
												</p><p style="text-align: center;">
													<br />
												</p><p style="text-align: center;">服务热线：400-758-8028</p><p
													style="text-align: left">
													<br />
												</p><p style="text-align: left">此为自动发送邮件，请务直接回复！</p></textarea> <script
												type="text/javascript">
													window.UEDITOR_CONFIG.initialFrameHeight = 100
												</script>

											<script type="text/javascript">
												var _editor = UE
														.getEditor("msgEmail[reg][content]");
												_editorAll.push(_editor);
											</script><span
											class="commonToolTip">(reg)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">找回密码</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#LINK#:激活链接 2.#UserName#:用户名</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[getPassWord][title]"
											id="msgEmail[getPassWord][title]" value="光谷惠众找回密码" /><span
											class="commonToolTip">标题(getPassWord)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea name="msgEmail[getPassWord][content]"
												id="msgEmail[getPassWord][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 您申请了密码找回，您可以点击下面链接找回密码!</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 请点击：#LINK#</p><p>
													<br />
												</p><p style="text-align: center;">
													<br />
												</p><p style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><br />
												</p></textarea> <script type="text/javascript">
													window.UEDITOR_CONFIG.initialFrameHeight = 100
												</script>

											<script type="text/javascript">
												var _editor = UE
														.getEditor("msgEmail[getPassWord][content]");
												_editorAll.push(_editor);
											</script><span
											class="commonToolTip">(getPassWord)</span></td>
									</tr>
								</table>


							</div>
						</div>

						<div class="tab-pane" id="B">
							<div class="h_a">初审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[borrow_check_success][title]"
											id="msgEmail[borrow_check_success][title]" value="初审通过" /><span
											class="commonToolTip">标题(borrow_check_success)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[borrow_check_success][content]"
												id="msgEmail[borrow_check_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）已通过审核。</p><p>
													<br />
												</p><p>
													<br />
												</p><p style="text-align: center;">
													<br />
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_check_success][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(borrow_check_success)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">初未审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[borrow_check_fail][title]"
											id="msgEmail[borrow_check_fail][title]" value="初审末通过" /><span
											class="commonToolTip">标题(borrow_check_fail)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea name="msgEmail[borrow_check_fail][content]"
												id="msgEmail[borrow_check_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）初审未通过。</p><p>
													<br />
												</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_check_fail][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(borrow_check_fail)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">复审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
										</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[borrow_recheck_success][title]"
											id="msgEmail[borrow_recheck_success][title]" value="复审通过" /><span
											class="commonToolTip">标题(borrow_recheck_success)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[borrow_recheck_success][content]"
												id="msgEmail[borrow_recheck_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）已通过复审审核。</p><p>
													<br />
												</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"><span
														style="text-align: center;"></span></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_recheck_success][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(borrow_recheck_success)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">复审未通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[borrow_recheck_fail][title]"
											id="msgEmail[borrow_recheck_fail][title]" value="复审未通过" /><span
											class="commonToolTip">标题(borrow_recheck_fail)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[borrow_recheck_fail][content]"
												id="msgEmail[borrow_recheck_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）未通过复审审核了。</p><p>
													<br />
												</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"><span
														style="text-align: center;"></span></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_recheck_fail][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(borrow_recheck_fail)</span></td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="C">
							<div class="h_a">投标操作</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#INVEST_MONEY#:投标金额</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[invest_invest_money][title]"
											id="msgEmail[invest_invest_money][title]" value="投标成功" /><span
											class="commonToolTip">标题(invest_invest_money)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[invest_invest_money][content]"
												id="msgEmail[invest_invest_money][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 已投标成功。</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_invest_money][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(invest_invest_money)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">所投标复审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[invest_recheck_success][title]"
											id="msgEmail[invest_recheck_success][title]" value="投标复审成功" /><span
											class="commonToolTip">标题(invest_recheck_success)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[invest_recheck_success][content]"
												id="msgEmail[invest_recheck_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 已经通过复审审核了。</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_recheck_success][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(invest_recheck_success)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">所投标复审未通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[invest_recheck_fail][title]"
											id="msgEmail[invest_recheck_fail][title]" value="复审未通过" /><span
											class="commonToolTip">标题(invest_recheck_fail)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[invest_recheck_fail][content]"
												id="msgEmail[invest_recheck_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 未通过审核。</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_recheck_fail][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(invest_recheck_fail)</span></td>
									</tr>
								</table>
							</div>
							<div class="h_a">收到还款</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#：用户名
											4.#ReceiveMoney#：收到的还款金额</td>
									</tr>
									<tr>
										<th width="200">标题：</th>
										<td><input type="text" class="input"
											name="msgEmail[invest_get_repayment][title]"
											id="msgEmail[invest_get_repayment][title]" value="收到还款" /><span
											class="commonToolTip">标题(invest_get_repayment)</span></td>
									</tr>
									<tr>
										<th>邮件内容：</th>
										<td><textarea
												name="msgEmail[invest_get_repayment][content]"
												id="msgEmail[invest_get_repayment][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您投的标名 #BORROW_NAME#（标号#BORROW_ID#）#ReceiveMoney# 已还款，请查收。</p><p>
													<br />
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span>
												</p><p style="text-align: center;">xxxxx</p><p
													style="text-align: center;">服务热线：<span
														style="text-align: center;">400-758-8028</span>
												</p><p style="text-align: center;">
													<span style="text-align: center;"></span><span
														style="color: #666666; font-family: arial; font-size: 12px; line-height: 18px; background-color: #ffffff;"></span><br />
												</p></textarea> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_get_repayment][content]");
													_editorAll.push(_editor);
												</script><span
											class="commonToolTip">(invest_get_repayment)</span></td>
									</tr>
								</table>

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


					</div>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		function _beforeGetValue() {
			$.each(_editorAll, function(k, v) {
				v.sync();
			})
		}
	</script>


	<script type="text/javascript"
		src="${AdminStatics}/js/ajaxfileupload.js"></script>

</body>
</html>