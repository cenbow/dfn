<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="jj dialogBox" style="width: 600px">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">借款信息</a></li>
			<li><a href="javascript:;">审核操作</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/borrow_recheck/do_edit')}" class="form-horizontal J_ajaxForm">
        <input type="hidden" name="id" value="${data.id}">
			<div class="common-form cwh">
              <table width="100%" class="table_form ">
                  <tr>
                      <th width="200" class="control-label">标的ID：</th>
                      <td>${data.id}</td>
                  </tr>
                  <tr>
                      <th width="200" class="control-label">借款标题：</th>
                      <td>${data['borrow_name']}</td>
                  </tr>
                  <tr>
                    <th width="200" class="control-label">还款方式：</th>
                    <td>${repaymentType[data['repayment_type']]}</td>
                  </tr>
                  <tr>
                    <th width="200" class="control-label">借款标类型：</th>
                    <td>${borrowType[data['borrow_type']]}</td>
                  </tr>
                  <tr>
                    <th width="200" class="control-label">借款用途：</th>
                    <td>${borrow_use[data['borrow_use']]}</td>
                  </tr>
                  <tr>
                    <th width="200" class="control-label">年化利率：</th>
                    <td>${data.borrow_interest_rate}%</td>
                  </tr>
                  <tr>
                    <th width="200" class="control-label">借款期限：</th>
                    <td>${data.borrow_duration}<c:choose><c:when test="${data.repayment_type == 4}">天</c:when><c:otherwise>个月</c:otherwise></c:choose></td>
                  </tr>
              </table>
			</div>

			<div style="display: none;" class="common-form cwh">
				<table>
					
					<tr>
						<th class="control-label">借款总金额：</th>
						<td>${data['borrow_money']}
						</td>
					</tr>
					
					<tr>
						<th class="control-label">需支付利息：</th>
						<td>${data['borrow_interest']}
						</td>
					</tr>
					
					<tr>
						<th class="control-label">借款管理费：</th>
						<td>${data['borrow_fee']}
							

						</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">是否通过：</th>
						<td>${dfForm:radio( "borrow_status",borrowStatus, "6", "","",dfForm_others)}
						
						
						</td>

					</tr>
					<tr>
						<th class="control-label">审核说明：</th>
						<td><textarea name="deal_info"></textarea>

						
						</td>
					</tr>
				</table>
			</div>
			<div class="form-actions">
				<button type="submit"	class="btn btn-primary btn_submit  J_ajax_submit_btn">审核</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>
	</div>
<script type="text/javascript">
		$(".nav-tabs>li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
</script>
	<%@ include file="../Common/footer.jsp"%>