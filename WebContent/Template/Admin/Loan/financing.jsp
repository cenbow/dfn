<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/themes/flat/theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/css/simplebootadmin.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/js/artDialog/skins/default.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<style>
.length_3 {
	width: 180px;
}
</style>
<!--[if IE 7]> <link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<script type="text/javascript">
	//全局变量
	var GV = {
		DIMAUB : "/",
		JS_ROOT : "statics/js/",
		TOKEN : ""
	};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/wind.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/ajaxForm.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Template/Admin/statics/js/artDialog/artDialog.js"
	type="text/javascript"></script>

</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">定存宝划列表</a></li>
			<li><a href="${dfn:U('admin/loan/financing_add')}">添加定存宝</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="well form-search"
				action="/admin_term/listorders.html">
				<div class="search_type cc mb10">
					<div class="mb10">
						<span class="mr20">产品名称： <input style='width: 100px'
							type="text" class="input" name="m#user_name" id="m#user_name"
							value="" />
						投资金额： 
						<select
							name="bj" class="myselect" id="bj"><option value="gt">大于</option>

								<option value="eq">等于</option>
								<option value="lt">小于</option></select> <input style='width: 100px'
							type="text" class="input" name="money" id="money" value="" />
								添加时间： <input name="start_time"
							class="input length_2 J_date date" style="width: 80px;"
							autocomplete="off" type="text">-<input
							class="input length_2 J_date date" name="end_time"
							style="width: 80px;" autocomplete="off" type="text"> <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
							&nbsp; &nbsp; <input class="btn" value="搜索" type="submit">
						</span>					</div>
				</div>
				</form>
				<form class="J_ajaxForm" action="" method="post">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th align="center" >ID</th>
								<th align="center" >标题</th>
								<th align="center">产品总金额</th>
								<th align="center">已募集金额</th>
								<th align="center" >投资起点</th>
    <th align="center" >年利率</th>
    <th align="center" >计算天数</th>
    <th align="center" >募集结束时间</th>

								<th align="center">添加时间</th>
								<th align="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">1</td>
								<td align="center"><a target="_blank"
									href="/newadmin-common-user-user_name-13297970980.shtml">13297970980</a></td>

								<td align="center">&nbsp;</td>
								<th align="center" >&nbsp;</th>
								<th align="center">&nbsp;</th>
								<th align="center">&nbsp;</th>
								<th align="center" >&nbsp;</th>

								<td align="center">&nbsp;</td>
								<td align="center">2015-03-19 09:31:56</td>

								<td align="center"><span class="green">已通过</span> | <a
									href="/newadmin-Comment-delete?id=12" class="J_ajax_del">删除</a>								</td>

							</tr>
						</tbody>
				  </table>
				</div>
				<div class="form-actions">
					<p>
						222 条记录 5/23 页 <a
							href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a
							href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a>
						&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a>
						&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a>
						<a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a>
					</p>
				</div>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/admin_term/add_post.html" method="post">				
						<div class="tab-pane active" id="A">
							<table cellpadding="2" cellspacing="2" width="100%">
								<tbody>
							  <div class="control-group">
										<label class="control-label" for="input01">用户名:</label>
										<div class="controls">
											<input type="hidden" class="input" name="id" value="21">
											<input type="text" name="user_nicename" value="">
										</div>
							  </div>
									<div class="control-group">
										<label class="control-label" for="input01">借款标题:</label>
										<div class="controls">
											<input type="hidden" class="input" name="id" value="21">
											<input type="text" name="user_nicename" value="">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="input01">评论内容:</label>
										<div class="controls">
											<textarea name="description" rows="5" cols="57"></textarea>
										</div>
									</div>



								</tbody>
							</table>
						</div>									
				<div class="form-actions">
					<button class="btn btn-primary btn_submit J_ajax_submit_btn"
						type="submit">提交</button>
					<a class="btn"
						href="http://demo.鼎峰P2P.com/admin_term/index.html">返回</a>
				</div>
			</form>
		</div>
</div>
	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
	</script>
</body>
</html>