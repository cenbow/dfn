<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
		<c:set var="flagindex" value="${dfn:H('admin/config/index')}"></c:set>
		<c:if test="${flagindex}">
		<li ><a href="${dfn:U('admin/config/index')}">站点配置</a></li>
		</c:if>
		<c:set var="flagattach" value="${dfn:H('admin/config/attach')}"></c:set>
		<c:if test="${flagattach}">
		<li ><a href="${dfn:U('admin/config/attach')}">附件设置 </a></li>
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
		<li class="active"><a href="${dfn:U('admin/config/changegroup')}">修改后台入口 </a></li>
		</c:if>
		<c:set var="flagsms" value="${dfn:H('admin/config/sms')}"></c:set>
		<c:if test="${flagsms}">
		<li ><a href="${dfn:U('admin/config/sms')}">手机参数配置 </a></li>
		</c:if>
		</ul>

		<form method="post" action="${dfn:U('admin/config/editChangegroup')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
										<th width="200" class="control-label">当前入口：</th>
										<td>Newadmin</td>
									</tr>
									<tr>
										<th width="200" class="control-label">新入口：</th>
										<td>${dfForm:input( "newgroup", data['newgroup'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
					</table>
					</div>
					<c:set var="flageditChangegroup" value="${dfn:H('admin/config/editChangegroup')}"></c:set>
					<c:if test="${flageditChangegroup}">
					<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
			</c:if>
					</form>
			</div>

	<%@ include file="../Common/footer.jsp"%>