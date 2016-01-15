<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
<div  >
	<div class="h_a">调整余额</div>
	<form name="myform" id="myform" method="post"
		action="/newadmin-User-doMoneyEdit">
		<input type="hidden" name="id" value="275">
		<div class="table_full">
			<table width="100%" class="table_form ">
					<tr>
						<th width="200">可用余额：</th>
						<td><input type="text" class="input" name="account_money"
							id="account_money" value=""><span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th width="200">冻结金额：</th>
						<td><input type="text" class="input" name="money_freeze"
							id="money_freeze" value=""><span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th width="200">待收金额：</th>
						<td><input type="text" class="input" name="money_collect"
							id="money_collect" value=""><span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th width="200">变动原因：</th>
						<td><input type="text" class="input" name="info" id="info"
							value=""><span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
			</table>
		</div>
		<!--table_full-->

		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">确认修改</button>
				&nbsp;&nbsp;<a href="javascript:;"
					onclick="window.history.back(-1);return false;">返回</a><span
					class="tips_error">操作失败</span>
			</div>
		</div>


	</form>
</div>
<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
	</body>
</html>
