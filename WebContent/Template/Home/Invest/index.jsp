<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我要投资_P2P金融投资理财平台_融友网</title>
<meta name="keywords" content="P2P网贷投资_投资理财_理财产品">
<meta name="description" content="融友网投资频道为广大投资者提供安全、灵活、透明的投资理财服务，以及丰富的个性化理财产品，满足您各类理财需求。">

<script type="text/javascript">var isTransfer=false;</script>
<%@ include file="../Common/headerBody.jsp"%>
<!-- end top  -->
	<!-- secondpage_con start -->
	<div class="sec_con_wper pt30 pb30">
		<div class="sec_con px1000 pb30">
			<!-- 定投产品 start -->
			<div class="sec_con_product">
				<h3 class="sec_pro_tit" id="borrow_type">
					<span class="sec_span_cur" style="padding-left:20px; border-left:1px solid #d5d5d5" data="all">全部标的</span> <span class="sec_span_bg5" data="6">体验标</span><span class="sec_span_bg2" data="5">YOO精选</span> <span class="sec_span_bg6" data="2">YOO校园</span><span class="sec_span_bg1" data="1">一般借款</span> <!--<span class="sec_span_bg3" data="3">薪贷通</span>--><span class="sec_span_bg3" data="7">经营借款</span><span class="sec_span_bg4" data="10">债权转让</span>
				</h3>
				<div class="sec_pro_box">
					<div class="sec_pro_dai">
						<ul class="sec_pro_dai_ul _borrow_list clear clearfix" data="borrow_money">
							<li class="sec_dai_l25">借款金额：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="0,1000000">10万元以下</a></li>
							<li><a href="javascript:;" data="100000,500000">10-50万元</a></li>
							<li><a href="javascript:;" data="500000,1000000">50-100万元</a></li>
							<li><a href="javascript:;" data="1000000,100000000">100万元以上</a></li>
						</ul>
						<ul class="sec_pro_dai_ul _borrow_list clear clearfix" data="borrow_interest">
							<li class="sec_dai_l25">年化收益：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<!--<li><a href="javascript:;" data="7,10">7%-10%</a></li>-->
							<li><a href="javascript:;" data="10,13">10%-13%</a></li>
							<li><a href="javascript:;" data="13,16">13%-16%</a></li>
							<li><a href="javascript:;" data="16,100">16%以上</a></li>
						</ul>
						<ul class="sec_pro_dai_ul _borrow_list clear clearfix" data="borrow_duration">
							<li class="sec_dai_l25">借款周期：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="0,30">30天以内</a></li>
							<li><a href="javascript:;" data="1,2">1-2个月</a></li>
							<li><a href="javascript:;" data="3,5">3-5个月</a></li>
							<li><a href="javascript:;" data="6,12">6-12个月</a></li>
							<li><a href="javascript:;" data="12,100">12个月以上</a></li>
						</ul>
						<ul class="sec_pro_dai_ul _borrow_list clear clearfix" data="borrow_stauts">
							<li class="sec_dai_l25">项目进度：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="2">投资中</a></li>
							<li><a href="javascript:;" data="4">投资完成</a></li>
							<li><a href="javascript:;" data="6">还款中</a></li>
							<li><a href="javascript:;" data="7">已还款</a></li>
						</ul>


					</div>
					<!-- end 企业贷 -->
					<div class="sec_pro_dai" style="display: none;">
						<ul class="sec_pro_dai_ul _tran_list clear clearfix" data="transfer_money">
							<li class="sec_dai_l25">转让本金：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="0,1000000">10万元以下</a></li>
							<li><a href="javascript:;" data="100000,500000">10-50万元</a></li>
							<li><a href="javascript:;" data="500000,1000000">50-100万元</a></li>
							<li><a href="javascript:;" data="1000000,100000000">100万元以上</a></li>
						</ul>
						<ul class="sec_pro_dai_ul _tran_list clear clearfix" data="transfer_interest">
							<li class="sec_dai_l25">年化收益：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="7,10">7%-10%</a></li>
							<li><a href="javascript:;" data="10,13">10%-13%</a></li>
							<li><a href="javascript:;" data="13,16">13%-16%</a></li>
							<li><a href="javascript:;" data="16,100">16%以上</a></li>
						</ul>
						<ul class="sec_pro_dai_ul _tran_list clear clearfix" data="transfer_stauts">
							<li class="sec_dai_l25">转让状态：</li>
							<li><a href="javascript:;" data="all" class="dai_acur">全部</a></li>
							<li><a href="javascript:;" data="1">转让中</a></li>
							<li><a href="javascript:;" data="2">转让完成</a></li>
						</ul>
                    
                    </div>
					<!-- end 债权转让 -->
				</div>
			</div>
			<!-- 定投产品 end -->
			<!-- 产品列表 start -->
			<div class="sec_pro_list clear clearfix mt30">

				<div id="include_page_invest_page">
					<jsp:include page="invest_page.jsp" />
				</div>
					<script type="text/javascript">
					$(".sec_pagelink a").live("click",function(){
							var url = $(this).attr("href");
							$.get(url, function(data) {
								$("#include_page_invest_page").html(data);
							});
							return false;
					});
					</script>
				<!-- end left -->
				<div class="sec_pro_list_r fl">
					<h2 class="pro_list_r_h2">什么是YOO精选</h2>
					<div class="pro_list_r_text">
						<div style="line-height:23px;">YOO精选是融友网根据公司现行O2O模式自行发起上线的产品之一。借款人通过向公司申请借款后经风控实地考察、信息核实并完成法律手续等，由平台筛选推送到平台的优质债权。</div>
						<ul class="list_r_news pt10">
							<!--<li>侧面表现出微信的特</li>
							<li>侧面表现出微信的特</li>
							<li>侧面表现出微信的特</li>
							<li>侧面表现出微信的特</li>-->
						</ul>
					</div>
					<h2 class="pro_list_r_h2 mt20">常见问题</h2>
					<div class="pro_list_r_text">

						<ul class="list_r_news pt10">
							<li><a href="http://www.p2pok.com/category/index.do?id=365" style="color:#7e7e7e;">如何投资？</a></li>
							<li><a href="http://www.p2pok.com/category/index.do?id=365" style="color:#7e7e7e;">如何收取还款？</a></li>
							<li><a href="http://www.p2pok.com/category/index.do?id=365" style="color:#7e7e7e;">如何了解到投资项目的进展情况？</a></li>
							<li><a href="http://www.p2pok.com/tools/calculator.do" style="color:#7e7e7e;">投资回报怎样计算？</a></li>
							<li><a href="http://www.p2pok.com/category/index.do?id=365" style="color:#7e7e7e;">投标前需要注意哪些事项？</a></li>
						</ul>
					</div>
				</div>
				<!-- end right -->
			</div>
			<!-- 产品列表 end -->
		</div>
	</div>

	<!-- secondpage_con end  -->
	<script type="text/javascript">
		$(function() {
			$(".sec_pro_tit span").click(
			function() {
				$(this).addClass("sec_span_cur").siblings().removeClass("sec_span_cur");
				var index = $(this).index() - 1;
					isTransfer = $(this).hasClass("sec_span_bg4");
				if(isTransfer){
					$(".sec_pro_dai").eq(1).show().siblings().hide();
					searchTransferList();
				}else{
					$(".sec_pro_dai").eq(0).show().siblings().hide();
					searchBorrowList();
				}
				
			})
		});
	</script>
	<script type="text/javascript">
		$(function(){
			$(".sec_pro_dai_ul._borrow_list li a").click(
			function() {
				$(this).parents(".sec_pro_dai_ul._borrow_list").find("a").removeClass("dai_acur");
				$(this).addClass("dai_acur");
				searchBorrowList();
			})
			$(".sec_pro_dai_ul._tran_list li a").click(
			function() {
				$(this).parents(".sec_pro_dai_ul._tran_list").find("a").removeClass("dai_acur");
				$(this).addClass("dai_acur");
				searchTransferList();
			})
		})

		loadingPageHtml = '<div class="sec_pro_list_l fl mr20 pageLoading" style="text-align: center;  background: #FFFFFF;  padding: 50px 0px;"><img src="${SiteStatics}/Common/images/loading.gif"/></div>';

		function searchBorrowList(){
			var p={};
			var borrowType = $("#borrow_type span.sec_span_cur").attr("data");
			var borrowMoney = $(".sec_pro_dai_ul[data='borrow_money']").find('a.dai_acur').attr('data');
			var borrowDuration = $(".sec_pro_dai_ul[data='borrow_duration']").find('a.dai_acur').attr('data');
			var borrowInterest = $(".sec_pro_dai_ul[data='borrow_interest']").find('a.dai_acur').attr('data');
			var borrowStatus = $(".sec_pro_dai_ul[data='borrow_stauts']").find('a.dai_acur').attr('data');
			if(borrowType!='all') 		p['borrowType'] = borrowType;
			if(borrowMoney!='all') 		p['borrowMoney'] = borrowMoney;
			if(borrowDuration!='all') 	p['borrowDuration'] = borrowDuration;
			if(borrowInterest!='all') 	p['borrowInterest'] = borrowInterest;
			if(borrowStatus!='all') 	p['borrowStatus'] = borrowStatus;
			$("#include_page_invest_page").html(loadingPageHtml);
			var time1 = new Date().getTime(); ;
			getData("${dfn:SU(_thisUrl_,'invest_page')}",function(getHtml){
				var time2 = new Date().getTime(); ;
				if((time2-time1)<500) setTimeout(function(){ $("#include_page_invest_page").html(getHtml);},500);
			},p)
		}
		function searchTransferList(){
			var p={};
			var borrowMoney = $(".sec_pro_dai_ul[data='transfer_money']").find('a.dai_acur').attr('data');
			var borrowInterest = $(".sec_pro_dai_ul[data='transfer_interest']").find('a.dai_acur').attr('data');
			var borrowStatus = $(".sec_pro_dai_ul[data='transfer_stauts']").find('a.dai_acur').attr('data');
			if(borrowMoney!='all') 		p['transferMoney'] = borrowMoney;
			if(borrowInterest!='all') 	p['transferInterest'] = borrowInterest;
			if(borrowStatus!='all') 	p['transferStatus'] = borrowStatus;
			$("#include_page_invest_page").html(loadingPageHtml);
			var time1 = new Date().getTime(); ;
			getData("${dfn:U('home/transfer/transfer_page')}",function(getHtml){
				var time2 = new Date().getTime(); ;
				if((time2-time1)<500) setTimeout(function(){ $("#include_page_invest_page").html(getHtml);},500);
			},p)
		}
		
	</script>
<%@ include file="../Common/footer.jsp"%>