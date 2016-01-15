<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">幻灯片分类</a></li>
			<li><a href="#">添加幻灯片分类 </a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="/admin/term/listorders.html">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th width="50">ID</th>
								<th>分类名称</th>
								<th>分类标识</th>
								<th>描述</th>
								<th width="120">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>0</td>
								<td>默认分类</td>
								<td></td>
								<td>默认分类</td>
								<td>不允许修改</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
		
		<div class="common-form">
			<form method="post" class="form-horizontal J_ajaxForm"
				action="/admin/slidecat/add_post.html">
				<div class="table_list">
					<table cellpadding="2" cellspacing="2" width="100%">
						<tbody>
							<tr>
								<td>分类名称:</td>
								<td><input class="input" name="cat_name" type="text"><span
									class="must_red">*</span></td>
							</tr>
							<tr>
								<td>分类标识:</td>
								<td><input class="input" name="cat_idname" type="text"><span
									class="must_red">*</span><span style="margin-left: 15px;">英文字母+数字+“_”</span></td>
							</tr>
							<tr>
								<td>备注:</td>
								<td><textarea name="cat_remark" rows="5" cols="57"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button class="btn btn-primary btn_submit J_ajax_submit_btn"
						type="submit">添加</button>
					<a class="btn" href="http://demo.鼎峰P2P.com/admin/slidecat">返回</a>
				</div>
			</form>
		</div>
		
	</div>
<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
</body>
</html>