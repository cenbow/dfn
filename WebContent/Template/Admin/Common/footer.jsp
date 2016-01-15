<script type="text/javascript">
var _currentUrl="";
var _ReferUrl="";
var _CurPageParm="";
var _ReferPageParm="";
function adminAjaxPageBar(){
	$("#page_bar a").live("click",function() {
		var url = $(this).attr("href");
		_ReferUrl = _currentUrl;
		_currentUrl = url;
		_CurPageParm = _currentUrl.substr(_currentUrl.indexOf("?",0));
		$.get(url, function(data) {
			$("#include_page").html(data);
		});
		return false;
	});
}
</script>
<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">	
		$(".nav-tab>li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".cwh").eq(index).show().siblings(".cwh").hide();
		});
	</script>
</body>
</html>