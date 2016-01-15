<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="${dfn:U('admin/cache_pay/index')}">微信接口配置</a></li>
		</ul>
	</div>

	<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">微信接口配置</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"	action="${dfn:U('admin/wx_config/save')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A" >
							<div >微信接口配置</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200px" class="control-label">Appid：</th>
											<td>${dfForm:input( "wx[appid]", data['wx']['appid'], dfForm_class, "",dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">密钥：</th>
										<td>${dfForm:input( "wx[secret]", data['wx']['secret'], dfForm_class, "",dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">微信ID：</th>
										<td>${dfForm:input( "wx[wxid]", data['wx']['wxid'], dfForm_class, "",dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">token：</th>
										<td>${dfForm:input( "wx[token]", data['wx']['token'], dfForm_class, "",dfForm_others)}</td>
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