<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<style type="text/css">
.table_list tr.higlight_select td {
	background-color: #CC0
}
</style>

<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">文件夹权限检测</a></li>
		</ul>
		<div class="h_a">检测</div>
		<div class="search_type cc mb10">
			<div class="mb10">
				<span class="mr20">
					对系统目录的读写和执行权限进行检测，对于程序无需写入和执行的文件夹不给予相应的权限，可在一定程度上防止程序挂马
					<button class="btn" onClick="testfile();">检测</button>
				</span>
			</div>
			<div class="mb10">
				<span class="mr20" id="testResult"> </span>
			</div>
		</div>
		<div class="table_list" style="border: 1px solid #CCC">
			<iframe src="" width="100%" height="500px" frameborder="0"
				id="fieltestShow"></iframe>
		</div>
	</div>
	<script type="text/javascript">
		function testfile() {
			$("#testResult").html("扫描中。。。");
			$("#fieltestShow").attr("src", "/newadmin-SafeCenter-dofiletest");
		}
		function showDirListF(type) {
			window.frames["fieltestShow"].showDirList(type);
		}
	</script>



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
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>



</body>
</html>