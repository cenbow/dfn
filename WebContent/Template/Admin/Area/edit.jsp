<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/area/index')}">地区列表</a></li>
			<li class="active"><a href="${dfn:U('admin/area/add_menu')}">添加地区
			</a></li>

		</ul>
		<ul class="nav nav-tabs">

			<li><a href="javascript:;">基本属性</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/area/addArea')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<table>


					<tr>
						<th width="200" class="control-label">地区名称： <input
							type="hidden" name="id" value="${data.id }" />
						</th>
						<td><textarea id="name" class="myarea" name="name" cols="40" rows="5"></textarea><span class="commonToolTip">可批量添加多个地区，不同地区名之间用半角逗号(,)隔开</span>
						</td>
					</tr>
					<tr>
						<th class="control-label">地区排序：</th>
						<td>${dfForm:input( "sort_order", data['sort_order'], dfForm_class, dfForm_style,dfForm_others)}
							<!-- <input type="text" class="input" name="age" id="age"
								value="0" /> --> <span class="commonToolTip">数字越大越靠前</span>
						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">上级地区：</th>
						<td>${dfForm:select( "reid",reidSelect, data['reid'], dfForm_class,  dfForm_style,dfForm_others)}

							<span class="commonToolTip">顶级地区则无父分类</span>
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
	<%@ include file="../Common/footer.jsp"%>