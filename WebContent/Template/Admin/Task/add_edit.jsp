<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="${dfn:U('admin/task/index')}">计划任务</a></li>
		<li ><a href="${dfn:U('admin/task/user_add')}">添加新任务 </a></li>
		<li ><a href="${dfn:U('admin/task/exeaction')}">执守程序操作 </a></li>
		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">添加新任务</a></li>
	
		</ul>
		<form method="post" action="${dfn:U('admin/nav/add_edit')}">
			<div class="common-form cwh">

				<table>
					<tr>
						<th width="200">任务名称： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "parent_id",parent_idSelect, data['parent_id'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
						<span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
							</tr>
<div id="abcde">
	<input type="radio" name="day" value="1" />指定日期
		
	<input type="radio" name="day" value="2" />制定星期几
</div>		
	<div id="fg" style="display:none; ">
		<input type="text" name="day_monday" />
	</div>			


					<tr>
						<th>执行时间：</th>
							<td>${dfForm:select( "is_open",is_openSelect, data['is_open'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_phone"
								id="user_phone" value="" /> -->

						<span class="commonToolTip">如果是减少余额，请填负数，如'-1000'</span></td>
					</tr>
					<tr>
						<th>月：</th>
						<td>${dfForm:select( "is_show",is_showSelect, data['is_show'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="user_email"
								id="user_email" value="zzzzbb@163.com" /> -->

						</td>
					</tr>
					<tr>
						<th>日期：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th>小时：</th>
						<td>${dfForm:input( "url", data['url'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> -->

						</td>
					</tr>	
					<tr>
						<th>分钟：</th>
						<td>${dfForm:input( "text", data['text'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="idcard"
								id="idcard" value="" /> -->

						</td>
					</tr>
					<tr>
						<th>任务脚本地址：</th>
						<td>${dfForm:input( "url", data['url'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> -->

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
	$("#abcde input").click(function(){
		$("#fg").show();
	});
</script>
	<%@ include file="../Common/footer.jsp"%>