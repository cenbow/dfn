<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a href="${dfn:U('admin/msg_site/index')}">站内信通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">借款者提醒相关</a></li>
			<li><a href="#">投资者提醒相关</a></li>
		</ul>
	<form method="post" class="form-horizontal J_ajaxForm"
		action="${dfn:U('admin/msg_site/editMsg_site')}">
		<dfTag:token/>
		
		<div class="common-form">
				<div >初审通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_borrow_check_success][title]", data['msgSite']['site_borrow_check_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(borrow_check_success)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <script type="text/javascript">
								window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
								window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
								var _editorAll = [];
							</script> <script type="text/javascript" charset="utf-8"
									src="${AdminStatics}/js/ueditor/ueditor.config.js"></script> <script
									type="text/javascript" charset="utf-8"
									src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script> 
									<textarea style="width:70%;height:300px;"
									name="msgSite[site_borrow_check_success][content]"
									id="msgSite[site_borrow_check_success][content]">${ data['msgSite']['site_borrow_check_success']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_borrow_check_success][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									${dfForm:editor("msgSite[site_borrow_check_success][content]",data['msgSite']['site_borrow_check_success']['content'],"")}
									<span class="commonToolTip">(borrow_check_success)</span></td>
						</tr>
					</table>
				</div>
				<div >初未审通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_borrow_check_fail][title]", data['msgSite']['site_borrow_check_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(borrow_check_fail)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_borrow_check_fail][content]"
									id="msgSite[site_borrow_check_fail][content]">${data['msgSite']['site_borrow_check_fail']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_borrow_check_fail][content]");
										_editorAll.push(_editor);
									</script>
									 --%>
									
									${dfForm:editor("msgSite[site_borrow_check_fail][content]",data['msgSite']['site_borrow_check_fail']['content'],"")}
									<span class="commonToolTip">(borrow_check_fail)</span></td>
						</tr>
					</table>
				</div>
				<div >复审通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_borrow_recheck_success][title]", data['msgSite']['site_borrow_recheck_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(borrow_recheck_success)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_borrow_recheck_success][content]"
									id="msgSite[site_borrow_recheck_success][content]">${data['msgSite']['site_borrow_recheck_success']['content']}</textarea>
								<script type="text/javascript">
									var _editor = UE
											.getEditor("msgSite[site_borrow_recheck_success][content]");
									_editorAll.push(_editor);
								</script> --%>
								
								
								${dfForm:editor("msgSite[site_borrow_recheck_success][content]",data['msgSite']['site_borrow_recheck_success']['content'],"")}
								<span class="commonToolTip">(borrow_recheck_success)</span></td>
						</tr>
					</table>
				</div>
				<div >复审未通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_borrow_recheck_fail][title]", data['msgSite']['site_borrow_recheck_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(borrow_recheck_fail)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_borrow_recheck_fail][content]"
									id="msgSite[site_borrow_recheck_fail][content]">${data['msgSite']['site_borrow_recheck_fail']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_borrow_recheck_fail][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									
									${dfForm:editor("msgSite[site_borrow_recheck_fail][content]",data['msgSite']['site_borrow_recheck_fail']['content'],"")}
									<span class="commonToolTip">(borrow_recheck_fail)</span></td>
						</tr>
					</table>

				</div>
		</div>

		<div style="display: none;" class="common-form">
				<div >投标操作</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#INVEST_MONEY#:投标金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_invest_money][title]", data['msgSite']['site_invest_invest_money']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_invest_money)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_invest_money][content]"
									id="msgSite[site_invest_invest_money][content]">${data['msgSite']['site_invest_invest_money']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_invest_money][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									
									${dfForm:editor("msgSite[site_invest_invest_money][content]",data['msgSite']['site_invest_invest_money']['content'],"")}
									<span class="commonToolTip">(invest_invest_money)</span></td>
						</tr>
					</table>
				</div>
				<div >所投标复审通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_recheck_success][title]", data['msgSite']['site_invest_recheck_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_recheck_success)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_recheck_success][content]"
									id="msgSite[site_invest_recheck_success][content]">${data['msgSite']['site_invest_recheck_success']['content']}</textarea>
								<script type="text/javascript">
									var _editor = UE
											.getEditor("msgSite[site_invest_recheck_success][content]");
									_editorAll.push(_editor);
								</script> --%>
								
								${dfForm:editor("msgSite[site_invest_recheck_success][content]",data['msgSite']['site_invest_recheck_success']['content'],"")}
								<span class="commonToolTip">(invest_recheck_success)</span></td>
						</tr>
					</table>
				</div>
				<div >所投标复审未通过</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
								4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_recheck_fail][title]", data['msgSite']['site_invest_recheck_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_recheck_fail)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_recheck_fail][content]"
									id="msgSite[site_invest_recheck_fail][content]">${data['msgSite']['site_invest_recheck_fail']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_recheck_fail][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									
									${dfForm:editor("msgSite[site_invest_recheck_fail][content]",data['msgSite']['site_invest_recheck_fail']['content'],"")}
									<span class="commonToolTip">(invest_recheck_fail)</span></td>
						</tr>
					</table>
				</div>
				<div >收到还款</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#：用户名
								4.#ReceiveMoney#：收到的还款金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_get_repayment][title]", data['msgSite']['site_invest_get_repayment']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_get_repaymentl)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_get_repayment][content]"
									id="msgSite[site_invest_get_repayment][content]">${data['msgSite']['site_invest_get_repayment']['content']}</textarea> <script
									type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_get_repayment][content]");
										_editorAll.push(_editor);
									</script>
									 --%>
									
									${dfForm:editor("msgSite[site_invest_get_repayment][content]",data['msgSite']['site_invest_get_repayment']['content'],"")}
									
									<span class="commonToolTip">(invest_get_repayment)</span></td>
						</tr>
					</table>

				</div>
				<div >投资债权转让</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#TRN_ID#:转让ID 2.#UserName#：用户名 3.#InvestMoney#：承接金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_do_creditassign][title]", data['msgSite']['site_invest_do_creditassign']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_do_creditassign)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_do_creditassign][content]"
									id="msgSite[site_invest_do_creditassign][content]">${data['msgSite']['site_invest_do_creditassign']['content']}</textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_do_creditassign][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									
									
									${dfForm:editor("msgSite[site_invest_do_creditassign][content]",data['msgSite']['site_invest_do_creditassign']['content'],"")}
									<span
								class="commonToolTip">(invest_do_creditassign)</span></td>
						</tr>
					</table>
				</div>
				<div >有人承接债权</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#TRN_ID#:转让ID 2.#UserName#：用户名 3.#InvestMoney#：承接金额</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_sale_creditassign][title]", data['msgSite']['site_invest_sale_creditassign']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_sale_creditassign)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea style="width:70%;height:300px;"
									name="msgSite[site_invest_sale_creditassign][content]"
									id="msgSite[site_invest_sale_creditassign][content]">${data['msgSite']['site_invest_sale_creditassign']['content']}</textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_sale_creditassign][content]");
										_editorAll.push(_editor);
									</script> --%>
									
									
									
									${dfForm:editor("msgSite[site_invest_sale_creditassign][content]",data['msgSite']['site_invest_sale_creditassign']['content'],"")}
									<span
								class="commonToolTip">(invest_sale_creditassign)</span></td>
						</tr>
					</table>
				</div>
				<div >达到活动条件</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">可用参数：</th>
							<td>1.#InvestMoney#:总投资金额 2.#UserName#：用户名</td>
						</tr>
						<tr>
							<th width="200" class="control-label">标题：</th>
							<td>${dfForm:input( "msgSite[site_invest_activity][title]", data['msgSite']['site_invest_activity']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
								class="commonToolTip">标题(invest_activity)</span></td>
						</tr>
						<tr>
							<th class="control-label">邮件内容：</th>
							<td><%-- <textarea  style="width:70%;height:300px;" name="msgSite[site_invest_activity][content]"
									id="msgSite[site_invest_activity][content]">${data['msgSite']['site_invest_activity']['content']}</textarea> <script type="text/javascript">
										var _editor = UE
												.getEditor("msgSite[site_invest_activity][content]");
										_editorAll.push(_editor);
									</script>
									 --%>
									
									
									
									${dfForm:editor("msgSite[site_invest_activity][content]",data['msgSite']['site_invest_activity']['content'],"")}
									<span
								class="commonToolTip">(invest_activity)</span></td>
						</tr>
					</table>
				</div>

			</div>
				<div class="form-actions">
									<button type="submit"
										class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
									&nbsp;&nbsp;<a class="btn" href="javascript:;"
										onClick="window.history.back(-1);return false;">返回</a>
				</div>
		</form>

	</div>
	
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
	</script>
	<script type="text/javascript">
	function _beforeGetValue(){
		$("input[type='file']").remove();
		$.each(_editorAll,function(k,v){
			v.sync();
		})
	}
	</script>

	<%@ include file="../Common/footer.jsp"%>	