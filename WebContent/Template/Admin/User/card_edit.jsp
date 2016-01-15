<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" >

	<div class="jj dialogBox" style="width: 500px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user/card_edit')}">添加卡券</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user/do_card_edit')}"	class="form-horizontal J_ajaxForm">
            <input type="hidden" name="id" value="${id}" />
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">卡券名称： 
						</th>
						<td>${dfForm:input( "name","", dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">显示给用户看的名称</span>
						</td>
					</tr>
					<tr>
						<th width="200" class="control-label">卡券类型： 
						</th>
						<td>${dfForm:select( "type",typeSelect, "", dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>
					<tr>
						<th width="200" class="control-label">卡券规则： 
						</th>
						<td>${dfForm:select( "card_cat",cardType, "", dfForm_class, dfForm_style,dfForm_others)}
						</td>
					</tr>
					<tr>
						<th class="control-label">过期时间：</th>
						<td><input class="input Wdate" 	style="width: 100px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:false})" name="expired_time" value="${defaultTime}" />
						</td>
					</tr>
					<tr>
						<th class="control-label">卡券金额/年化：</th>
						<td>${dfForm:input( "affect_money", "0", dfForm_class, dfForm_style,dfForm_others)}</td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">确认添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>