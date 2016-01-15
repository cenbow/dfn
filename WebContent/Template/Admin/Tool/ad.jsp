<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">所有广告</a></li>
			<li class=""><a href="#">添加广告</a></li>
		</ul>
			<div class="common-form ad_list">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th width="16"><label><input class="J_check_all"
										data-direction="x" data-checklist="J_check_x" type="checkbox"></label></th>
								<th width="50">ID</th>
								<th>广告名称</th>
								<th>调用代码</th>
								<th width="45">状态</th>
								<th width="120">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input class="J_check" data-yid="J_check_y"
									data-xid="J_check_x" name="ids[]" value="1" type="checkbox"></td>
								<td>1</td>
								<td>portal_list_right_aside</td>
								<td>{:sp_getad('portal_list_right_aside')}</td>
								<td>显示</td>
								<td><a href="http://demo.鼎峰P2P.com/admin/ad/edit/id/1.html">修改</a>|
									<a href="http://demo.鼎峰P2P.com/admin/ad/delete/id/1.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td><input class="J_check" data-yid="J_check_y"
									data-xid="J_check_x" name="ids[]" value="2" type="checkbox"></td>
								<td>2</td>
								<td>portal_page_right_aside</td>
								<td>{:sp_getad('portal_page_right_aside')}</td>
								<td>显示</td>
								<td><a href="http://demo.鼎峰P2P.com/admin/ad/edit/id/2.html">修改</a>|
									<a href="http://demo.鼎峰P2P.com/admin/ad/delete/id/2.html"
									class="J_ajax_del">删除</a></td>
							</tr>
							<tr>
								<td><input class="J_check" data-yid="J_check_y"
									data-xid="J_check_x" name="ids[]" value="3" type="checkbox"></td>
								<td>3</td>
								<td>portal_article_right_aside</td>
								<td>{:sp_getad('portal_article_right_aside')}</td>
								<td>显示</td>
								<td><a href="http://demo.鼎峰P2P.com/admin/ad/edit/id/3.html">修改</a>|
									<a href="http://demo.鼎峰P2P.com/admin/ad/delete/id/3.html"
									class="J_ajax_del">删除</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<label class="checkbox inline" for="check_all"><input
						class="J_check_all" data-direction="y" data-checklist="J_check_y"
						id="check_all" type="checkbox">全选</label>
					<button class="btn btn-primary J_ajax_submit_btn" type="submit" data-action="/admin/ad/toggle/display/1.html" data-subcheck="true">显示</button>
					<button class="btn btn-primary J_ajax_submit_btn" type="submit" data-action="/admin/ad/toggle/hide/1.html" data-subcheck="true">隐藏</button>
				</div>
			</form>
		</div>
		<div class="common-form ad_add" style="display:none;">
			<form method="post" class="form-horizontal J_ajaxForm"  action="*">
				<div class="table_list">
					<table class="table_form" cellpadding="2" cellspacing="2"
						width="100%">
						<tbody>
							<tr>
								<td width="180">广告名称:</td>
								<td><input class="input" name="ad_name" type="text"><span
									class="must_red">*</span></td>
							</tr>
							<tr>
								<td>广告代码:</td>
								<td><textarea name="ad_content" rows="5" cols="57"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">添加</button>
					<a class="btn" href="#">返回</a>
				</div>
			</form>
		</div>
	</div>

<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
	
</body>
</html>