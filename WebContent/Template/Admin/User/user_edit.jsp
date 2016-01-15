<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj" >
		<ul class="nav nav-tabs">
			<li class="current active"><a href="javascript:;">基本信息</a></li>
			<li><a href="javascript:;">详细信息</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/user/do_edit_user')}" class="form-horizontal J_ajaxForm">
            <input type="hidden" name="id" 	value="${data.id}" />
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">会员名： 
						</th>
						<td>${dfForm:input( "user_name", data['user_name'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">是否冻结：</th>
						<td>${dfForm:select( "is_ban",radiobuttonSelect, data['is_ban'], dfForm_class,  dfForm_style,dfForm_others)}
						<span class="commonToolTip">冻结后会员不能登陆，须联系客服处理</span>
						</td>

					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">会员类型：</th>
						<td>${dfForm:select( "user_type",memberTypeSelect, data['user_type'], dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">借款会员才能发布借款</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">所属客服：</th>
						<td>${dfForm:select( "customer_id",serviceCustomerSelect, data['customer_id'], dfForm_class, dfForm_style,dfForm_others)}
					</tr>
					<tr>
						<th class="control-label">会员等级：</th>
						<td>${dfForm:select( "user_leve",listlevelMap, data['user_leve'], dfForm_class, dfForm_style,dfForm_others)}
					</tr>
					<tr>
						<th class="control-label">等级有效期至：</th>
						<td><input class="input Wdate" 	style="width: 100px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:false})" name="time_limit" value="${dfn:date(data.time_limit,"yyyy-MM-dd")}" />
					</tr>
					<tr>
						<th class="control-label">新密码：</th>
						<td>${dfForm:input( "user_pass", "", dfForm_class, dfForm_style,dfForm_others)}


							<span class="commonToolTip">如不修改则留空</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">确认新密码：</th>
						<td>${dfForm:input( "re_user_pass", "", dfForm_class, dfForm_style,dfForm_others)}
							<span class="commonToolTip">如不修改则留空</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">新支付密码：</th>
						<td>${dfForm:input( "pin_pass", "", dfForm_class, dfForm_style,dfForm_others)}

							<span class="commonToolTip">如不修改则留空</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">确认支付密码：</th>
						<td>${dfForm:input( "re_pin_pass", "", dfForm_class, dfForm_style,dfForm_others)}

							<span class="commonToolTip">如不修改则留空</span>
						</td>
					</tr>
				</table>
			</div>

			<div style="display: none;" class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">籍贯：</th>
						<td><select name="province" id="province">
								<option value="0">选择省份</option>
						</select> <select name="city" id="city">
								<option value="0">选择县/市</option>
						</select> <select name="area" id="area">
								<option value="0">选择地址</option>
						</select></td>
					</tr>
					<tr>
						<th class="control-label">居住城市：</th>
						<td><select name="province_now" id="province_now">
								<option value="0">选择省份</option>
						</select> <select name="city_now" id="city_now">
								<option value="0">选择县/市</option>
						</select> <select name="area_now" id="area_now">
								<option value="0">选择地址</option>
						</select></td>
					</tr>
					<tr>
						<th class="control-label">手机号码：</th>
						<td>${dfForm:input( "user_phone", data['user_phone'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">邮箱：</th>
						<td>${dfForm:input( "user_email", data['user_email'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">身份证号码：</th>
						<td>${dfForm:input( "idcard", data['idcard'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">年龄：</th>
						<td>${dfForm:input( "age", data['age'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> -->

						</td>
					</tr>
					<tr>
						<th class="control-label">详细住址：</th>
						<td>${dfForm:input( "address", data['address'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input style="width: 300px" type="text" class="input"
								name="address" id="address" value="" /> -->

						</td>
					</tr>

				</table>
			</div>
			<div class="form-actions" >
				<button type="submit"	class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" href="javascript:;"	onClick="window.history.back(-1);return false;">返回</a>
			</div>


		</form>


	</div>
	<script type="text/javascript">	
		$(".nav-tabs>li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".cwh").eq(index).show().siblings(".cwh").hide();
		});
	</script>
	<%@ include file="../Common/footer.jsp"%>