<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
	
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/ad/index')}">广告管理</a></li>
		<li class="active"><a href="${dfn:U('admin/ad/add_menu')}">添加广告 </a></li>


		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="${dfn:U('admin/ad/edit')}">修改广告</a></li>
		
		</ul>
		<form method="post" action="${dfn:U('admin/ad/editAd')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">广告类型： <input	type="hidden" name="id" value="${data.id }" />
						</th>
						<td>${dfForm:radio("ad_type",adType,data['ad_type'],"","","")}	</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">开始时间：</th>
						<td><input class="input Wdate" style="width: 100px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" type="text"	name="start_time" value="${data.start_time}" /> 
						</td>

					</tr>

					<tr>
						<th class="control-label">结束时间：</th>
						<td><input class="input Wdate" 	style="width: 100px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" name="end_time" value="${data.end_time}" />

						</td>
					</tr>
					<tr>
						<th class="control-label">广告位置：</th>
						<td>${dfForm:input( "title", data['title'], dfForm_class, dfForm_style,dfForm_others)}

						</td>
					</tr>
					<tr>
						<th class="control-label">是否去除P标签：</th>
						<td>${dfForm:radio( "remove_p",remove_pSelect, "0", "", "","")}
						</td>
					</tr>
					 
					<tr>
						<th class="control-label">广告内容：</th>
						<td >${dfForm:editor("content",data['content'],"")}
						</td>
					</tr>

				</table>
			</div>

							
							 
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
<script type="text/javascript">
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
</script>
	<%@ include file="../Common/footer.jsp"%>