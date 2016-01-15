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
			<li class="current"><a href="javascript:;">添加广告</a></li>
		
		</ul>
		<form method="post" action="${dfn:U('admin/ad/addAd')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">广告类型： 
						</th>
						<td>${dfForm:radio("ad_type",adType,"1","","","")}	 
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">开始时间：</th>
						<td><input class="input Wdate" style="width: 100px;"
								onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text"
								name="start_time" value="${start_time}" /> 
						</td>

					</tr>

					<tr>
						<th class="control-label">结束时间：</th>
						<td><input class="input Wdate" 	style="width: 100px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="end_time" value="${end_time}" />

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
						<th class="control-label">文章内容：</th>
						<td >${dfForm:editor("content",data['content'],"")}
						</td>
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
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
</script>
	<%@ include file="../Common/footer.jsp"%>