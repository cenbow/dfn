<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<%
	request.setAttribute("dfForm_style", "width:200px;");
%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/article_category/index')}">文章分类</a></li>
		<li class="active"><a href="${dfn:U('admin/article_category/add_menu')}">添加文章分类 </a></li>
		</ul>
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">基本属性</a></li>
			<li><a href="javascript:;">栏目内容</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/article_category/addArticle_category')}" class="form-horizontal J_ajaxForm">
			<dfTag:token />
			<div class="common-form cwh">

				<table>
					

					<tr>
						<th width="200"  class="control-label">会员名： <input type="hidden" name="id"
							value="${data.id }" />
						</th>
						 
						<td><input type="radio" class="_RADIO_" checked="checked"
									name="cate_type" class="_RADIO_" value="1" id="cate_type_1" checked
									onclick="ckjump(this)"><label class="_RADIO_LABEL_CLASS_" for="cate_type_1">列表</label><input
									type="radio" name="cate_type" class="_RADIO_" value="2" id="cate_type_2"
									onclick="ckjump(this)"><label class="_RADIO_LABEL_CLASS_" for="cate_type_2">封面</label><input
									type="radio" name="cate_type" class="_RADIO_" value="3" id="cate_type_3"
									onclick="ckjump(this)"><label class="_RADIO_LABEL_CLASS_" for="cate_type_3">跳转</label>
                        <input type="radio" name="cate_type" class="_RADIO_"  value="4" id="cate_type_4" onclick="ckjump(this)">
                        <label class="_RADIO_LABEL_CLASS_" for="cate_type_4">图文</label>
									<span class="commonToolTip">请选择栏目类型</span>
						</td>
					</tr>
							<tr id="url" style="display: none">
								<th class="control-label">跳转网址：</th>
								<td><input type="text" class="input" name="url" id="url"
									value="" /></td>
							</tr>
						
					
					<tr>
						<th width="500px" height="40px" class="control-label">上级栏目：</th>
						<td>${dfForm:select( "parent_id",parentid_Select, this_id , dfForm_class,  dfForm_style,dfForm_others)}
						
						</td>

					</tr>
					<tr>
						<th class="control-label">栏目名称：</th>
						
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
						<td colspan="2">${dfForm:editor("content",data['content'],"")}</td>
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
	<script type="text/javascript"> 
function ckjump(obj){
	($(obj).val()==3)?$("#url").show():$("#url").hide();
}
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
</script>
<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
</script>
	<%@ include file="../Common/footer.jsp"%>