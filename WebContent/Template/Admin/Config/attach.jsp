<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<%-- <link href="${AdminStatics}css/admin_style.css" rel="stylesheet"/>  --%>


<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
		<c:set var="flagindex" value="${dfn:H('admin/config/index')}"></c:set>
		<c:if test="${flagindex}">
		<li ><a href="${dfn:U('admin/config/index')}">站点配置</a></li>
		</c:if>
		<c:set var="flagattach" value="${dfn:H('admin/config/attach')}"></c:set>
		<c:if test="${flagattach}">
		<li class="active"><a href="${dfn:U('admin/config/attach')}">附件设置 </a></li>
		</c:if>
		<c:set var="flagemail" value="${dfn:H('admin/config/email')}"></c:set>
		<c:if test="${flagemail}">
		<li ><a href="${dfn:U('admin/config/email')}">邮件配置 </a></li>
		</c:if>
		<c:set var="flagborrow" value="${dfn:H('admin/config/borrow')}"></c:set>
		<c:if test="${flagborrow}">
		<li ><a href="${dfn:U('admin/config/borrow')}">借款相关参数配置</a></li>
		</c:if>
		<c:set var="flagchangegroup" value="${dfn:H('admin/config/changegroup')}"></c:set>
		<c:if test="${flagchangegroup}">
		<li ><a href="${dfn:U('admin/config/changegroup')}">修改后台入口 </a></li>
		</c:if>
		<c:set var="flagsms" value="${dfn:H('admin/config/sms')}"></c:set>
		<c:if test="${flagsms}">
		<li ><a href="${dfn:U('admin/config/sms')}">手机参数配置 </a></li>
		</c:if>
		</ul>

		<form method="post" action="${dfn:U('admin/config/editAttach')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
									<tr>
										<th width="140" class="control-label">允许上传附件大小:</th>
										<td>${dfForm:input( "uploadASize", data['uploadASize'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									 <tr>
										<th width="140" class="control-label">允许上传附件类型:</th>
										<td><textarea name="uploadAType">${data['uploadAType']}</textarea>
										
									</tr>
									<tr>
										<th width="140" class="control-label">前台允许上传附件大小:</th>
										<td>${dfForm:input( "uploadHSize", data['uploadHSize'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th width="140" class="control-label">前台允许上传附件类型:</th>
										<td><textarea name="account_money">${data['account_money']}</textarea>
										
									</tr>
									<tr>
										<th width="140" class="control-label">是否开启图片水印:</th>
										<td>${dfForm:select( "waterShow",waterShow_select, data['waterShow'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th width="140" class="control-label">水印-宽:</th>
										<td>${dfForm:input( "waterW", data['waterW'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th width="140" class="control-label">水印-高:</th>
										<td>${dfForm:input( "waterH", data['waterH'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th width="140" class="control-label">水印图片:</th>
										<td><input style="width: 300px" type="text" class="input" name="waterImg" id="waterImg"	value="" /><span
											class="commonToolTip">水印图片</span><input type="file"	id="wateri" name="wateri"></td>
									</tr>
									<tr>
										<th width="140" class="control-label">水印透明度:</th>
										<td>${dfForm:input( "waterTran", data['waterTran'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th width="140" class="control-label">JPEG 水印质量:</th>
										<td>${dfForm:input( "waterWeight", data['waterWeight'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
								</table>
					</div>
							<c:set var="flageditAttach" value="${dfn:H('admin/config/editAttach')}"></c:set>
							<c:if test="${flageditAttach}">
								<div class="form-actions">
									<button type="submit"
										class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
									&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
						    	 </div>
							</c:if>
					</form>
			</div>
			<script>

			function _beforeGetValue(){
				$("input[type='file']").remove();
			}

	</script>


	

	<%@ include file="../Common/footer.jsp"%>