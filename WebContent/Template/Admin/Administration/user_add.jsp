<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">基本信息</a></li>
			<li><a href="javascript:;">详细信息</a></li>
		</ul>
		<div class="common-form cwh">
			<form method="post" class="J_ajaxForm"	action="/admin/term/listorders.html">
				<div class="table_list">
					<div class="h_a">基本信息</div>
					<div class="table_full">
						<table width="100%" class="table_form ">
							<tr>
								<th width="200">会员名：</th>
								<td><a target="_blank"
									href="user.jsp">egspoon</a></td>
							</tr>
							<tr>
								<th width="200">是否冻结：</th>
								<td><input type="radio" checked="checked" name="is_ban"
									value="0" id="is_ban_1"><label for="is_ban_1">否</label><input
									type="radio" name="is_ban" value="1" id="is_ban_2"><label
									for="is_ban_2">是</label></select><span class="commonToolTip">冻结后会员不能登陆，须联系客服处理</span></td>
							</tr>
							<tr>
								<th width="200">会员类型：</th>
								<td><input type="radio" checked="checked" name="m_type"
									value="1" id="m_type_1"><label for="m_type_1">投资会员</label><input
									type="radio" name="m_type" value="2" id="m_type_2"><label
									for="m_type_2">借款会员</label></select><span class="commonToolTip">借款会员才能发布借款</span></td>
							</tr>
							<tr>
								<th>所属客服：</th>
								<td><select name="customer_id" class="myselect"
									id="customer_id"><option selected="selected" value="0">暂无客服</option>
										<option value="208">bill</option>
										<option value="207">zhaojing</option>
										<option value="205">test</option>
										<option value="209">hezuojigou</option>
										<option value="210">zt</option>
										<option value="211">yunying</option>
										<option value="212">zx</option></select></td>
							</tr>
							<tr>
								<th>新密码：</th>
								<td><input type="password" class="input" name="user_pass"
									id="user_pass" value="" /><span class="commonToolTip">如不修改则留空</span></td>
							</tr>
							<tr>
								<th>确认新密码：</th>
								<td><input type="password" class="input"
									name="re_user_pass" id="re_user_pass" value="" /><span
									class="commonToolTip">如不修改则留空</span></td>
							</tr>
							<tr>
								<th>新支付密码：</th>
								<td><input type="password" class="input" name="pin_pass"
									id="pin_pass" value="" /><span class="commonToolTip">如不修改则留空</span></td>
							</tr>
							<tr>
								<th>确认支付密码：</th>
								<td><input type="password" class="input" name="re_pin_pass"
									id="re_pin_pass" value="" /><span class="commonToolTip">如不修改则留空</span></td>
							</tr>
						</table>
					</div>
				</div>

		</div>

		<div style="display: none;" class="common-form cwh">
				<div class="h_a">详细信息</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200">籍贯：</th>
							<td><select name="province" id="province">
									<option value="0">选择省份</option>
							</select> <select name="city" id="city">
									<option value="0">选择县/市</option>
							</select> <select name="area" id="area">
									<option value="0">选择地址</option>
							</select></td>
						</tr>
						<tr>
							<th>居住城市：</th>
							<td><select name="province_now" id="province_now">
									<option value="0">选择省份</option>
							</select> <select name="city_now" id="city_now">
									<option value="0">选择县/市</option>
							</select> <select name="area_now" id="area_now">
									<option value="0">选择地址</option>
							</select></td>
						</tr>
						<tr>
							<th>手机号码：</th>
							<td><input type="text" class="input" name="user_phone"
								id="user_phone" value="" /></td>
						</tr>
						<tr>
							<th>邮箱：</th>
							<td><input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /></td>
						</tr>
						<tr>
							<th>身份证号码：</th>
							<td><input type="text" class="input" name="idcard"
								id="idcard" value="" /></td>
						</tr>
						<tr>
							<th>年龄：</th>
							<td><input type="text" class="input" name="age" id="age"
								value="0" /></td>
						</tr>
						<tr>
							<th>详细住址：</th>
							<td><input style="width: 300px" type="text" class="input"
								name="address" id="address" value="" /></td>
						</tr>
					</table>

				</div>
		</div>
		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn-primary btn_submit  J_ajax_submit_btn" type="submit">修改</button>
				&nbsp;&nbsp;<a href="javascript:;" class="btn" 	onclick="window.history.back(-1);return false;">返回</a>
			</div>
		</div>
			</form>



	</div>

	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
		$(".nav-tab li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".cwh").eq(index).show().siblings(".cwh").hide();
		});
	</script>

	<script type="text/javascript" src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>