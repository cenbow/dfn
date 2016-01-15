<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
<style type="text/css">
.table_full label{margin-left:20px;}
.table_full ._CHECKBOX_,.table_full label{float:left; width:auto}
</style>
	<div class="wrap jj">
		<ul class="nav nav-tabs nav-tab">
			<li class="active"><a href="#">借款者提醒</a></li>
			<li><a href="#">投资者提醒</a></li>
		</ul>
		<form method="post" class="form-horizontal J_ajaxForm"	action="${dfn:U('admin/cache_msgset/editCache_msgset')}">
			<dfTag:token />
		<div class="common-form cwh" style="width:100%;">
				<div >借款者提醒</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">初审通过：</th>
							<td>
							${dfForm:checkbox("msgset[borrow][check_success]",checkboxSelect,data['msgset']['borrow']['check_success'],dfForm_class,  "",dfForm_others) }
							</td>
						</tr>
						<tr>
							<th width="200" class="control-label">初审未通过：</th>
							<td>
							${dfForm:checkbox("msgset[borrow][check_fail]",checkboxSelect,data['msgset']['borrow']['check_fail'],dfForm_class,  "",dfForm_others) }
							</td>
						</tr>
						<tr>
							<th width="200" class="control-label">复审通过：</th>
							<td>
							${dfForm:checkbox("msgset[borrow][recheck_success]",checkboxSelect,data['msgset']['borrow']['recheck_success'],dfForm_class,  "",dfForm_others) }
							</td>
						</tr>
						<tr>
							<th width="200" class="control-label">复审未通过：</th>
							<td>
							${dfForm:checkbox("msgset[borrow][recheck_fail]",checkboxSelect,data['msgset']['borrow']['recheck_fail'],dfForm_class,  "",dfForm_others) }
							</td>
						</tr>
					</table>
					</div>
		</div>

		<div style="display: none;width:100%;" class="common-form cwh"  >
				<div >投资款者提醒</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200" class="control-label">投标操作：</th>
							<td>
							${dfForm:checkbox("msgset[invest][invest_money]",checkboxSelect,data['msgset']['invest']['invest_money'],dfForm_class,  "",dfForm_others) }
							
							 </td>
						</tr>
						<tr>
							<th width="200" class="control-label">所投标复审通过：</th>
							<td>
							${dfForm:checkbox("msgset[invest][recheck_success]",checkboxSelect,data['msgset']['invest']['recheck_success'],dfForm_class,  "",dfForm_others) }
							
							</td>
						</tr>
						<tr>
							<th width="200" class="control-label">所投标复审未通过：</th>
							<td>
							${dfForm:checkbox("msgset[invest][recheck_fail]",checkboxSelect,data['msgset']['invest']['recheck_fail'],dfForm_class,  "",dfForm_others) }
							
							</td>
						</tr>
						<tr>
							<th width="200" class="control-label">收到还款：</th>
							<td>
							${dfForm:checkbox("msgset[invest][get_repayment]",checkboxSelect,data['msgset']['invest']['get_repayment'],dfForm_class,  "",dfForm_others) }
							
							</td>
						</tr>
					</table>

				</div>
		</div>
		<div class="form-actions">
				<button type="submit"	class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
	</form>
		
</div>
		
	<%@ include file="../Common/footer.jsp"%>