<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a
					href="/newadmin-msg_email-index-menuid-148.shtml">站内信通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">借款者提醒相关</a></li>
			<li><a href="#">投资者提醒相关</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
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
								name="msgSite[site_borrow_check_success][title]"
								id="msgSite[site_borrow_check_success][title]" value="初审通过" /><span
								class="commonToolTip">标题(borrow_check_success)</span></td>
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
								<textarea name="msgSite[site_borrow_check_success][content]"
									id="msgSite[site_borrow_check_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，你发布的#BORROW_NAME#(标号为#BORROW_ID#)初审已通过。</p><p>
										<br />
									</p><p style="text-align: center;">
										<span style="text-align: center;">xxxxx</span>
									</p><p style="text-align: center;">
										<span style="text-align: center;"><span
											style="text-align: center;">服务热线：</span><span
											style="text-align: center;"><span
												style="text-align: center;">400-758-8028</span></span></span>
									</p></textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_borrow_check_success][content]");
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
								name="msgSite[site_borrow_check_fail][title]"
								id="msgSite[site_borrow_check_fail][title]" value="初审未通过" /><span
								class="commonToolTip">标题(borrow_check_fail)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_borrow_check_fail][content]"
									id="msgSite[site_borrow_check_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，你发布的#BORROW_NAME#(标号为#BORROW_ID#)初审未已通过。</p><p>
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
												.getEditor("msgSite[site_borrow_check_fail][content]");
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
								4.#DEAL_INFO#：审核说明</td>
						</tr>
						<tr>
							<th width="200">标题：</th>
							<td><input type="text" class="input"
								name="msgSite[site_borrow_recheck_success][title]"
								id="msgSite[site_borrow_recheck_success][title]" value="复审通过" /><span
								class="commonToolTip">标题(borrow_recheck_success)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_borrow_recheck_success][content]"
									id="msgSite[site_borrow_recheck_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，你发布的#BORROW_NAME#(标号为#BORROW_ID#)复审已通过。</p><p>
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
												.getEditor("msgSite[site_borrow_recheck_success][content]");
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
								name="msgSite[site_borrow_recheck_fail][title]"
								id="msgSite[site_borrow_recheck_fail][title]" value="复审未通过" /><span
								class="commonToolTip">标题(borrow_recheck_fail)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_borrow_recheck_fail][content]"
									id="msgSite[site_borrow_recheck_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，你发布的#BORROW_NAME#(标号为#BORROW_ID#)复审未通过。</p><p>
										<span style="text-align: center;"><br /></span>
									</p><p style="text-align: center;">
										<span style="text-align: center;"></span>
									</p><p style="text-align: center;">xxxxx</p><p
										style="text-align: center;">服务热线：<span
											style="text-align: center;">400-758-8028</span>
									</p><p style="text-align: center;">
										<span style="text-align: center;"><br /></span><br />
									</p></textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_borrow_recheck_fail][content]");
										_editorAll.push(_editor);
									</script><span
								class="commonToolTip">(borrow_recheck_fail)</span></td>
						</tr>
					</table>

				</div>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
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
								name="msgSite[site_invest_invest_money][title]"
								id="msgSite[site_invest_invest_money][title]" value="投标成功" /><span
								class="commonToolTip">标题(invest_invest_money)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_invest_invest_money][content]"
									id="msgSite[site_invest_invest_money][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 已投标成功。</p><p>
										<br />
									</p><p style="text-align: center;">xxxxx</p><p
										style="text-align: center;">服务热线：<span
											style="text-align: center;">400-758-8028</span>
									</p><p style="text-align: center;">
										<span style="text-align: center;"></span><br />
									</p></textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_invest_money][content]");
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
								name="msgSite[site_invest_recheck_success][title]"
								id="msgSite[site_invest_recheck_success][title]" value="投标复审通过" /><span
								class="commonToolTip">标题(invest_recheck_success)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_invest_recheck_success][content]"
									id="msgSite[site_invest_recheck_success][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 已经通过复审审核了。</p><p>
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
												.getEditor("msgSite[site_invest_recheck_success][content]");
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
								name="msgSite[site_invest_recheck_fail][title]"
								id="msgSite[site_invest_recheck_fail][title]" value="投标复审未通过" /><span
								class="commonToolTip">标题(invest_recheck_fail)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_invest_recheck_fail][content]"
									id="msgSite[site_invest_recheck_fail][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您的标名 #BORROW_NAME#（标号#BORROW_ID#）#INVEST_MONEY# 未通过复审审核。</p><p>
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
												.getEditor("msgSite[site_invest_recheck_fail][content]");
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
								name="msgSite[site_invest_get_repayment][title]"
								id="msgSite[site_invest_get_repayment][title]" value="收到还款" /><span
								class="commonToolTip">标题(invest_get_repaymentl)</span></td>
						</tr>
						<tr>
							<th>邮件内容：</th>
							<td><textarea
									name="msgSite[site_invest_get_repayment][content]"
									id="msgSite[site_invest_get_repayment][content]"><p>尊敬的客户：#UserName#</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您好，您投的标名 #BORROW_NAME#（标号#BORROW_ID#）#ReceiveMoney# 已还款，请查收。</p><p>
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
												.getEditor("msgSite[site_invest_get_repayment][content]");
										_editorAll.push(_editor);
									</script><span
								class="commonToolTip">(invest_get_repayment)</span></td>
						</tr>
					</table>


				</div>
			</form>
		</div>
		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">保存</button>
				&nbsp;&nbsp;<a href="javascript:;"
					onclick="window.history.back(-1);return false;">返回</a>
			</div>
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