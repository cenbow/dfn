<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="${dfn:U('admin/cache_pay/index')}">第三方参数配置</a></li>
		</ul>
	</div>

	<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">托管参数配置</a></li>
			<li class=""><a href="#B" data-toggle="tab">宝付支付</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"	action="${dfn:U('admin/cache_pay/editCache_pay')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div >托管参数配置</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px" class="control-label">商户号：</th>
											<td>${dfForm:input( "chinapnr[MerId]", data['chinapnr']['MerId'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">客户号：</th>
										<td>${dfForm:input( "chinapnr[MerCustId]", data['chinapnr']['MerCustId'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">充值费支付方：</th>
										<td>${dfForm:select( "chinapnr[recharge_pay]",paySelect, data['chinapnr']['recharge_pay'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">提现费用支付方：</th>
										<td>${dfForm:select( "chinapnr[withdraw_pay]",paySelect, data['chinapnr']['withdraw_pay'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">公钥地址：</th>
										<td>${dfForm:input( "chinapnr[PubFile]", data['chinapnr']['PubFile'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">私钥地址：</th>
										<td>${dfForm:input( "chinapnr[PriFile]", data['chinapnr']['PriFile'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>

							</div>
						</div>

						<div class="tab-pane active" id="B">
							<div >宝付网关支付</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px" class="control-label">商户号：</th>
											<td>${dfForm:input( "baofoo[MemberID]", data['baofoo']['MemberID'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">终端号：</th>
										<td>${dfForm:input( "baofoo[TerminalID]", data['baofoo']['TerminalID'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">密钥：</th>
										<td>${dfForm:input( "baofoo[Md5key]", data['baofoo']['Md5key'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">是否开启：</th>
										<td>${dfForm:select( "baofoo[status]",openSelect, data['baofoo']['status'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">手续费比例：</th>
										<td>${dfForm:input( "baofoo[feeRate]", data['baofoo']['feeRate'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>

							</div>
						</div>



					</div>
	
	
			</div>
			</fieldset>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
			</form>
			
	<%@ include file="../Common/footer.jsp"%>