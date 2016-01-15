<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">管理员</a></li>
			<li class=""><a href="#">添加管理员</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="form-horizontal J_ajaxForm"
				action="/springmvc2/Template/Admin/content/add_post.jsp">
				<div class="table_list">
					<table class="table_form" cellpadding="2" cellspacing="2"
						width="100%">
						<tbody>
							<tr>
								<td width="180">用户名:</td>
								<td><input class="input" name="user_login" type="text"></td>
							</tr>
							<tr>
								<td>密码:</td>
								<td><input class="input" name="user_pass" value=""
									type="password"></td>
							</tr>
							<tr>
								<td>邮箱:</td>
								<td><input class="input" name="user_email" type="text"></td>
							</tr>
							<tr>
								<td>角色:</td>
								<td><label class="checkbox inline"> <input value="2"
										name="role_id[]" type="checkbox">demo演示
								</label><label class="checkbox inline"> <input value="1"
										name="role_id[]" type="checkbox">超级管理员
								</label></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit J_ajax_submit_btn">添加</button>
					<a class="btn" href="#">返回</a>
				</div>
			</form>
		</div>
		
		<div style="display:none;" class="common-form">
		<div class="table_list">
			<table width="100%" cellspacing="0" class="table table-hover">
				<thead>
					<tr>
						<th width="50">ID</th>
						<th>用户名</th>
						<th>最后登录IP</th>
						<th>最后登录时间</th>
						<th>E-mail</th>
						<th width="120">管理操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>admin</td>
						<td>101.44.203.118</td>
						<td>2015-01-23 19:14:11</td>
						<td>zxxjjforever@163.com</td>
						<td><font color="#cccccc">修改</font> | <font color="#cccccc">删除</font>
						</td>
					</tr>
					<tr>
						<td>21</td>
						<td>demo</td>
						<td>59.173.203.233</td>
						<td>2015-01-28 16:00:55</td>
						<td>鼎峰P2P@simplewind.net</td>
						<td><a href='#'>修改</a> | <a
							class="J_ajax_del" href="#">删除</a></td>
					</tr>
				</tbody>
			</table>
			<div class="pagination"></div>
		</div>
		</div>
		
	</div>
<script src="statics/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".common-form").eq(index).show().siblings(".common-form").hide();
});
</script>
</body>
</html>