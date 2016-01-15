<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="${dfn:U('admin/borrow_see/index')}">发标初审</a></li>
		</ul>
	</div>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#A" data-toggle="tab">借款信息</a></li>
		<li><a href="#B" data-toggle="tab">图片资料</a></li>
		<li><a href="#C" data-toggle="tab">审核操作</a></li>

	</ul>
	<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
		action="${dfn:U('admin/borrow_see/doEdit')}" method="post">
		<fieldset >
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="A">
						<div>借款信息</div>
						<div class="table_full">
							<table width="100%" class="table_form ">
								<tr>
									<th width="200" class="control-label">借款标题： <input
										type="hidden" name="id" value="${data.id }" />
									</th>
									<td>${dfForm:input( "borrow_name", data['borrow_name'], dfForm_class, dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<th class="control-label">还款方式：</th>
									<td>${repayment_typeMap[data['repayment_type']]}
									</td>
								</tr>
								<tr>
									<th class="control-label">借款标类型：</th>
									<td>${borrow_typeMap[data['borrow_type']]}</td>
								</tr>
								<tr>
									<th class="control-label">借款用途：</th>
									<td>${dfForm:select( "borrow_use",borrow_useMap, data['borrow_use'], dfForm_class, dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<th class="control-label">年化利率：</th>
									<td>${data['borrow_interest_rate']}</td>
								</tr>
								<tr>
									<th class="control-label">借款期限：</th>
									<td>${ data['borrow_duration']}</td>
								</tr>
								<tr>
									<th class="control-label">借款说明：</th>
									<td><script type="text/javascript">
										window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";
										window.UEDITOR_FILE_URL = "/index.php?appg=Newadmin&appm=Ueditor&appa=";
										var _editorAll = [];
									</script> <script type="text/javascript" charset="utf-8"
											src="${AdminStatics}/js/ueditor/ueditor.config.js"></script>

										<script type="text/javascript" charset="utf-8"
											src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script>
										<textarea name="borrow_info" id="borrow_info"
											style="width: 80%; height: 300px">${data['borrow_info']}</textarea> <script
											type="text/javascript">
												var _editor = UE
														.getEditor("borrow_info");
												_editorAll.push(_editor);
											</script></td>
								</tr>
							</table>

						</div>
					</div>

					<div class="tab-pane" id="B">
						<div>项目相关图片预览</div>
						<div class="table_full">
							<table width="100%" class="table_form ">
								<td id="img_type_1">
									<div class="thumbnails">
										<div class="albCt" id="swfImgSn999">
											<a
												href="javascript:preview(999, 'img','/uploadData/UserBorrowData/124-201504201041451911.png')"><img
												width="120" height="120"
												src="/uploadData/UserBorrowData/thumb_124-201504201041451911.png"></a>
										</div>
									</div>
								</td>
							</table>
						</div>
					</div>


					<div class="tab-pane" id="C">
						<div>审核操作</div>
						<div class="table_full">
							<table width="80%" class="table_form ">
								<tr>
									<td width="200" class="control-label">是否允许自动投标：</td>

									<td>${dfForm:select( "can_auto",isAutoMap, data['can_auto'], dfForm_class,  dfForm_style,dfForm_others)}

									</td>
								</tr>

								<tr>
									<td class="control-label">定向密码：</td>
									<td>${dfForm:input( "borrow_pass", data['borrow_pass'], dfForm_class, dfForm_style,dfForm_others)}
										<span class="commonToolTip">不修改则留空</span>
									</td>

								</tr>
								<tr>
									<td class="control-label">借款金额：</td>
									<td>${dfForm:input( "borrow_money", data['borrow_money'], dfForm_class, dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<td class="control-label">借款管理费：</td>
									<td>${dfForm:input( "borrow_fee", data['borrow_fee'], dfForm_class, dfForm_style,dfForm_others)}
									<span class="commonToolTip">当前值为按后台设置计算出来的，如果线下有协议或者算法有变动可自行修改</span></td>
								</tr>
								<tr>
									<td class="control-label">募集时间(天)：</td>
									<td>${dfForm:input( "collect_day", data['collect_day'], dfForm_class, dfForm_style,dfForm_others)}
									<span class="commonToolTip">在前台展示天数，如在担心在设定时间内不能募集完成，可修改延长</span></td>
								</tr>
								<tr>
									<td class="control-label">最多投标总额：</td>
									<td>${dfForm:input( "borrow_max", data['borrow_max'], dfForm_class, dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<td class="control-label">是否通过：</td>
									<td>${dfForm:radio( "borrow_status",isPassMap, data['borrow_status'], dfForm_class,  dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<td class="control-label">审核说明：</td>
									<td><textarea id="deal_info" class="myarea"
											name="deal_info" cols="40" rows="5"></textarea></td>
								</tr>
							</table>

						</div>
					</div>

				</div>


			</div>
		</fieldset>
		<div class="form-actions">
			<button type="submit"
				class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
			&nbsp;&nbsp;<a class="btn" href="javascript:;"
				onClick="window.history.back(-1);return false;">返回</a>
		</div>
	</form>




</body>
</html>