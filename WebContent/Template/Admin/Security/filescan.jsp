<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">可疑文件扫描</a></li>
			 <li ><a href="#">删除可疑文件</a></li>

		</ul>
		<div class="h_a">检测</div>
    <div class="search_type cc mb10">
      <div class="mb10"> <span class="mr20">
					对系统目录内的文件进行检测，对于不应该出现动态脚本的文件夹如果检测出动态脚本，则程序有可能已经被挂马，应立即清除
					<button class="btn" onClick="testfile();">检测</button>
				</span> </div>
      <div class="mb10"> <span class="mr20" id="testResult">
        </span> </div>
    </div>
   <div class="table_list" style="border:1px solid #CCC">
	<iframe src="" width="100%" height="500px" frameborder="0" id="fieltestShow"></iframe>
   </div>
</div>
<script type="text/javascript"> 
function testfile(){
	$("#testResult").html("检测中。。。");
	$("#fieltestShow").attr("src","/newadmin-SafeCenter-dofilescan");
}
function showDirListF(type){
	window.frames["fieltestShow"].showDirList(type);
}
function deleteAllF(type){
	window.frames["fieltestShow"].deleteAllFile();
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