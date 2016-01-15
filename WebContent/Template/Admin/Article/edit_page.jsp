<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
		<c:set var="src_url" value="${pageContext.request.contextPath }" />  
	    <input name="src_url" type="hidden" value="${basePath }"/> 
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/article/index')}">文章列表</a></li>
			<li ><a href="${dfn:U('admin/article/add_menu')}">添加文章
			</a></li>

		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">编辑===="${data.title}"</a></li>
		
		</ul>
		<form method="post" action="${dfn:U('admin/article/editArticle')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">文章类型： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						
						<td><input type="radio" class="_RADIO_" <c:if test="${data['attr'] eq '1' }" > checked="checked"</c:if>
									name="attr" value="1" id="cate_type_1"
									onclick="ckjump(this)"><label class="_RADIO_LABEL_CLASS_" for="cate_type_1">普通</label>
									<input
									type="radio" name="attr"  class="_RADIO_" value="2" id="cate_type_3" <c:if test="${data['attr'] eq '2' }" > checked="checked"</c:if>
									onclick="ckjump(this)"><label class="_RADIO_LABEL_CLASS_" for="cate_type_3">跳转</label>
									<span class="commonToolTip">请选择文章类型</span>
						</td>
					</tr>
					<tr
						<c:if test="${data['attr'] eq '2' }" >  id="url" style="display: block;"</c:if>
						<c:if test="${data['attr']  != '2' }" >  id="url" style="display: none"</c:if>>
						
						<th width="200" class="control-label">跳转网址：</th>
						<td ><input type="text" class="input" name="url" id="url"
							value="${data['url'] }" /></td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">所属栏目：</th>
						<td>${dfForm:select( "cat_id",cat_idSelect, data['cat_id'], dfForm_class, dfForm_style,dfForm_others)}

						</td>

					</tr>

					<tr>
						<th class="control-label">排序：</th>
						<td>${dfForm:input( "sort_order", data['sort_order'], dfForm_class, dfForm_style,dfForm_others)}


						</td>
					</tr>
					<tr>
						<th class="control-label">文章标题：</th>
						<td>${dfForm:input( "title", data['title'], dfForm_class, dfForm_style,dfForm_others)}

						</td>
					</tr>
					<tr>
						<th class="control-label">文章简介：</th>
						<td><textarea rows="5" cols="40" class="myarea"
								name="description" id="description">${ data['description']}</textarea> <span
							class="commonToolTip">SEO元素</span></td>
					</tr>
					<tr>
						<th class="control-label">文章关键词：</th>
						<td><textarea rows="5" cols="40" class="myarea"
								name="keywords" id="keywords">${ data['keywords']}</textarea> <span
							class="commonToolTip">SEO元素</span></td>
					</tr>
					<tr>
						<th class="control-label">上传图片：</th>
						<td> 
                        	<input type="hidden" id="thumburl" name="thumburl" value="${data.thumburl}">
						 	<input type="file" name="thumb" id="thumb" />长<input type="text" style="width:100px" id="twidth" value=""> 宽<input style="width:100px" type="text" id="theight" value=""><span id="loading_thumb" style="display:none"><img src="${SiteStatics}/Common/images/loadingmini.gif" /></span>
                            <div id="show_img">
                            <c:if test="${!empty data.thumburl}"><img src="${dfn:getThumbImgUrl(data['thumburl'])}"/></c:if>
                            </div>
						</td>
					</tr>
					<tr>
						<th class="control-label">文章内容：</th>
						<td>${dfForm:editor("content",data['content'],"")}</td>
					</tr>

				</table>
			</div>


			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" href="javascript:window.history.back(-1);">返回</a>
			</div>


		</form>


	</div>
<script type="text/javascript">
function _beforeGetValue(){
	$("input[type='file']").remove();
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
function ckjump(obj){
	($(obj).val()==2)?$("#url").show():$("#url").hide();
}
</script>
<script type="text/javascript" src="${SiteStatics}/Common/js/ajaxfileupload.js"></script>
<script type="text/javascript">
$("#thumb").live("change",function(){
	var uptype=$(this).attr('id');
	ajaxFileUploads(uptype);
});
function ajaxFileUploads(type)
{
	$("#loading_"+type).ajaxStart(function(){	$(this).show();	}).ajaxComplete(function(){	$(this).hide();	});
	var id = type.replace("pdf",'');
	var width=$("#twidth").val();
	var height=$("#theight").val();
	$.ajaxFileUpload({
			url:'${dfn:SU(_thisUrl_,"upladTheFile")}?w='+width+'&h='+height,
			secureuri:false,
			fileElementId:type,
			dataType: 'json',
			success: function (data, status)
			{
				if(data.state=='success'){
					$("#show_img").html('');
					$("#thumburl").val(data.info);
					$('<img src="'+GV.WEB_ROOT+getImgThumb(data.info)+'"/>').appendTo("#show_img");
				}
				else{
					alert(data.info);
				}
			}
		})
}
</script>
<%@ include file="../Common/footer.jsp"%>