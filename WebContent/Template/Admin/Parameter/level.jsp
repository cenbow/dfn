<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员级别配置</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table id="area_list" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<thead>
							<tr>
								<th class="line_l">序号</th>
								<th class="line_l">级别名称</th>
								<th class="line_l">级别开始积分</th>
								<th class="line_l">级别结束积分</th>
								<th class="line_l">级别图标名称</th>
								<th class="line_l">图标显示</th>
								<th class="line_l">操作</th>
							</tr>
						</thead>
						<tr overstyle='on' id="list_22">
							<td>22</td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[22][name]" value="A" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[22][start]" value="200" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[22][end]" value="85000000" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[22][icoName]" value="r1.gif" /></td>
							<td><img
								src="http://www.ggmoney.com/statics/common/images/leveico/r1.gif" /></td>
							<td><a href="javascript:void(0);" onclick="delx(22);">删除</a>
							</td>
						</tr>
						<tr overstyle='on' id="list_23">
							<td>23</td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[23][name]" value="sss" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[23][start]" value="100000000" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[23][end]" value="1100000000" /></td>
							<td><input type="text" style="width: 100px" class="input"
								name="level[23][icoName]" value="credit_s24.gif" /></td>
							<td><img
								src="http://www.ggmoney.com/statics/common/images/leveico/credit_s24.gif" /></td>
							<td><a href="javascript:void(0);" onclick="delx(23);">删除</a>
							</td>
						</tr>
					</table>



					<button class="btn" style="margin-top: 5px"
						onClick="addone();return false;">添加一个级别</button>
				</div>
		
		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">保存</button>
				&nbsp;&nbsp;<a href="javascript:;"
					onclick="window.history.back(-1);return false;">返回</a><b
					class="subtip">会员级别图片放在uploadData/leveico/目录下</b>
			</div>
		</div>

		</form>
	</div>
</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li")
				.click(
						function() {
							var index = $(this).index();
							$(this).addClass("active").siblings().removeClass(
									"active");
							$(".J_check_wrap").eq(index).show().siblings(
									".J_check_wrap").hide();
						});
	</script>
	<script type="text/javascript"> 
var xss=parseInt(23)||0;
function addone(){
	xss++;
	var htmladd = '<tr overstyle="on" id="list_'+xss+'">';
		htmladd += '<td>'+xss+'</td>';
		htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][name]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][start]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][end]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:100px" name="level['+xss+'][icoName]" value="" /></td>';
		htmladd += '<td>&nbsp;</td>';
		htmladd += '<td><a href="javascript:void(0);" onclick="delx('+xss+');">删除</a></td>';
		htmladd += '</tr>';	
	$(htmladd).appendTo("#area_list");
}
function delx(id){
	if(confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?")) $("#list_"+id).remove();
}
</script>
	
<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</body>
</html>