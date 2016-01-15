<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我的投资_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
	<div class="df_member_content_r" style="_width: 770px;">
		<h2 class="df_member_jfh2">我的投资</h2>
		<div class="df_member_zfir">
			<div class="df_member_zfirtime">
				<ul class="df_member_zfirul" data="timespan">
					<li>投资时间</li>
					<li style="cursor:pointer;"><span data="all" class="df_member_zcur">全部</span></li>
					<li style="cursor:pointer;"><span data="${timeSpan.day7}">最近7天</span></li>
					<li style="cursor:pointer;"><span data="${timeSpan.month1}">1个月</span></li>
					<li style="cursor:pointer;"><span data="${timeSpan.month3}">3个月</span></li>
				</ul>
				<ul class="df_member_zfirdate ">
					<span class="df_member_zfirdatespan">选择日期</span> 
					<input  class="input Wdate member_myselect" onFocus="WdatePicker({lang:'zh-cn'})" type="text" id = "startTime" value="${startTime}" />
								-
					<input class="input Wdate member_myselect" type="text" onFocus="WdatePicker({lang:'zh-cn'})" id ="endTime" value="${endTime}" />
				</ul>
			</div>
			<!-- end fir -->
			<div class="df_member_zfirtime" style="clear: both;">
				<ul class="df_member_zfirul" data="status">
					<li>项目状态</li>
					<li style="cursor:pointer;"><span data="all" class="df_member_zcur">全部</span></li>
					<li style="cursor:pointer;"><span data="1">竞标中</span></li>
					<li style="cursor:pointer;"><span data="4">还款中</span></li>
					<li style="cursor:pointer;"><span data="5">已还完</span></li>
				</ul>
				<ul class="df_member_zfirdate">
					<span class="df_member_zfirdatespan">借款名称</span>
					 ${dfForm:input( "borrow_name",'', dfForm_class, dfForm_style,dfForm_others)}
               		 <a class="member_searchBtn" onClick="searchData()" type="submit" id="submitButton" style="margin-left:10px;">搜索</a>
				</ul>
			</div>
        </div>
        <br/>
            
		<div style="clear: both;"></div>
		<div id="include_page" >
			<jsp:include page="invest_page.jsp"/>
		</div>

	
	<!-- end prolist -->
    <c:if test="${empty list.data }">
	<div class="df_member_ztip2">
		<span> <img src="${MemberStatics}/images/zin03.jpg"> 我要投资</span>
		<p>尊敬的用户您好，您目前没有投资项目，赶快来投资吧！</p>
		<a href="${dfn:U('home/invest/index')}">我要投资</a>
	</div>
	</div>
	<!-- 提示结束 -->
    </c:if>

	<!--df_member_content_r  END-->

<script type="text/javascript">
var currentTimeSpan="";
var currentStatus="";

$(".df_member_zfirul li span[data]").click(function(){
	var data = $(this).attr("data");
		data = (data=="all")?"":data;
	$(this).parent("li").siblings("li").find("span[data]").removeClass("df_member_zcur");
	$(this).addClass("df_member_zcur");
	var type = $(this).parents(".df_member_zfirul").attr("data");
	if(type=="status") currentStatus=data;
	else if(type=="timespan"){
		currentTimeSpan=data;
		$("#startTime").val('');
		$("#endTime").val('');
	}
	searchData();
})

function searchData(){
	var p=makevar(['borrow_name','startTime','endTime']);
		p['timespan'] = currentTimeSpan;
		p['status'] = currentStatus;
		if(typeof p['startTime']!="undefined"&&typeof p['endTime']!="undefined"){
			$(".df_member_zfirul[data='timespan']").find("li span").removeClass("df_member_zcur");
			$(".df_member_zfirul[data='timespan']").find("li span[data='all']").addClass("df_member_zcur");
		}
		var time1 = new Date().getTime(); ;
		$("#include_page").html(loadingPageHtml);
		getData("${dfn:U('member/Myinvest/invest_page')}",function(getHtml){
				var time2 = new Date().getTime(); ;
				if((time2-time1)<500) setTimeout(function(){ $("#include_page").html(getHtml);},500);
		},p,"html")
}


$(function() {
$(".df_member_zsecul2qishu").live('click',function() {
	var text = $(this).html();
	var id = $(this).attr("data");
	var isGet = $(this).attr("ajaxget");
	var _this = this;
	if(text=="还款详情"){
		$(".df_member_zsecdetail").hide();
		$(".df_member_zsecul2qishu").text("还款详情");
		$(".df_member_zsecul2qishu").removeAttr("style");
		if(isGet==1){
			$(this).text("收起");
			$(this).css("color", "#ff9900");
			$("#list_detail_"+id).show();
		}else{
			$(this).attr("ajaxget",1);
			getData("${dfn:U('member/Myinvest/detail_page')}?id="+id,function(getHtml){
				$(_this).text("收起");
				$(_this).css("color", "#ff9900");
				$(getHtml).appendTo("#list_"+id);
			},{},"html");
		}
	}else{
		$(this).removeAttr("style");
		$(this).text("还款详情");
		$(this).css("color", "rgb(46, 166, 226)");
		$("#list_detail_"+id).hide();
	}
});
})

function doTransfer(id,price,_this){
	getData("${dfn:U('member/Myinvest/doTransfer')}?id="+id+"&price="+price,function(res){
		if(res.status==0){
			Mix.msg(res.msg,"fail",3);
		}else{
		Mix.confirm("转让确认",res.msg,function(){
			price = parseFloat($("#transferPrice").val());
			if(isNaN(price)||price<=0){
				Mix.msg("请输入正确的转让价格",'fail',2);
				return false;
			}
			Mix.load("提交中,不要关闭页面......");
			getData("${dfn:U('member/Myinvest/doTransfer')}?id="+id+"&price="+price+"&is_confirm=1",function(d){
				if(d.status==1){
					Mix.msg(d.msg,'success',2);
					$(obj).html("---");
				}
				else  Mix.msg(d.msg,'fail',2);
			},{},'json');
		},function(index){
			Mix.close(index);
		},2,['确定转让','暂不转让']);
	}},{},"json");
}
</script>
<%@ include file="../Common/footer.jsp"%>
	
	
	