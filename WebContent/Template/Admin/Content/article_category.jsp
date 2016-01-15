<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">文章分类</a></li>
			<li><a href="#">添加文章分类 </a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<td align='center'>排序</td>
								<td align='center'>CatID</td>
								<td>栏目名称</td>
								<td align="center">栏目类型</td>
								<td align='center'>分类唯一标识</td>
								<td align='center'>管理操作</td>

							</tr>
						</thead>
						<tr id='list_360'>
							<td align='center'><input name='sort_order[360]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>360</td>
							<td>关于我们</td>
							<td align='center'>封面</td>
							<td align='center'>about</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-360-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-360-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-360-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_367'>
							<td align='center'><input name='sort_order[367]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>367</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 公司简介</td>
							<td align='center'>封面</td>
							<td align='center'>gsjj</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-367-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-367-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-367-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_432'>
							<td align='center'><input name='sort_order[432]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>432</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 管理团队</td>
							<td align='center'>列表</td>
							<td align='center'>gltt</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-432-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-432-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-432-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_417'>
							<td align='center'><input name='sort_order[417]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>417</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 专家顾问</td>
							<td align='center'>列表</td>
							<td align='center'>zjgw</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-417-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-417-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-417-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_431'>
							<td align='center'><input name='sort_order[431]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>431</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ 联系我们</td>
							<td align='center'>封面</td>
							<td align='center'>lxwm</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-431-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-431-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-431-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_361'>
							<td align='center'><input name='sort_order[361]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>361</td>
							<td>安全保障</td>
							<td align='center'>封面</td>
							<td align='center'>safe</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-361-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-361-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-361-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_371'>
							<td align='center'><input name='sort_order[371]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>371</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 服务协议</td>
							<td align='center'>列表</td>
							<td align='center'>fwxy</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-371-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-371-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-371-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_416'>
							<td align='center'><input name='sort_order[416]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>416</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ 法律法规</td>
							<td align='center'>封面</td>
							<td align='center'>flfg</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-416-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-416-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-416-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_380'>
							<td align='center'><input name='sort_order[380]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>380</td>
							<td>网站片段(不要删)</td>
							<td align='center'>列表</td>
							<td align='center'>pd</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-380-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-380-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-380-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_382'>
							<td align='center'><input name='sort_order[382]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>382</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ 网站底部</td>
							<td align='center'>列表</td>
							<td align='center'>db</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-382-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-382-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-382-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_426'>
							<td align='center'><input name='sort_order[426]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>426</td>
							<td>帮助中心</td>
							<td align='center'>封面</td>
							<td align='center'>bz</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-426-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-426-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-426-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_428'>
							<td align='center'><input name='sort_order[428]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>428</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 常见问题</td>
							<td align='center'>封面</td>
							<td align='center'>cj</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-428-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-428-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-428-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_429'>
							<td align='center'><input name='sort_order[429]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>429</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 账户管理</td>
							<td align='center'>封面</td>
							<td align='center'>zh</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-429-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-429-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-429-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_430'>
							<td align='center'><input name='sort_order[430]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>430</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├─ 资费说明</td>
							<td align='center'>封面</td>
							<td align='center'>zf</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-430-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-430-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-430-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_427'>
							<td align='center'><input name='sort_order[427]' type='text'
								size='3' value='1' class='input'></td>
							<td align='center'>427</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ 名词解释</td>
							<td align='center'>封面</td>
							<td align='center'>mc</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-427-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-427-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-427-menuid-28.shtml">删除</a>
							</td>
						</tr>
						<tr id='list_433'>
							<td align='center'><input name='sort_order[433]' type='text'
								size='3' value='0' class='input'></td>
							<td align='center'>433</td>
							<td>新手指引</td>
							<td align='center'>封面</td>
							<td align='center'>xszy</td>
							<td align='center'><a
								href="/newadmin-article_category-add-parentid-433-menuid-28.shtml">添加子栏目</a>
								| <a
								href="/newadmin-article_category-edit-id-433-menuid-28.shtml">修改</a>
								| <a class="J_ajax_del"
								href="/newadmin-article_category-delete-id-433-menuid-28.shtml">删除</a>
							</td>
						</tr>
					</table>
					<div class="btn_wrap">
						<div class="btn_wrap_pd">
							<button class="btn btn_submit mr10 J_ajax_submit_btn"
								type="submit">排序</button>
							&nbsp;&nbsp;<a href="javascript:;"
								onclick="window.history.back(-1);return false;">返回</a>
						</div>
					</div>
					</div>
			</form>
		</div>

			<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="tab-content">
					<div class="h_a">基本属性</div>
					<div class="table_full">
						<table width="100%" class="table_form ">
							<tr>
								<th width="200">栏目类型：</th>
								<td><input type="radio" class="" checked="checked"
									name="cate_type" value="1" id="cate_type_1"
									onclick="ckjump(this)"><label for="cate_type_1">列表</label><input
									type="radio" name="cate_type" value="2" id="cate_type_2"
									onclick="ckjump(this)"><label for="cate_type_2">封面</label><input
									type="radio" name="cate_type" value="3" id="cate_type_3"
									onclick="ckjump(this)"><label for="cate_type_3">跳转</label></select><span
									class="commonToolTip">请选择栏目类型</span></td>
							</tr>
							<tr id="url" style="display: none">
								<th>跳转网址：</th>
								<td><input type="text" class="input" name="url" id="url"
									value="" /></td>
							</tr>
							<tr>
								<th width="200">上级栏目：</th>
								<td><select name="parent_id" id="parent_id">
										<option value='0'>≡ 作为一级栏目 ≡</option>
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
								<th>栏目名称：</th>
								<td><input type="text" class="input" name="cate_name"
									id="cate_name" value="" /><input type="radio" checked="checked"
									name="is_show" value="1" id="is_show_1"><label
									for="is_show_1">显示</label><input type="radio" name="is_show"
									value="0" id="is_show_2"><label for="is_show_2">不显示</label></select></td>
							</tr>
							<tr id="catdir_tr">
								<th>栏目唯一标识：</th>
								<td><input type="text" class="input" name="cate_nid"
									id="cate_nid" value="" /><span class="commonToolTip">栏目唯一标志不能与同级栏目有重复</span></td>
							</tr>
							<tr>
								<th>栏目简介：</th>
								<td><textarea rows="5" cols="40" class="myarea"
										name="description" id="description"></textarea><span
									class="commonToolTip">SEO元素</span></td>
							</tr>
							<tr>
								<th>栏目关键词：</th>
								<td><textarea rows="5" cols="40" class="myarea"
										name="keywords" id="keywords"></textarea><span
									class="commonToolTip">SEO元素</span></td>
							</tr>
							<tr>
								<th width="200">栏目内容：</th>
								<td><script type="text/javascript">
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
							<button class="btn btn_submit mr10 J_ajax_submit_btn"
								type="submit">添加</button>
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
	<script type="text/javascript"> 
function ckjump(obj){
	($(obj).val()==3)?$("#url").show():$("#url").hide();
}
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
function _afterSuccess(data){
	if(data.status){
		//添加成功
	  Wind.use("artDialog", function () {
		  art.dialog({
			  id: "succeed",
			  icon: "succeed",
			  fixed: true,
			  lock: true,
			  background: "#CCCCCC",
			  opacity: 0,
			  content: data.info,
			  button:[
				  {
					  name: '继续添加？',
					  callback:function(){
						  reloadPage(window);
						  return true;
					  },
					  focus: true
				  },{
					  name: '返回栏目管理页',
					  callback:function(){
						  window.location.href = "/newadmin-ArticleCategory-index";
						  return true;
					  }
				  }
			  ]
		  });
	  });
	}else{
		isalert(data.info);
	}
}
</script>

	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>