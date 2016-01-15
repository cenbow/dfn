<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/cache_pay/index')}">支付接口配置</a></li>
			<li class="active"><a href="${dfn:U('admin/cache_pay/add_menu')}">线下充值银行
			</a></li>

		</ul>

		<form method="post" action="${dfn:U('admin/cache_pay/editCache_pay')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<div class="table_list">
					<table id="area_list" style ="width:100%; border:0 ;cellspacing:0
						;cellpadding:0;">
						<thead>
							<tr>
								<th align="center">序号</th>
								<th >银行名称</th>
								<th >开户支行</th>
								<th >银行帐户</th>
								<th >开户人</th>
								<th >操作</th>
							</tr>
						</thead>
					</table>

					<button class="btn" style="margin-top: 5px"
						onClick="addone();return false;">添加一个银行</button>
				</div>

				<script type="text/javascript">
					var xss = parseInt() || 0;
					function addone() {
						xss++;
						var htmladd = '<tr align="center" overstyle="on" id="list_'+xss+'">';
						htmladd += '<td>' + xss + '</td>';
						htmladd += '<td><input type="text" class="input" style="width:100px" name="payOff['+xss+'][name]" value="" /></td>';
						htmladd += '<td><input type="text" class="input" style="width:200px" name="payOff['+xss+'][start]" value="" /></td>';
						htmladd += '<td><input type="text" class="input" style="width:200px" name="payOff['+xss+'][end]" value="" /></td>';
						htmladd += '<td><input type="text" class="input" style="width:100px" name="payOff['+xss+'][icoName]" value="" /></td>';
						htmladd += '<td><a href="javascript:void(0);" onclick="delx('
								+ xss + ');">删除</a></td>';
						htmladd += '</tr>';
						$(htmladd).appendTo("#area_list");
					}
					function delx(id) {
						if (confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?"))
							$("#list_" + id).remove();
					}
				</script>
				<div style="overflow: hidden">
					<h2>线下充值注意事项:</h2>
					<script type="text/javascript">
						window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
						window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
						var _editorAll = [];
					</script>

					<script type="text/javascript" charset="utf-8"
						src="${AdminStatics}/js/ueditor/ueditor.config.js"></script>

					<script type="text/javascript" charset="utf-8"
						src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script>
					<textarea  style="width:70%;height:300px;" name="payOff[ps]" id="payOff[ps]"></textarea>



					<script type="text/javascript">
						var _editor = UE.getEditor("payOff[ps]");
						_editorAll.push(_editor);
					</script>
				</div>

			</div>


			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
	<%@ include file="../Common/footer.jsp"%>