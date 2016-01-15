<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">站内信管理</a></li>
			<li><a href="#">编辑</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="h_a">搜索</div>
				<div class="search_type cc mb10">
					<div class="mb10">
						<span class="mr20"> 会员名： <input style='width: 100px'
							type="text" class="input" name="m#user_name" id="m#user_name"
							value="" /> 真实姓名： <input style='width: 100px' type="text"
							class="input" name="mi#real_name" id="mi#real_name" value="" />
							信息标题： <input style='width: 100px' type="text" class="input"
							name="i#title" id="i#title" value="" /> 是否已读： <select
							name="i#has_read" class="myselect" id="i#has_read"><option
									selected="selected" value="">全部</option>
								<option value="1">已读</option>
								<option value="0">未读</option></select> 是否重要通知： <select
							name="i#is_important" class="myselect" id="i#is_important"><option
									selected="selected" value="">全部</option>
								<option value="1">是</option>
								<option value="0">否</option></select> 发送时间： <input type="text"
							name="start_time" class="input length_2 J_date" value=""
							style="width: 80px;"> - <input type="text"
							class="input length_2 J_date" name="end_time" value=""
							style="width: 80px;">
							<button class="btn">搜索</button>
						</span>
					</div>
				</div>
			</form>
			<div class="table_list">
				<table class="table table-hover" width="100%">
					<thead>
						<tr>
							<th class="line_l">ID</th>
							<th class="line_l">用户名</th>
							<th class="line_l">真实姓名</th>
							<th class="line_l">信息标题</th>
							<th class="line_l">发送时间</th>
							<th class="line_l">是否已读</th>
							<th class="line_l">读取时间</th>
							<th class="line_l">是否重要通知</th>
							<th class="line_l">操作</th>
						</tr>
					</thead>
					<tr overstyle='on' id="list_132">
						<td>132</td>
						<td><a target="_blank"
							href="/newadmin-common-user-user_name-shoulder.shtml">shoulder</a></td>
						<td>&nbsp;</td>
						<td title="投标成功">投标成功</td>
						<td>2015-03-11 10:48:09</td>
						<td><span class="gray">未读取</span></td>
						<td><span class="gray">未读取</span></td>
						<td>否</td>
						<td><a href="/newadmin-SiteMsg-edit?id=132">修改内容</a>&nbsp;&nbsp;
							<a href="/newadmin-SiteMsg-delete?id=132" class="J_ajax_del">删除</a>
						</td>
					</tr>
				</table>
			</div>
			</div>


			<div style="display: none;" class="common-form">
				<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
					action="/newadmin-Article-doadd" method="post">
					<div class="h_a">编辑站内信</div>
					<div class="table_full">
						<table width="100%" class="table_form ">
							<tr>
								<th width="100">标题：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="title" id="title" value="" /></td>
							</tr>
							<tr>
								<th colspan="2">文章内容：</th>
							</tr>
							<tr>
								<td colspan="2"><script type="text/javascript">
									window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
									window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
									var _editorAll = [];
								</script>

									<script type="text/javascript" charset="utf-8"
										src="${AdminStatics}/js/ueditor/ueditor.config.js"></script>

									<script type="text/javascript" charset="utf-8"
										src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script>
									<textarea name="msg" id="msg"></textarea> <script
										type="text/javascript">
										var _editor = UE.getEditor("msg");
										_editorAll.push(_editor);
									</script></td>
							</tr>
						</table>
					</div>
					</form>
			</div>

		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">修改</button>
				&nbsp;&nbsp;<a href="javascript:;"
					onclick="window.history.back(-1);return false;">返回</a>
			</div>
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
		var dialogCallBack = function() {
			var iframeName = $(".aui_content").find("iframe").attr("name");
			$(".J_ajaxForm", window.frames[iframeName].document).submit();
			return false;

		}
	</script>
	<script type="text/javascript"> 
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
</script>

	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>