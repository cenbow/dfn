<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我的投资</title>
<link rel="stylesheet" type="text/css" href="${SiteStatics}/Common/JQtip/tip-yellowsimple/tip-yellowsimple.css" />
<SCRIPT language="javascript" src="${SiteStatics}/Common/JQtip/jquery.poshytip.js" type="text/javascript"></SCRIPT>
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
	<div class="df_member_content_r" style="_width: 770px;">
		<h2 class="df_member_jfh2">
             <a href="${dfn:SU(_thisUrl_,'index')}">网银充值</a>  <a href="${dfn:SU(_thisUrl_,'qcbank')}">快捷卡</a>  <a href="javascript:;" style="background:#BBBBBB">充值记录</a>
        </h2>
		<div class="df_member_zfir">
			<div class="df_member_zfirtime">
				<ul class="df_member_zfirul" data="timespan">
					<li>投资时间</li>
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
                    <a class="member_searchBtn" onClick="searchData()" type="submit" id="submitButton" >搜索</a>
				</ul>
			</div>
			<!-- end fir -->
			<div class="df_member_zfirtime" style="clear: both;">
				<ul class="df_member_zfirul" data="status">
					<li>充值状态</li>
					<li><span data="all" class="df_member_zcur">全部</span></li>
					<li><span data="0">未完成</span></li>
					<li><span data="1">成功</span></li>
					<li><span data="3">失败</span></li>
				</ul>
			</div>
        </div>
        <br/>
            
		<div style="clear: both;"></div>
		<div id="include_page" >
			<jsp:include page="detail_page.jsp"/>
		</div>


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
	var p=makevar(['startTime','endTime']);
		p['timespan'] = currentTimeSpan;
		p['status'] = currentStatus;
		if(typeof p['startTime']!="undefined"&&typeof p['endTime']!="undefined"){
			$(".df_member_zfirul[data='timespan']").find("li span").removeClass("df_member_zcur");
			$(".df_member_zfirul[data='timespan']").find("li span[data='all']").addClass("df_member_zcur");
		}
		var time1 = new Date().getTime(); ;
		$("#include_page").html(loadingPageHtml);
		getData("${dfn:SU(_thisUrl_,'detail_page')}",function(getHtml){
				var time2 = new Date().getTime(); ;
				if((time2-time1)<500) setTimeout(function(){ $("#include_page").html(getHtml);},500);
		},p,"html")
}

</script>
<%@ include file="../Common/footer.jsp"%>
	
	
	