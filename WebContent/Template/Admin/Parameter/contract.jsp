<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">合同相关参数</a></li>
		</ul>
		<div class="common-form">
			<form class="well form-search" method="post"
				action="/admin_post/index.html">
				<div class="h_a">合同相关参数</div>
				<div class="table_full">
					<table width="100%" class="table_form ">
						<tr>
							<th width="200">公司名称：</th>
							<td><input type="text" class="input"
								name="contract[companyName]" id="contract[companyName]"
								value="光谷金融服务有限公司" /></td>
						</tr>
						<tr>
							<th>PDF页眉LOGO：</th>
							<td><input data="logo" style="width: 300px" type="text"
								class="input" name="contract[logo]" id="contract[logo]"
								value="/uploadData/PDF/205-201502061604143701.png" /><span
								class="commonToolTip">推荐高度76px左右</span><input type="file"
								id="pdflogo" name="pdflogo"><span id="loading_makeclub"
								style="display: none"><img
									src="http://www.ggmoney.com/statics/common/images/loadingmini.gif" /></span></td>
						</tr>
						<tr>
							<th>电子印章：</th>
							<td><input data="seal" style="width: 300px" type="text"
								class="input" name="contract[seal]" id="contract[seal]"
								value="/uploadData/PDF/205-201502061604524576.png" /><span
								class="commonToolTip">推荐尺寸200px*200px</span><input type="file"
								id="pdfseal" name="pdfseal"><span id="loading_makeclub"
								style="display: none"><img
									src="http://www.ggmoney.com/statics/common/images/loadingmini.gif" /></span></td>
						</tr>
					</table>
				</div>
				<div class="btn_wrap">
					<div class="btn_wrap_pd">
						<button class="btn btn_submit mr10 J_ajax_submit_btn"
							type="submit">保存</button>
						&nbsp;&nbsp;<a href="javascript:;"
							onclick="window.history.back(-1);return false;">返回</a>
					</div>
				</div>


			</form>
		</div>
	</div>

	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li")
				.click(
						function() {
							var index = $(this).index();
							$(this).addClass("active").siblings().removeClass(
									"active");
							$(".J_check_wrap").eq(index).show().siblings(
									".J_check_wrap").hide();
						});
	</script>
	<script type="text/javascript"
		src="${AdminStatics}/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		$("#pdflogo,#pdfseal").live("change", function() {
			var uptype = $(this).attr('id');
			ajaxFileUploads(uptype);
		});
		function ajaxFileUploads(type) {
			$("#loading_makeclub").ajaxStart(function() {
				$(this).show();
			}).ajaxComplete(function() {
				$(this).hide();
			});
			var id = type.replace("pdf", '');
			$.ajaxFileUpload({
				url : '/newadmin-CacheContract-saveimg?type=' + type,
				secureuri : false,
				fileElementId : type,
				dataType : 'json',
				success : function(data, status) {
					if (data.status == 1) {
						$("input[data='" + id + "']").val(data.message);
					} else {
						alert(data.message);
					}
				}
			})
		}
	</script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>



</body>
</html>