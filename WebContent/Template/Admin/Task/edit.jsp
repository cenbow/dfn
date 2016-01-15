<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/task/index')}">计划任务</a></li>
			<li ><a href="${dfn:U('admin/task/add_menu')}">添加新任务
			</a></li>
			<li><a href="${dfn:U('admin/task/exeaction')}">执守程序操作 </a></li>
		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">添加新任务</a></li>

		</ul>
		<form method="post" action="${dfn:U('admin/task/edit')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200" class="control-label">任务名称： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						<td>${dfForm:input( "name", data['name'], dfForm_class, dfForm_style,dfForm_others)}
							
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">是否启用：</th>
						<td>${dfForm:select( "is_on",isonSelect, data['is_on'], dfForm_class,  dfForm_style,dfForm_others)}
						
						</td>

					</tr>

					<tr>
						<th class="control-label">执行时间：</th>

					</tr>
					<tr>
						<th width="200" class="control-label">月：</th>
						<td><input type="radio" class="" checked="checked"
							name="month" value="*" id="month_1" onClick="ckjump(this)"><!-- <label
							for="month_1"> -->每月<!-- </label> --><input type="radio" name="month"
							value="set" id="month_2" onClick="ckjump(this)"><!-- <label
							for="month_2"> -->指定月份<!-- </label> --></td>
					</tr>
					<tr id="month_set_tr" style="display: none">
						<th width="200" class="control-label">指月份：</th>
						<td><input style="width: 300px" type="text" class="input"
							name="month_set" id="month_set" value="" /><span
							class="commonToolTip">输入数字月份，多个月份用英文逗号隔开，有效数字为(1-12)，如(1,2,10,11)</span></td>
					</tr>
					<tr>
						<th width="200" class="control-label">日期：</th>
						<td><input type="radio" class="" checked="checked" name="day"
							value="*" id="day_1" onClick="ckjump(this)"><!-- <label
							for="day_1"> -->每天<!-- </label> --><input type="radio" name="day"
							value="set_day" id="day_2" onClick="ckjump(this)"><!-- <label
							for="day_2"> -->指定日期<!-- </label> --><input type="radio" name="day"
							value="set_week" id="day_3" onClick="ckjump(this)"><!-- <label
							for="day_3"> -->指定星期几<!-- </label> --></td>
					</tr>
					<tr id="day_set_day_tr" style="display: none">
						<th width="200" class="control-label">指定日期：</th>
						<td><input style="width: 300px" type="text" class="input"
							name="day_set" id="day_set" value="" /><span
							class="commonToolTip">输入数字日期，多个日期用英文逗号隔开，有效数字为(1-31)，如(1,2,18,25,28)</span></td>
					</tr>
					<tr id="day_set_week_tr" style="display: none">
						<th width="200" class="control-label">指定星期几：</th>
						<td><input style="width: 300px" type="text" class="input"
							name="week_set" id="week_set" value="" /><span
							class="commonToolTip">输入数字，有效数字为(0-6)，0表示星期天，依此类推，一个星期内多天用英文逗号隔开，如(0,3,5)</span></td>
					</tr>
					<tr>
						<th width="200" class="control-label">小时：</th>
						<td><input type="radio" class="" checked="checked"
							name="hour" value="*" id="hour_1" onClick="ckjump(this)"><!-- <label
							for="hour_1"> -->每小时<!-- </label> --><input type="radio" name="hour"
							value="set" id="hour_2" onClick="ckjump(this)"><!-- <label
							for="hour_2"> -->指定小时<!-- </label> --></td>
					</tr>
					<tr id="hour_set_tr" style="display: none">
						<th width="200" class="control-label">指定小时：</th>
						<td><input style="width: 300px" type="text" class="input"
							name="hour_set" id="hour_set" value="" /><span
							class="commonToolTip">输入数字，多个小时用英文逗号隔开，有效数字为(0-23)，如(0,1,2,18,20,23)</span></td>
					</tr>
					<tr>
						<th width="200" class="control-label">分钟：</th>
						<td><input type="radio" class="" checked="checked" name="min"
							value="*" id="min_1" onClick="ckjump(this)"><!-- <label
							for="min_1"> -->每分<!-- </label> --><input type="radio" name="min" value="set"
							id="min_2" onClick="ckjump(this)"><!-- <label for="min_2"> -->指定分钟<!-- </label> --></select></td>
					</tr>
					<tr id="min_set_tr" style="display: none">
						<th width="200" class="control-label">指定分钟：</th>
						<td><input style="width: 300px" type="text" class="input"
							name="min_set" id="min_set" value="" /><span
							class="commonToolTip">输入数字，多个分钟用英文逗号隔开，有效数字为(0-59)，如(0,1,2,43,54,57)</span></td>
					</tr>
					<tr>
						<th>任务脚本地址：</th>
						<td>${dfForm:input( "task_url", data['task_url'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> --> <span class="commonToolTip">输入执行此任务的脚本地址</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>



	<script type="text/javascript">
		function ckjump(obj) {
			var type = $(obj).val();
			var id = $(obj).attr("name") + "_" + type + "_tr";
			$("#" + id).show();
			$(obj).siblings("input").each(function(k, v) {
				var stype = $(this).val();
				if (stype != "*") {
					var sid = $(this).attr("name") + "_" + stype + "_tr";
					$("#" + sid).hide();
				}
			});
		}
	</script>

	<%@ include file="../Common/footer.jsp"%>