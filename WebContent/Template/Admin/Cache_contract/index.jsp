<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/cache_contract/index')}">合同相关参数</a></li>
		</ul>
		
			<form class="form-horizontal J_ajaxForm" method="post"
				action="${dfn:U('admin/cache_contract/editCache_contract')}">
				<dfTag:token/>
				<div >合同相关参数</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">公司名称：</th>
							<td>${dfForm:input( "companyName", data['companyName'], dfForm_class, dfForm_style,dfForm_others)}</td>
						</tr>
						<tr>
							<th class="control-label">PDF页眉LOGO：</th>
							<td><input data="logo" style="width: 300px" type="text"
								class="input" name="contract[logo]" id="contract[logo]"
								value="/uploadData/PDF/205-201502061604143701.png" /><span
								class="commonToolTip">推荐高度76px左右</span><input type="file"
								id="pdflogo" name="pdflogo"><span id="loading_makeclub"
								style="display: none"><img
									src="http://www.ggmoney.com/statics/common/images/loadingmini.gif" /></span></td>
						</tr>
						<tr>
							<th class="control-label">电子印章：</th>
							<td><input data="seal" style="width: 300px" type="text"
								class="input" name="contract[seal]" id="contract[seal]"
								value="/uploadData/PDF/205-201502061604524576.png" /><span
								class="commonToolTip">推荐尺寸200px*200px</span><input type="file"
								id="pdfseal" name="pdfseal"><span id="loading_makeclub"
								style="display: none"><img
									src="http://www.ggmoney.com/statics/common/images/loadingmini.gif" /></span></td>
						</tr>
					</table>
				</div>
				<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


			</form>
		</div>
	