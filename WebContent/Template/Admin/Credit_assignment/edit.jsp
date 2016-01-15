<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">

	<div class="wrap jj" style="width:500px">
		<form method="post" action="${dfn:U('admin/credit_assignment/doedit')}" class="form-horizontal J_ajaxForm" name="myform" id="myform" >
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">转让概况</a></li>
			<li><a href="javascript:;">转让明细</a></li>
		</ul>
			<div class="common-form cwh">
				<table>
					<tr>
						<th width="200"  class="control-label">标的名称： <input type="hidden" name="id" value="${vo.id }" />
						</th>
						<td>${vo.borrow_name}
						</td>
					</tr>
					<tr>
						<th class="control-label">转让总金额：</th>
						<td>${vo.credit_money}</td>
					</tr>
					<tr>
						<th class="control-label">转让溢价：</th>
						<td>${vo.transfer_fee}</td>
					</tr>
					<tr>
						<th class="control-label">接收方需支付：</th>
						<td>${vo.credit_money+vo.transfer_fee}</td>
					</tr>
					<tr>
						<th class="control-label">支付平台手续费：</th>
						<td>
                        <c:if test="${vo.status ==0}">
                        ${dfForm:input( "site_fee", vo['site_fee'], dfForm_class, dfForm_style,dfForm_others)}
						</c:if>
                        <c:if test="${vo.status !=0}">
                        ${vo.site_fee}
						</c:if>
						</td>
					</tr>
					<tr>
						<th class="control-label">申请时间：</th>
						<td>${vo.add_time}</td>
					</tr>
					<tr>
						<th width="200" height="40px" class="control-label">审核结果：</th>
						<td>${dfForm:radio("status",compareSignSelect,"2","","","")}</td>

					</tr>
					<tr>
						<th class="control-label">处理说明：</th>
						<td><textarea rows="5" cols="40" class="myarea" name="deal_info" id="deal_info"> </textarea>
					</tr>
				
				</table>
				
				
			</div>

			<div style="display: none;" class="common-form cwh">
				<table class="datalist" style="width:100%">
					<thead><th>期数</th><th>本金</th><th>利息</th></thead>
    <c:if test="${not empty list }">
        <c:forEach items="${list }" var="user">
					<tr>
						<td align="center">${user.sort_order}/${user.total}</td>
						<td align="center">${user.capital}</td>
						<td align="center">${user.interest}</td>
					</tr>
        </c:forEach>
    </c:if>

				</table>
			</div>
		<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">处理</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
	</div>
		</form>
<script type="text/javascript">
	$(".nav-tabs li").click(function() {
		var index = $(this).index();
		$(this).addClass("active").siblings().removeClass("active");
		$(".common-form").eq(index).show().siblings(".common-form").hide();
	});
</script>
<%@ include file="../Common/footer.jsp"%>