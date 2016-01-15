<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
	<li ><a href="${dfn:U('admin/site_msg/index')}">站内信管理</a></li>
		<li class="active"><a href="${dfn:U('admin/site_msg/menu')}">编辑 </a></li>


		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="javascript:;">编辑站内信</a></li>
		
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
					action="${dfn:U('admin/ad/editAd')}" method="post">
					<div >编辑站内信</div>
					<div class="table_full">
						<table  class="table_form ">
							<tr>
								<th width="100" class="control-label">标题：</th>
								<td><input style="width: 300px" type="text" class="input"
									name="title" id="title" value="" /></td>
							</tr>
							<tr>
								<th colspan="2" class="control-label">文章内容：</th>
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
									<textarea style="width:70%;height:300px;" name="msg" id="msg"></textarea> <script
										type="text/javascript">
										var _editor = UE.getEditor("msg");
										_editorAll.push(_editor);
									</script></td>
							</tr>
						</table>
					</div>
					</form>
					
					<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
					
					</div>
	<%@ include file="../Common/footer.jsp"%>