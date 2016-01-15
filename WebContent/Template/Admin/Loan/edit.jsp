<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj"  style="width:500px;" >
	
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/loan/index')}">贷款审核</a></li>


		</ul>
		<ul class="nav nav-tabs">
			<li class="current"><a href="${dfn:U('admin/loan/edit')}">审核</a></li>
		
		</ul>
		<form method="post" action="${dfn:U('admin/loan/doEdit')}"
			class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200" class="control-label">借款主体： 
						</th>
						<td>${data['loan_subject'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">姓名： 
						</th>
						<td>${data['name'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">联系电话： 
						</th>
						<td>${data['phone'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">所在地区： 
						</th>
						<td>${data['area'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">金融产品： 
						</th>
						<td>${data['product'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">借款金额：
						</th>
						<td>${data['amount_borrowed'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">借款周期：
						</th>
						<td>${data['expired_borrowed'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">月均收入： 
						</th>
						<td>${data['monthly_averagy_revenue'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">借款用途： 
						</th>
						<td>${data['purpose_borrowed'] }</td>
					</tr>
					<tr>
						<th width="200" class="control-label">处理说明： 
						</th>
						<td><textarea name="deal_info" ></textarea></td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">审核：</th>
						<td>${dfForm:select("status",deal_select,"0",dfForm_class, dfForm_style,dfForm_others)}
						<input type="hidden" name="id" value="${data['id'] }" />
						</td>

					</tr>

					 

				</table>
			</div>

							
							 
			<div class="form-actions">
			<input type="submit" name="abc" value="提交" />
				<!-- <button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:window.history.back(-1);">关闭</a> -->
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