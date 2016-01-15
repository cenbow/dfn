<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/article_category/index')}">文章分类</a></li>
		<li class="active"><a href="${dfn:U('admin/article_category/add_menu')}">添加文章分类 </a></li>
		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">基本属性</a></li>
			<li><a href="javascript:;">栏目内容</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/user/addArticle_category')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>
					

					<tr>
						<th width="200"  class="control-label">会员名： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						<td>${dfForm:select( "cate_type",cate_typeSelect, data['cate_type'], dfForm_class,  dfForm_style,dfForm_others)}
							<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
										<span class="commonToolTip">请选择栏目类型</span>
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">上级栏目：</th>
						<td>${dfForm:select( "parent_id",parent_idSelect, data['parent_id'], dfForm_class,  dfForm_style,dfForm_others)}
						
						</td>

					</tr>
					<tr>
						<th width="200" height="40px"class="control-label">栏目名称：</th>
						
							<td>${dfForm:input( "cate_name", data['cate_name'], dfForm_class, dfForm_style,dfForm_others)}
							${dfForm:select( "is_show",is_showSelect, data['is_show'], dfForm_class, dfForm_style,dfForm_others)}
							
						</td>
					</tr>
					<tr>
						<th class="control-label">栏目唯一标识：</th>
							<td>${dfForm:input( "cate_nid", data['cate_nid'], dfForm_class, dfForm_style,dfForm_others)}
						<span class="commonToolTip">栏目唯一标志不能与同级栏目有重复</span>
					</tr>
					<tr>
						<th class="control-label">栏目简介：</th>
						<td><textarea rows="5" cols="40" class="myarea" name="description" id="description"></textarea>

							<span class="commonToolTip">SEO元素</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">栏目关键词：</th>
						<td><textarea rows="5" cols="40" class="myarea" name="keywords" id="keywords"></textarea>
							<span class="commonToolTip">SEO元素</span>
						</td>
					</tr>
					
				</table>
			</div>

			<div style="display: none;" class="common-form cwh">
				<table>
					<tr>
						<th colspan="2"  class="control-label">栏目内容：</th>
					<!-- </tr>
					<tr> -->
						<td colspan="2"><script type="text/javascript">
							window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
							window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
							var _editorAll = [];
						</script> <script type="text/javascript" charset="utf-8"
								src="${AdminStatics}/js/ueditor/ueditor.config.js"></script> <script
								type="text/javascript" charset="utf-8"
								src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script> <textarea
								name="content" id="content" style="width: 80%;height: 300px"></textarea> <script
								type="text/javascript">
									var _editor = UE.getEditor("content");
									_editorAll.push(_editor);
								</script></td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
	<%@ include file="../Common/footer.jsp"%>