<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">分类管理</a></li>
			<li><a href="#">添加分类</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin_term/listorders.html">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th width="80">排序</th>
								<th width="100">ID</th>
								<th>分类名称</th>
								<th>分类类型</th>
								<th align="center">访问</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input name="listorders[1]" size="3" value="0" class="input input-order" type="text">
								</td>
								<td>1</td>
								<td>
									<a href="#" target="_blank">新闻中心</a>
								</td>
								<td>文章</td>
								<td align="center">
									<a href="#" target="_blank">访问</a>
								</td>
								<td>
									<a href="#">添加子类</a>
									| <a href="#">修改</a>
									| <a class="J_ajax_del" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td>
									<input name="listorders[2]" size="3" value="0" class="input input-order" type="text">
								</td>
								<td>2</td>
								<td>
									<a href="#" target="_blank">发现</a>
								</td>
								<td>文章</td>
								<td align="center">
									<a href="#" target="_blank">访问</a>
								</td>
								<td>
									  <a href="#">添加子类</a>
									| <a href="#">修改</a>
									| <a class="J_ajax_del" href="#">删除</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">排序</button>
				</div>
			</form>
		</div>
	
		<div style="display:none;" class="common-form">
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/admin_term/add_post.html" method="post">
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table cellpadding="2" cellspacing="2" width="100%">
								<tbody>
									<tr>
										<td width="140">上级:</td>
										<td><select name="parent" class="normal_select">
												<option selected="selected" value="0">作为一级分类</option>
												<option value="1">新闻中心</option>
												<option value="2">发现</option>
										</select></td>
									</tr>
									<tr>
										<td>名称:</td>
										<td><input class="input" name="name" type="text"><span
											class="must_red">*</span></td>
									</tr>
									<tr>
										<td>描述:</td>
										<td><textarea name="description" rows="5" cols="57"></textarea></td>
									</tr>
									<tr>
										<td>类型:</td>
										<td><select name="taxonomy">
												<option selected="selected" value="article">文章</option>
												<option value="picture">图片</option>
										</select></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="B">
							<table cellpadding="2" cellspacing="2" width="100%">
								<tbody>
									<tr>
										<td width="180">SEO标题:</td>
										<td><input class="input" name="seo_title" type="text"></td>
									</tr>
									<tr>
										<td>SEO关键字:</td>
										<td><input class="input" name="seo_keywords" type="text"></td>
									</tr>
									<tr>
										<td>SEO描述:</td>
										<td><textarea name="seo_description" rows="5" cols="57"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="C">
							<table cellpadding="2" cellspacing="2" width="100%">
								<tbody>
									<tr>
										<td width="180">列表页模板:</td>
										<td><select class="normal_select" name="list_tpl">
												<option selected="selected" value="list">list.html</option>
												<option value="article">article.html</option>
												<option value="contact">contact.html</option>
												<option value="index">index.html</option>
												<option value="list_masonry">list_masonry.html</option>
												<option value="page">page.html</option>
												<option value="search">search.html</option>
										</select></td>
									</tr>
									<tr>
										<td>单文章模板:</td>
										<td><select class="normal_select" name="one_tpl">
												<option selected="selected" value="article">article.html</option>
												<option value="contact">contact.html</option>
												<option value="index">index.html</option>
												<option value="list">list.html</option>
												<option value="list_masonry">list_masonry.html</option>
												<option value="page">page.html</option>
												<option value="search">search.html</option>
										</select></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<button class="btn btn-primary btn_submit J_ajax_submit_btn"
						type="submit">提交</button>
					<a class="btn" href="http://demo.鼎峰P2P.com/admin_term/index.html">返回</a>
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