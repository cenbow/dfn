<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">提现银行设置</a></li>
		</ul>
		<div class="wrap J_check_wrap">
			<form class="J_ajaxForms" name="myform" id="myform"
				action="/admin/setting/site_post.html" method="post">
				<div class="J_tabs_contents">
					<div class="table_list">
						<table id="area_list" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<thead>
								<tr>
									<th class="line_l">序号</th>
									<th class="line_l">银行名称</th>
									<th class="line_l">操作</th>
								</tr>
							</thead>
							<tr overstyle='on' id="list_1">
								<td>1</td>
								<td><input type="text" style="width: 100px" class="input"
									name="bankConfig[1]" value="中国工商银行" /></td>
								<td><a href="javascript:void(0);" onClick="delx(1);">删除</a>
								</td>
							</tr>
							<tr overstyle='on' id="list_2">
								<td>2</td>
								<td><input type="text" style="width: 100px" class="input"
									name="bankConfig[2]" value="中国建设银行" /></td>
								<td><a href="javascript:void(0);" onClick="delx(2);">删除</a>
								</td>
							</tr>
							<tr overstyle='on' id="list_3">
								<td>3</td>
								<td><input type="text" style="width: 100px" class="input"
									name="bankConfig[3]" value="中国银行" /></td>
								<td><a href="javascript:void(0);" onClick="delx(3);">删除</a>
								</td>
							</tr>
						</table>

						<button class="btn" style="margin-top: 5px"
							onClick="addone();return false;">添加一个银行</button>
					</div>
				</div>
				<div class="btn_wrap">
					<div class="btn_wrap_pd">
						<button class="btn btn_submit mr10 J_ajax_submit_btn"
							type="submit">保存</button>
						&nbsp;&nbsp;<a href="javascript:;"
							onClick="window.history.back(-1);return false;">返回</a>
					</div>
				</div>

			</form>
		</div>
	</div>
	<script type="text/javascript" src="statics/js/common.js"></script>

	<script type="text/javascript">
		var xss = parseInt(3) || 0;
		function addone() {
			xss++;
			var htmladd = '<tr overstyle="on" id="list_'+xss+'">';
			htmladd += '<td>' + xss + '</td>';
			htmladd += '<td><input type="text" class="input" style="width:100px" name="bankConfig['+xss+']" value="" /></td>';
			htmladd += '<td><a href="javascript:void(0);" onclick="delx(' + xss
					+ ');">删除</a></td>';
			htmladd += '</tr>';
			$(htmladd).appendTo("#area_list");
		}
		function delx(id) {
			if (confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?"))
				$("#list_" + id).remove();
		}
	</script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>