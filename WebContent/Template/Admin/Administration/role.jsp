<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body>
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">角色管理</a></li>
		<li><a href="#">添加角色</a></li>
	</ul>
	<div class="wrap J_check_wrap">
		<div class="table_list">
			<form name="myform" action="/admin/rbac/listorders.html"
				method="post">
				<table class="table table-hover" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th width="30">ID</th>
							<th align="left">角色名称</th>
							<th align="left">角色描述</th>
							<th align="left" width="40">状态</th>
							<th width="200">管理操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2</td>
							<td>demo演示</td>
							<td>demo演示</td>
							<td><font color="red">√</font></td>
							<td class="text-c"><a
								href="http://demo.鼎峰P2P.com/admin/rbac/authorize/id/2.html">权限设置</a>
								|<!-- <a href="javascript:open_iframe_dialog('/admin/rbac/member/id/2.html','成员管理');">成员管理</a>| -->
								<a href="http://demo.鼎峰P2P.com/admin/rbac/roleedit/id/2.html">修改</a>
								| <a class="J_ajax_del"
								href="http://demo.鼎峰P2P.com/admin/rbac/roledelete/id/2.html">删除</a>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>超级管理员</td>
							<td>拥有网站最高管理员权限！</td>
							<td><font color="red">√</font></td>
							<td class="text-c"><font color="#cccccc">权限设置</font> | <!-- <a href="javascript:open_iframe_dialog('/admin/rbac/member/id/1.html','成员管理');">成员管理</a> | -->
								<font color="#cccccc">修改</font> | <font color="#cccccc">删除</font>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	
	<div style="display:none;" class="wrap J_check_wrap">
		<form class="form-horizontal J_ajaxForm"
			action="/admin/rbac/roleadd_post.html" method="post" id="myform">
			<div class="table_full">
				<table cellpadding="2" cellspacing="2" width="100%">
					<tbody>
						<tr>
							<th width="180">角色名称</th>
							<td><input name="name" class="input" id="rolename" type="text"><span
								class="must_red">*</span></td>
						</tr>
						<tr>
							<th>角色描述</th>
							<td><textarea name="remark" rows="2" cols="20" id="remark"
									class="inputtext" style="height: 100px; width: 500px;"></textarea></td>
						</tr>
						<tr>
							<th>是否启用</th>
							<td><label class="radio inline" for="active_true"> <input
									name="status" value="1" checked="checked" id="active_true"
									type="radio">开启
							</label> <label class="radio inline" for="active_false"> <input
									name="status" value="0" id="active_false" type="radio">禁止
							</label></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
				<a class="btn" href="http://demo.鼎峰P2P.com/admin/rbac">返回</a>
			</div>
		</form>
	</div>
</div>	
<script src="statics/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});
</script>
</body>
</html>