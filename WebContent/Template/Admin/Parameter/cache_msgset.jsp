<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
	<div class="nav">
  <ul class="cc">
        <li class="current"><a href="/newadmin-msg_email-index-menuid-148.shtml">信息通知设置</a></li>
      </ul>
</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">借款者提醒</a></li>
			<li><a href="#">投资者提醒</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="h_a">借款者提醒</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200">初审通过：</th>
							<td><input type="checkbox"
								name="msgset[borrow][check_success][]" value="1"
								id="msgset[borrow][check_success]_1"><label
								for="msgset[borrow][check_success]_1">短信</label><input
								type="checkbox" name="msgset[borrow][check_success][]" value="2"
								id="msgset[borrow][check_success]_2"><label
								for="msgset[borrow][check_success]_2">邮件</label><input
								type="checkbox" checked="checked"
								name="msgset[borrow][check_success][]" value="3"
								id="msgset[borrow][check_success]_3"><label
								for="msgset[borrow][check_success]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">初审未通过：</th>
							<td><input type="checkbox"
								name="msgset[borrow][check_fail][]" value="1"
								id="msgset[borrow][check_fail]_1"><label
								for="msgset[borrow][check_fail]_1">短信</label><input
								type="checkbox" name="msgset[borrow][check_fail][]" value="2"
								id="msgset[borrow][check_fail]_2"><label
								for="msgset[borrow][check_fail]_2">邮件</label><input
								type="checkbox" name="msgset[borrow][check_fail][]" value="3"
								id="msgset[borrow][check_fail]_3"><label
								for="msgset[borrow][check_fail]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">复审通过：</th>
							<td><input type="checkbox"
								name="msgset[borrow][recheck_success][]" value="1"
								id="msgset[borrow][recheck_success]_1"><label
								for="msgset[borrow][recheck_success]_1">短信</label><input
								type="checkbox" name="msgset[borrow][recheck_success][]"
								value="2" id="msgset[borrow][recheck_success]_2"><label
								for="msgset[borrow][recheck_success]_2">邮件</label><input
								type="checkbox" name="msgset[borrow][recheck_success][]"
								value="3" id="msgset[borrow][recheck_success]_3"><label
								for="msgset[borrow][recheck_success]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">复审未通过：</th>
							<td><input type="checkbox"
								name="msgset[borrow][recheck_fail][]" value="1"
								id="msgset[borrow][recheck_fail]_1"><label
								for="msgset[borrow][recheck_fail]_1">短信</label><input
								type="checkbox" name="msgset[borrow][recheck_fail][]" value="2"
								id="msgset[borrow][recheck_fail]_2"><label
								for="msgset[borrow][recheck_fail]_2">邮件</label><input
								type="checkbox" checked="checked"
								name="msgset[borrow][recheck_fail][]" value="3"
								id="msgset[borrow][recheck_fail]_3"><label
								for="msgset[borrow][recheck_fail]_3">站内信</label></td>
						</tr>
					</table>
					</div>
			</form>
		</div>

		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="h_a">投资款者提醒</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200">投标操作：</th>
							<td><input type="checkbox"
								name="msgset[invest][invest_money][]" value="1"
								id="msgset[invest][invest_money]_1"><label
								for="msgset[invest][invest_money]_1">短信</label><input
								type="checkbox" name="msgset[invest][invest_money][]" value="2"
								id="msgset[invest][invest_money]_2"><label
								for="msgset[invest][invest_money]_2">邮件</label><input
								type="checkbox" checked="checked"
								name="msgset[invest][invest_money][]" value="3"
								id="msgset[invest][invest_money]_3"><label
								for="msgset[invest][invest_money]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">所投标复审通过：</th>
							<td><input type="checkbox"
								name="msgset[invest][recheck_success][]" value="1"
								id="msgset[invest][recheck_success]_1"><label
								for="msgset[invest][recheck_success]_1">短信</label><input
								type="checkbox" name="msgset[invest][recheck_success][]"
								value="2" id="msgset[invest][recheck_success]_2"><label
								for="msgset[invest][recheck_success]_2">邮件</label><input
								type="checkbox" name="msgset[invest][recheck_success][]"
								value="3" id="msgset[invest][recheck_success]_3"><label
								for="msgset[invest][recheck_success]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">所投标复审未通过：</th>
							<td><input type="checkbox"
								name="msgset[invest][recheck_fail][]" value="1"
								id="msgset[invest][recheck_fail]_1"><label
								for="msgset[invest][recheck_fail]_1">短信</label><input
								type="checkbox" name="msgset[invest][recheck_fail][]" value="2"
								id="msgset[invest][recheck_fail]_2"><label
								for="msgset[invest][recheck_fail]_2">邮件</label><input
								type="checkbox" name="msgset[invest][recheck_fail][]" value="3"
								id="msgset[invest][recheck_fail]_3"><label
								for="msgset[invest][recheck_fail]_3">站内信</label></td>
						</tr>
						<tr>
							<th width="200">收到还款：</th>
							<td><input type="checkbox"
								name="msgset[invest][get_repayment][]" value="1"
								id="msgset[invest][get_repayment]_1"><label
								for="msgset[invest][get_repayment]_1">短信</label><input
								type="checkbox" name="msgset[invest][get_repayment][]" value="2"
								id="msgset[invest][get_repayment]_2"><label
								for="msgset[invest][get_repayment]_2">邮件</label><input
								type="checkbox" checked="checked"
								name="msgset[invest][get_repayment][]" value="3"
								id="msgset[invest][get_repayment]_3"><label
								for="msgset[invest][get_repayment]_3">站内信</label></td>
						</tr>
					</table>

				</div>
			</form>
		</div>
		<div class="btn_wrap">
					<div class="btn_wrap_pd">
						<button class="btn btn_submit mr10 J_ajax_submit_btn"
							type="submit">保存</button>
						&nbsp;&nbsp;<a href="javascript:;"
							onclick="window.history.back(-1);return false;">返回</a>
					</div>
				</div>
		
		</div>
		<script src="${AdminStatics}/js/common.js"></script>
		<script type="text/javascript">
			$(".nav-tabs li").click(
					function() {
						var index = $(this).index();
						$(this).addClass("active").siblings().removeClass(
								"active");
						$(".common-form").eq(index).show().siblings(
								".common-form").hide();
					});
		</script>
		<script type="text/javascript"
			src="${AdminStatics}/js/content_addtop.js"></script>
		<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>