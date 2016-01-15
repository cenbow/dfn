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
			<li class="active"><a href="#">后台菜单管理</a></li>
			<li><a href="${dfn:U('admin/Commonly/menu_add')}">添加子菜单</a></li>
		</ul>
		<div class="wrap J_check_wrap">
			<form class="J_ajaxForm" action="" method="post">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<td align="center">排序</td>
								<td align="center">ID</td>
								<td align="center">菜单英文名称</td>
								<td align="center">状态</td>
								<td align="center">管理操作</td>

							</tr>
						</thead>
						<tbody>
							<tr id='list_72'>
								<td align='center'><input name='sort_order[72]' type='text'
									size='3' value='0' class='input'></td>
								<td align='center'>72</td>
								<td align="center">分组相关权限</td>
								<td align='center'>不显示</td>
								<td align='center'><a
									href="/newadmin-menu-add-parentid-72-menuid-4.shtml">添加子菜单</a>
									| <a href="/newadmin-menu-edit-id-72-menuid-4.shtml">修改</a> | <a
									class="J_ajax_del"
									href="/newadmin-menu-delete-id-72-menuid-4.shtml">删除</a></td>
							</tr>
							<tr id='list_73'>
								<td align='center'><input name='sort_order[73]' type='text'
									size='3' value='0' class='input'></td>
								<td align='center'>73</td>
								<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
									添加分组</td>
								<td align='center'>显示</td>
								<td align='center'><a
									href="/newadmin-menu-add-parentid-73-menuid-4.shtml">添加子菜单</a>
									| <a href="/newadmin-menu-edit-id-73-menuid-4.shtml">修改</a> | <a
									class="J_ajax_del"
									href="/newadmin-menu-delete-id-73-menuid-4.shtml">删除</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">排序</button>
					&nbsp;&nbsp;<a class="btn" href="javascript:;"
						onClick="window.history.back(-1);return false;">返回</a>
				</div>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/admin_term/add_post.html" method="post">
				<jsp:include page="menu_add.jsp" />

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
	<script type="text/javascript"> 
(function(){
var tab_tit  = document.getElementById('think_page_trace_tab_tit').getElementsByTagName('span');
var tab_cont = document.getElementById('think_page_trace_tab_cont').getElementsByTagName('div');
var open     = document.getElementById('think_page_trace_open');
var close    = document.getElementById('think_page_trace_close').childNodes[0];
var trace    = document.getElementById('think_page_trace_tab');
var cookie   = document.cookie.match(/thinkphp_show_page_trace=(\d\|\d)/);
var history  = (cookie && typeof cookie[1] != 'undefined' && cookie[1].split('|')) || [0,0];
open.onclick = function(){
	trace.style.display = 'block';
	this.style.display = 'none';
	close.parentNode.style.display = 'block';
	history[0] = 1;
	document.cookie = 'thinkphp_show_page_trace='+history.join('|')
}
close.onclick = function(){
	trace.style.display = 'none';
this.parentNode.style.display = 'none';
	open.style.display = 'block';
	history[0] = 0;
	document.cookie = 'thinkphp_show_page_trace='+history.join('|')
}
for(var i = 0; i < tab_tit.length; i++){
	tab_tit[i].onclick = (function(i){
		return function(){
			for(var j = 0; j < tab_cont.length; j++){
				tab_cont[j].style.display = 'none';
				tab_tit[j].style.color = '#999';
			}
			tab_cont[i].style.display = 'block';
			tab_tit[i].style.color = '#000';
			history[1] = i;
			document.cookie = 'thinkphp_show_page_trace='+history.join('|')
		}
	})(i)
}
parseInt(history[0]) && open.click();
tab_tit[history[1]].click();
})();
</script>
</body>
</html>