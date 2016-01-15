<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
<script type="text/javascript">
	window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
	window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
var _editorAll = [];
</script> <script type="text/javascript" charset="utf-8"
		src="${AdminStatics}/js/ueditor/ueditor.config.js"></script>

<script type="text/javascript" charset="utf-8"
	src="${AdminStatics}/js/ueditor/ueditor.all.min.js">
</script>
	<div class="wrap J_check_wrap">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a href="${dfn:U('admin/msg_email/index')}">邮件通知信息</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">注册激活</a></li>
			<li><a href="#B" data-toggle="tab">借款者提醒相关</a></li>
			<li><a href="#C" data-toggle="tab">投资款者提醒相关</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/msg_email/editMsg_email')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div>注册激活</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#LINK#:激活链接 2.#UserName#:用户名</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[reg][title]", data['msgEmail']['reg']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(reg)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td>
											<%-- <textarea  style="width:70%;height:300px;" name="msgEmail[reg][content]"
												id="msgEmail[reg][content]">${data['msgEmail']['reg']['content']}</textarea> <script
												type="text/javascript">
													window.UEDITOR_CONFIG.initialFrameHeight = 100
												</script> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[reg][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(reg)</span> --%>
												
												
												
											${dfForm:editor("msgEmail[reg][content]",data['msgEmail']['reg']['content'],"")}	
												
												</td>
									</tr>
								</table>
							</div>
							<div>找回密码</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#LINK#:激活链接 2.#UserName#:用户名</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[getPassWord][title]", data['msgEmail']['getPassWord']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(getPassWord)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea   style="width:70%;height:300px;" name="msgEmail[getPassWord][content]"
												id="msgEmail[getPassWord][content]">${data['msgEmail']['getPassWord']['content']}</textarea> 
												<script
												type="text/javascript">
													window.UEDITOR_CONFIG.initialFrameHeight = 100
												</script> <script type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[getPassWord][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(getPassWord)</span> --%>
												
												${dfForm:editor("msgEmail[getPassWord][content]",data['msgEmail']['getPassWord']['content'],"")}
												
												</td>
									</tr>
								</table>


							</div>
						</div>

						<div class="tab-pane" id="B">
							<div>初审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[borrow_check_success][title]", data['msgEmail']['borrow_check_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(borrow_check_success)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[borrow_check_success][content]"
												id="msgEmail[borrow_check_success][content]">${data['msgEmail']['borrow_check_success']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_check_success][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(borrow_check_success)</span> --%>
												
												${dfForm:editor("msgEmail[borrow_check_success][content]",data['msgEmail']['borrow_check_success']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>初未审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[borrow_check_fail][title]", data['msgEmail']['borrow_check_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(borrow_check_fail)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea   style="width:70%;height:300px;" name="msgEmail[borrow_check_fail][content]"
												id="msgEmail[borrow_check_fail][content]">${data['msgEmail']['borrow_check_fail']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_check_fail][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(borrow_check_fail)</span>
												 --%>
												${dfForm:editor("msgEmail[borrow_check_fail][content]",data['msgEmail']['borrow_check_fail']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>复审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
										</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[borrow_recheck_success][title]", data['msgEmail']['borrow_recheck_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(borrow_recheck_success)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[borrow_recheck_success][content]"
												id="msgEmail[borrow_recheck_success][content]">${data['msgEmail']['borrow_recheck_success']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_recheck_success][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(borrow_recheck_success)</span> --%>
												
												${dfForm:editor("msgEmail[borrow_recheck_success][content]",data['msgEmail']['borrow_recheck_success']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>复审未通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[borrow_recheck_fail][title]", data['msgEmail']['borrow_recheck_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(borrow_recheck_fail)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[borrow_recheck_fail][content]"
												id="msgEmail[borrow_recheck_fail][content]">${data['msgEmail']['borrow_recheck_fail']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[borrow_recheck_fail][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(borrow_recheck_fail)</span>
												 --%>
												${dfForm:editor("msgEmail[borrow_recheck_fail][content]",data['msgEmail']['borrow_recheck_fail']['content'],"")}
												
												</td>
									</tr>
								</table>


							</div>
						</div>


						<div class="tab-pane" id="C">
							<div>投标操作</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#INVEST_MONEY#:投标金额</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[invest_invest_money][title]", data['msgEmail']['invest_invest_money']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(invest_invest_money)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[invest_invest_money][content]"
												id="msgEmail[invest_invest_money][content]">${data['msgEmail']['invest_invest_money']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_invest_money][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(invest_invest_money)</span>
												 --%>
												${dfForm:editor("msgEmail[invest_invest_money][content]",data['msgEmail']['invest_invest_money']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>所投标复审通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[invest_recheck_success][title]", data['msgEmail']['invest_recheck_success']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(invest_recheck_success)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[invest_recheck_success][content]"
												id="msgEmail[invest_recheck_success][content]">${data['msgEmail']['invest_recheck_success']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_recheck_success][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(invest_recheck_success)</span>
												 --%>
												${dfForm:editor("msgEmail[invest_recheck_success][content]",data['msgEmail']['invest_recheck_success']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>所投标复审未通过</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#:用户名
											4.#DEAL_INFO#：审核说明 5:#INVEST_MONEY#：投标金额</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[invest_recheck_fail][title]", data['msgEmail']['invest_recheck_fail']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(invest_recheck_fail)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[invest_recheck_fail][content]"
												id="msgEmail[invest_recheck_fail][content]">${data['msgEmail']['invest_recheck_fail']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_recheck_fail][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(invest_recheck_fail)</span>
												 --%>
												${dfForm:editor("msgEmail[invest_recheck_fail][content]",data['msgEmail']['invest_recheck_fail']['content'],"")}
												
												</td>
									</tr>
								</table>
							</div>
							<div>收到还款</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">可用参数：</th>
										<td>1.#BORROW_ID#:标号 2.#BORROW_NAME#：标名 3.#UserName#：用户名
											4.#ReceiveMoney#：收到的还款金额</td>
									</tr>
									<tr>
										<th width="200" class="control-label">标题：</th>
										<td>${dfForm:input( "msgEmail[invest_get_repayment][title]", data['msgEmail']['invest_get_repayment']['title'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">标题(invest_get_repayment)</span></td>
									</tr>
									<tr>
										<th class="control-label">邮件内容：</th>
										<td><%-- <textarea  style="width:70%;height:300px;" 
												name="msgEmail[invest_get_repayment][content]"
												id="msgEmail[invest_get_repayment][content]">${data['msgEmail']['invest_get_repayment']['content']}</textarea> <script
												type="text/javascript">
													var _editor = UE
															.getEditor("msgEmail[invest_get_repayment][content]");
													_editorAll.push(_editor);
												</script><span class="commonToolTip">(invest_get_repayment)</span>
												 --%>
												
												
												${dfForm:editor("msgEmail[invest_get_repayment][content]",data['msgEmail']['invest_get_repayment']['content'],"")}
												
												</td>
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

					</div>
				</div>
			</fieldset>
		</form>
	</div>



<script type="text/javascript">
	function _beforeGetValue(){
		$("input[type='file']").remove();
		$.each(_editorAll,function(k,v){
			v.sync();
		})
	}
	function ckjump(obj){
		($(obj).val()==3)?$("#url").show():$("#url").hide();
	}
	</script>
	<%@ include file="../Common/footer.jsp"%>
 
