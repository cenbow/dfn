<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">文章列表</a></li>
			<li><a href="#">添加文章 </a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="h_a">搜索</div>		
					<div class="search_type cc mb10">
						<div class="mb10">
							<span class="mr20"> 文章类型： <select name="a#attr"
								class="myselect" id="a#attr"><option
										selected="selected" value="">所有</option>
									<option value="1">普通</option>
									<option value="2">跳转</option></select> 标题关键词： <input
								style='width: 100px' type="text" class="input" name="a#title"
								id="a#title" value="" /> 栏目关键词： <input style='width: 100px'
								type="text" class="input" name="c#cate_name" id="c#cate_name"
								value="" /> 发布人： <input style='width: 100px' type="text"
								class="input" name="a#write" id="a#write" value="" /> 添加时间： <input
								type="text" name="start_time" class="input length_2 J_date"
								value="" style="width: 80px;"> - <input type="text"
								class="input length_2 J_date" name="end_time" value=""
								style="width: 80px;">
								<button class="btn">搜索</button>
							</span>
						</div>
					</div>
					<div class="table_list">
						<table class="table table-hover" width="100%">
							<thead>
								<tr>
									<td align='center' width="50">ID</td>
									<td align='left' width="200">标题</td>
									<td align="center">所属栏目</td>
									<td align="center">文章类型</td>
									<td align='center'>发布人</td>
									<td align='center'>添加时间</td>
									<td align='center'>管理员操作</td>

								</tr>
							</thead>
							<tr id="list_198">
								<td align='center'>198</td>
								<td align='left' title="光谷惠众网借款服务协议"><a
									href="/fwxy-198.shtml" target="_blank">光谷惠众网借款服务协议</a></td>
								<td align="center">服务协议</td>
								<td align="center">普通</td>
								<td align='center'>test</td>
								<td align='center'>2015-03-09 10:25:13</td>
								<td align='center'><a href="/newadmin-Article-edit?id=198">修改</a>
									| <a href="/newadmin-Article-delete?id=198" class="J_ajax_del">删除</a></td>
							</tr>
							</tr>
						</table>
						<div class="p10">
							<div class="pages"></div>
						</div>

					</div>
					<div class="btn_wrap">
						<div class="btn_wrap_pd">
							<button class="btn btn_submit mr10 J_ajax_submit_btn"
								type="submit">排序</button>
							&nbsp;&nbsp;<a href="javascript:;"
								onclick="window.history.back(-1);return false;">返回</a>
						</div>
					</div>


				</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="tab-content">
					<div class="h_a">添加文章</div>
					<div class="table_full">
						<table width="100%" class="table_form ">
							<tr>
								<th width="200">文章属性：</th>
								<td><input type="radio" class="" checked="checked"
									name="attr" value="1" id="attr_1" onclick="ckjump(this)"><label
									for="attr_1">普通</label><input type="radio" name="attr"
									value="2" id="attr_2" onclick="ckjump(this)"><label
									for="attr_2">跳转</label></select></td>
							</tr>
							<tr id="url" style="display: none">
								<th>跳转网址：</th>
								<td><input type="text" class="input" name="url" id="url"
									value="" /></td>
							</tr>
							<tr>
								<th width="200">所属栏目：</th>
								<td><select name="cat_id" id="cat_id">
										<option value='360'>关于我们</option>
										<option value='367'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											公司简介</option>
										<option value='432'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											管理团队</option>
										<option value='417'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											专家顾问</option>
										<option value='431'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─
											联系我们</option>
										<option value='361'>安全保障</option>
										<option value='371'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											服务协议</option>
										<option value='416'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─
											法律法规</option>
										<option value='380'>网站片段(不要删)</option>
										<option value='382'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─
											网站底部</option>
										<option value='426'>帮助中心</option>
										<option value='427'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											名词解释</option>
										<option value='428'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											常见问题</option>
										<option value='429'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─
											账户管理</option>
										<option value='430'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─
											资费说明</option>
										<option value='433'>新手指引</option>
								</select></td>
							</tr>
							<tr>
								<th>文章标题：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="title" id="title" value="" /></td>
							</tr>
							<tr>
								<th>文章简介：</th>
								<td><textarea rows="5" cols="40" class="myarea"
										name="description" id="description"></textarea><span
									class="commonToolTip">SEO元素</span></td>
							</tr>
							<tr>
								<th>文章关键词：</th>
								<td><textarea rows="5" cols="40" class="myarea"
										name="keywords" id="keywords"></textarea><span
									class="commonToolTip">SEO元素</span></td>
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
									<textarea name="content" id="content"></textarea> <script
										type="text/javascript">
										var _editor = UE.getEditor("content");
										_editorAll.push(_editor);
									</script></td>
							</tr>
						</table>
					</div>
		
		<div class="btn_wrap">
			<div class="btn_wrap_pd">
				<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">添加</button>
				&nbsp;&nbsp;<a href="javascript:;"
					onclick="window.history.back(-1);return false;">返回</a>
			</div>
		</div>
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
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
	
	<script type="text/javascript">
		function _beforeGetValue() {
			$.each(_editorAll, function(k, v) {
				v.sync();
			})
		}
		function _afterSuccess(data) {
			var catId = $("#cat_id").val();
			//添加成功
			Wind
					.use(
							"artDialog",
							function() {
								art
										.dialog({
											id : "succeed",
											icon : "succeed",
											fixed : true,
											lock : true,
											background : "#CCCCCC",
											opacity : 0,
											content : data.info,
											button : [
													{
														name : '继续添加？',
														callback : function() {
															window.location.href = "/newadmin-Article-add?cat_id="
																	+ catId;
															return true;
														},
														focus : true
													},
													{
														name : '返回文章列表页',
														callback : function() {
															window.location.href = "/newadmin-Article-index";
															return true;
														},
													} ]
										});
							});
		}
		function ckjump(obj) {
			($(obj).val() == 2) ? $("#url").show() : $("#url").hide();
		}
	</script>
	
</body>
</html>