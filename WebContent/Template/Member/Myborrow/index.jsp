<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>借款总表_${_siteInfo_.siteName}</title>
<style type="text/css">.df_member_zw80{width:85px}</style>
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
	<div class="df_member_content_r" style="_width: 770px;">
		<h2 class="df_member_jfh2">我的借款</h2>
		<div class="df_member_zfir">
			<div class="df_member_zfirtime">
				<ul class="df_member_zfirul" data="timespan">
					<li>借款时间</li>
					<li><span data="all" class="df_member_zcur">全部</span></li>
					<li><span data="${timeSpan.day7}">最近7天</span></li>
					<li><span data="${timeSpan.month1}">1个月</span></li>
					<li><span data="${timeSpan.month3}">3个月</span></li>
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
					<li><span data="all" class="df_member_zcur">全部</span></li>
					<li><span data="0">待初审</span></li>
					<li><span data="2">募集中</span></li>
					<li><span data="4">复审中</span></li>
					<li><span data="6">还款中</span></li>
					<li><span data="7">已还完</span></li>
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
	<div style="margin-top:10px;">
	<p>*尊敬的用户，由于平台还款到账时间在15：00之后是T+2个工作日，为避免逾期，请将近期还款金额充值并及时还款。</p>
	</div>
		<div id="include_page" >
					<jsp:include page="invest_page.jsp"/>
		</div>

	
	<!-- end prolist -->
	<!--<div class="df_member_ztip2">

		<span> <img src="${MemberStatics}/images/zin03.jpg"> 我要投资
		</span>
		<p>尊敬的用户您好，您目前没有投资项目，赶快来投资吧！</p>
		<a href="${dfn:U('home/invest/index')}">我要投资</a>
	</div>-->

	</div>
	<!-- 提示结束 -->

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
		getData("${dfn:U('member/Myborrow/invest_page')}",function(getHtml){
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
	if(text=="详情"){
		$(".df_member_zsecdetail").hide();
		$(".df_member_zsecul2qishu").text("详情");
		$(".df_member_zsecul2qishu").removeAttr("style");
		if(isGet==1){
			$(this).text("收起");
			$(this).css("color", "#2ea6e2");
			$("#list_detail_"+id).show();
		}else{
			$(this).attr("ajaxget",1);
			getData("${dfn:U('member/Myborrow/detail_page')}?id="+id,function(getHtml){
				$(_this).text("收起");
				$(_this).css("color", "#2ea6e2");
				$(getHtml).appendTo("#list_"+id);
			},{},"html");
		}
	}else{
		$(this).removeAttr("style");
		$(this).text("详情");
		$("#list_detail_"+id).hide();
	}
});
})
function repaymentMoney(borrow_id,sort_order,obj){
	Mix.load("还款中....");
	getData("${dfn:U('member/Myborrow/doRepayment')}?id="+borrow_id+"&sort_order="+sort_order,function(rdata){
		if(rdata.status==1){
			$(obj).html("已还款");
			$(obj).removeAttr("onclick");
			Mix.msg(rdata.msg,"success",2);
		}else  Mix.msg(rdata.msg,"fail",2);
	},{},"json");			
}
</script>
<%@ include file="../Common/footer.jsp"%>
	
	
	