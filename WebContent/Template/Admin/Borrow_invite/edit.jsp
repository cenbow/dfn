<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="jj dialogBox" style="width: 600px; height:500px">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">借款信息</a></li>
			<li><a href="javascript:;">审核操作</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/borrow_invite/do_edit')}" class="form-horizontal J_ajaxForm">
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

			<div style="display:none" class="common-form cwh">
				<table>
					
                    <tr>
                      <th width="200" class="control-label">是否允许自动投标：</th>
                      <td>${dfForm:radio("can_auto",canAuto,data['can_auto'],"","","")}</td>
                    </tr>
                    <tr>
                      <th width="200" class="control-label">定向密码：</th>
                      <td>${dfForm:input( "borrow_pass", "", dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">不修改则留空</span></td>
                    </tr>
                    <tr>
                      <th width="200" class="control-label">最小投标金额：</th>
                      <td>${dfForm:input( "borrow_min", data['borrow_min'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip"></span></td>
                    </tr>
                    <tr>
                      <th width="200" class="control-label">最多投标总额：</th>
                      <td>${dfForm:input( "borrow_max", data['borrow_max'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">单人最多投标金额</span></td>
                    </tr>
                    <tr>
                      <th width="200" class="control-label">募集截止时间：</th>
                      <td><input class="input Wdate" style="width: 200px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"	name="collect_time" value="${data.collect_time}" />在前台展示天数，如在担心在设定时间内不能募集完成，可修改延长</td>
                    </tr>
					<tr>
						<th width="200" height="40px" class="control-label">状态：</th>
						<td>${dfForm:radio( "borrow_status",borrowStatus, "2", "","",dfForm_others)}
						
						
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
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
</script>
	<%@ include file="../Common/footer.jsp"%>