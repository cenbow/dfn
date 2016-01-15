<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed" >

	<div class="jj dialogBox" style="width: 600px">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/user/money_edit')}">调整余额</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/user/do_money_edit')}"	class="form-horizontal J_ajaxForm">
            <input type="hidden" name="id" value="${id}" />
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">可用余额： 
						</th>
						<td>${dfForm:input( "account_money","0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> --> <span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span>
						</td>
					</tr>

					<tr>
						<th class="control-label">冻结金额：</th>
						<td>${dfForm:input( "money_freeze", "0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> --> <span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">待收金额：</th>
						<td>${dfForm:input( "money_collect", "0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">积分：</th>
						<td>${dfForm:input( "credits", "0", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">变动原因：</th>
						<td>${dfForm:input( "info", "", dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> -->

						</td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">确认修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>