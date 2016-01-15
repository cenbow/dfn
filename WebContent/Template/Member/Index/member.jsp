<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>会员中心首页_${_siteInfo_.siteName}</title>
<script src="${SiteStatics}/Common/js/highcharts.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
	<div class="df_member_banner_wper">
		<div class="df_member_banner">
			<div class="df_member_banner_left">
				<a href=""><img src="${MemberStatics}/images/memtux.png"></a>
			</div>
			<div class="df_member_banner_right">
				<div class="df_member_banr_top">
					<em>下午好,<strong>小小新</strong>,喝杯茶吧,让精神抖擞起来
					</em><a href="${dfn:U('member/sitemsg/index')}" >有你0条新消息</a>
				</div>
				<div class="df_member_banr_bottom">
					<ul class="df_member_banr_bottomul">
						<li><span>登录名：${_USERINFO_.user_name}</span> 
                        <c:if test="${mvf.id_status eq 1}"><img src="${MemberStatics}/images/memicon1-1.png"></c:if>
                        <c:if test="${mvf.id_status != 1}"><a href="${dfn:U('member/safe/index')}"><img src="${MemberStatics}/images/memicon1.png"></a></c:if>
                        <c:if test="${mvf.phone_status eq 1}"><img src="${MemberStatics}/images/memicon2-2.png"></c:if>
                        <c:if test="${mvf.phone_status != 1}"><a href="${dfn:U('member/safe/index')}"><img src="${MemberStatics}/images/memicon2.png"></a></c:if>
                                </li>
						<li><span>安全等级：</span> <em>高</em> <!--<a href="">[提升]</a>--></li>
						<li><span>上次登陆时间：${loginInfo.add_time} </span></li>
						<li class="df_member_brnone"><em>[<c:if test="${not empty _USERINFO_.third_uid}"><a style="color:#ff9900" href="javascript:;">已绑定托管账户</a></c:if><c:if test="${empty _USERINFO_.third_uid}"><a style="color:#ff9900" href="javascript:;" onclick="bindtp();">绑定托管账户</a></c:if>] </em>
						</li>
					</ul>
				</div>
			</div>
            <script type="text/javascript">
			function bindtp(){
			Mix.load("提交中....");
			getData("${dfn:SU(_thisUrl_,'bindtp')}",function(d){
				if(d.status==1){
					Mix.msg("绑定成功",'success',2);
					setTimeout(function(){
						window.location.reload();
					},2000);
				}else{
					Mix.msg(d.msg,'fail',2);
				}
			},{},'json');
			}
			</script>
			<!-- end banner -->
			<div class="df_member_menue">
				<ul class="df_member_menueul">
	   	     	       <li>
	   	     	       	   <a href="javascript:;" class="df_member_menli_current">账户总览</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd">
	   	     	       	   <a href="${dfn:U('member/Capital/index')}">资产管理</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd">
	   	     	       	   <a href="${dfn:U('member/Myinvest/index')}">投资管理</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd">
	   	     	       	   <a href="${dfn:U('member/Myborrow/index')}">借款管理</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd">
	   	     	       	   <a href="${dfn:U('member/card/index')}">活动奖励</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd">
	   	     	       	   <a href="${dfn:U('member/Sitemsg/index')}">消息管理</a>
	   	     	       </li>
	   	     	       <li class="df_member_lipd" style="position:relative;">
	   	     	       	   <a href="${dfn:U('member/Recharge/index')}">账户管理</a>
							<img src="/Statics/Member/images/ry_ts_xs.png" style="visibility:hidden;position:absolute;z-index:999;top:-8px;left:0;" class="ry_ts_xs">
	   	     	       </li>

	   	     	   </ul>
			</div>
			<!-- end menue -->
		</div>
	</div>
	<!-- end banner -->
	<div class="df_member_content_wper">
		<div class="df_member_content" style="position: relative;">
			<div class="df_member_confir">
				<div class="df_member_confir_left">
					<div class="df_member_confl_money">
						<ul class="df_member_confl_moneyul1">
							<li><strong>￥</strong> <em>${userMoney.all_money}</em></li>
							<li><strong>￥</strong> <span>${userMoney.money_collect}</span></li>
							<li><strong>￥</strong> <span>${userMoney.collect_capital}</span></li>
							<li><strong>￥</strong> <span>${userMoney.money_freeze}</span></li>
							<li><strong>￥</strong> <span>${userMoney.account_money}</span></li>
						</ul>
						<ul class="df_member_confl_moneyul2">
							<li class="df_member_confl_itembg1">账户余额</li>
							<li class="df_member_confl_itembg2">待收总额</li>
							<li class="df_member_confl_itembg3">待收本金</li>
							<li class="df_member_confl_itembg4">冻结总额<img src="/Statics/Member/images/ry_dj.png" style="margin: -4px 10px 0 0;" title="当您的账户资金发生投标、体现等操作时，所涉金额会被冻结，完成操作后资金解冻。"></li>
							<li class="df_member_confl_itembg5">可用余额</li>

						</ul>
					</div>
					<!-- end money -->
					<div class="df_member_confl_shouyi">
						<ul class="df_member_confl_syul1">
							<li class="df_member_confl_syul1_item1">收益统计</li>
							<li class="df_member_confl_syul1_item2">收益时间</li>
							<li class="df_member_confl_syul1_item3 "><span	class="df_member_sycurrent " id="dfspan1">月视图</span></li>
							</li>
							<li class="df_member_confl_syul1_item5"><a href="${dfn:U('member/capital/detail')}">查看更多交易记录</a>
							</li>
						</ul>
						<div class="df_member_profit" id="dfbox1" style="height:300px">
							<!--<img src="${MemberStatics}/images/eg1.jpg">-->
						</div>
					</div>
				</div>
		<script type="text/javascript">
$(function () {
    $('#dfbox1').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: '平台收益月视图'
        },
        xAxis: {
            categories: [<c:if test="${not empty moneyLogList.list }">
			<c:forEach items="${moneyLogList.list }" var="month" varStatus="foreach">'${month.key}'<c:if test="${!foreach.last}">,</c:if></c:forEach>
		</c:if>]
        },
        yAxis: {
            title: {
                text: '收益金额'
            },
            labels: {
                formatter: function () {
                    return '￥'+this.value;
                }
            }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: '收益金额',
            marker: {
                symbol: 'square'
            },
			data:[<c:if test="${not empty moneyLogList.list }"><c:forEach items="${moneyLogList.list }" var="month" varStatus="foreach"><c:choose><c:when test="${month.value==moneyLogList.max}">{
                y: ${month.value},
                marker: {
                    symbol: 'url(${SiteStatics}/Common/images/sun.png)'
                }
            }</c:when><c:otherwise>${month.value}</c:otherwise></c:choose><c:if test="${!foreach.last}">,</c:if></c:forEach></c:if>]
        }]
    });
});
		</script>
				<!-- end left -->
				<div class="df_member_confir_right" >
					<div class="df_member_confr_fir">
						<a href="${dfn:U('member/recharge/index')}" class="df_member_confr_firbg1">充值</a> <a href="${dfn:U('member/withdraw/index')}"
							class="df_member_confr_firbg2">提现</a>
					</div>
					<div style="cursor:pointer;" class="df_member_confr_sec df_member_confr_secbg1" onclick="window.location.href='${dfn:U('member/Myinvest/index')}'">
						<span>${dfn:defaultValue(investorCount['0'],"0")}</span>个 您投资中项目
					</div>
					<div style="cursor:pointer;" class="df_member_confr_sec df_member_confr_secbg2" onclick="window.location.href='${dfn:U('member/Myinvest/index')}'">
						<span>${dfn:defaultValue(investorCount['4'],"0")}</span>个 投标回款中项目
					</div>
					<div style="cursor:pointer;" class="df_member_confr_sec df_member_confr_secbg3" onclick="window.location.href='${dfn:U('member/Myinvest/index')}'">
						<span>${dfn:defaultValue(investorCount['5'],"0")}</span>个 投标已完成项目
					</div>
				</div>

			</div>
			<!-- end confir -->

			<div class="df_member_consec">
				<div class="df_member_consec_fir">
					<ul class="df_member_consec_firul1">
						<li class="df_member_consecfirul1_item1">交易记录</li>
						<li
							class="df_member_consecfirul1_item2 df_member_consecfirul1_itembg1">自动投资</li>
						<li
							class="df_member_consecfirul1_item2 df_member_consecfirul1_itembg2">资产统计</li>
					</ul>
					<ul class="df_member_consec_firul2">
						<li class="dfmlie df_member_cfl_cur" id="ias1">最新投资记录</li>
						<li class="dfmlie" id="ias2">资金记录</li>
						<li class="dfmlie" id="ias3">充值记录</li>
						<li class="dfmlie" id="ias4">提现记录</li>
					</ul>
				</div>

				<div class="df_member_csf_box1 ajaxdata" id="dfboxs1" data="invest_record_page">
					<ul class="df_member_csf_boxul1">
                            <li class="df_member_zw170">项目名称</li>
                            <li class="df_member_zw80">投资金额</li>
                            <li class="df_member_zw80">收益率</li>
                            <li class="df_member_zw110">投资/计息日</li>
                            <li class="df_member_zw110">结束期</li>
                            <li class="df_member_zw80">已还/总期数</li>
                            <li class="df_member_zw110">应收利息</li>
                            <li class="df_member_zw110">应收总额</li>
					</ul>
					 <div id="invest_record_page">
						<jsp:include page="investment_record.jsp" />
					 </div> 
				</div>
				<div class="df_member_csf_box1 ajaxdata" id="dfboxs2" style="display: none;" data="capital_record_page">
					<ul class="df_member_csf_boxul1">
                            <li class="df_member_zw60">ID</li>
                            <li class="df_member_zw80">事件类型</li>
                            <li class="df_member_zw80">影响金额</li>
                            <li class="df_member_zw80">可用余额</li>
                            <li class="df_member_zw80">待收金额</li>
                            <li class="df_member_zw80">冻结金额</li>
                            <li class="df_member_zw130">发生时间</li>
                            <li class="df_member_zw170">说明</li>
					</ul>
					 <div id="capital_record_page" url="${dfn:SU(_thisUrl_,'capital_log')}">
						
                        
					 </div> 
				</div>

				<div class="df_member_csf_box1 ajaxdata" id="dfboxs3" style="display: none;" data="recharge_record_page">
					<ul class="df_member_csf_boxul1">
						<li class="df_member_w200">充值时间</li>
						<li class="df_member_w200">充值金额（元）</li>
						<li class="df_member_w90">手续费</li>
						<li class="df_member_w160">到帐金额</li>
						<li class="df_member_w150">充值状态</li>
						<li class="df_member_w150">订单号</li>
					</ul>
					 <div id="recharge_record_page" url="${dfn:SU(_thisUrl_,'recharge_log')}">
						
                        
					 </div> 
				</div>

				<div class="df_member_csf_box1" id="dfboxs4" style="display: none;" data="cash_record_page">
					<ul class="df_member_csf_boxul1">
						<li class="df_member_w90">提现时间</li>
						<li class="df_member_w200">提现金额（元）</li>
						<li class="df_member_w90">手续费</li>
						<li class="df_member_w160">到帐金额</li>
						<li class="df_member_w150">提现状态</li>
						<li class="df_member_w260">订单号</li>
					</ul>
					 <div id="cash_record_page" url="${dfn:SU(_thisUrl_,'cash_log')}">
						
                        
					 </div> 
				</div>

			</div>

			<!-- end consec -->
			<div class="df_member_rightpic">
				<img src="${MemberStatics}/images/mempic04.jpg">
			</div>

	<div class="ry_mask" <c:if test="${loginTimes.num gt 0}">style="display:none"</c:if>>
	<div class="ry_popup" style="margin-top:230px;">
	<img src="/Statics/Member/images/ry_ts.png">
	<div style="margin-top:15px;cursor:pointer;">
	<a href="http://www.p2pok.com/memberSafe/index.do" style="margin-right:15px;"><img src="/Statics/Member/images/ts_yes.png"></a>
	<img class="ts_no" src="/Statics/Member/images/ts_no.png"></div>
	</div>
	</div>
    
    
		</div>
	<script type="text/javascript">
	$("img").load(function() {
	$(".ry_ts_xs").show();
	})

	$(".ts_no").click(function(){
		$(".ry_mask").hide();
	$(".ry_ts_xs").hide();
	})
	</script>
	<script type="text/javascript">
		$("#page_bar a").live("click", function() {
			var url = $(this).attr("href");
			$.get(url, function(data) {
				$("#include_page").html(data);
			});
			return false;
		});
	</script>
<script type="text/javascript">
	$(function() {
		// 切换
		$(".dfmlie").click(
				function() {
					var _id, num;
					_id = $(this).attr('id');
					num = _id.substring(3, _id.length);
					$(this).addClass('df_member_cfl_cur').siblings().removeClass('df_member_cfl_cur');
					$(".df_member_csf_box1").hide();
					$("#dfboxs" + num).show();
					var pageID = $("#dfboxs"+num).attr("data");
					var url = $("#"+pageID).attr("url");
					var isGet = $("#"+pageID).attr("ajaxget");
					
					if(typeof url=="undefined"||isGet==1) return true;
					
					var time1 = new Date().getTime(); ;
					$("#"+pageID).html(loadingPageHtml);
					getData(url,function(getHtml){
							var time2 = new Date().getTime(); ;
							if((time2-time1)<500) setTimeout(function(){ $("#"+pageID).html(getHtml);},500);
							$("#"+pageID).attr("ajaxget","1");
					},{},"html")
					
				});
	})
</script>


<script type="text/javascript">
	$(function() {

		$(".df_member_menueul li a").click(
				function() {
					$(".df_member_menueul li a").removeClass(
							"df_member_menli_current");
					$(this).addClass("df_member_menli_current");
				})

	})
</script>
<script type="text/javascript">
	$(".df_member_confl_syul1_item3 span").click(
			function() {
				var _id, num;
				var _id = $(this).attr("id");
				var num = _id.substring(6, _id.length);
				$(".df_member_confl_syul1_item3 span").removeClass(
						"df_member_sycurrent");
				$(this).addClass("df_member_sycurrent");
				$(".df_member_profit").hide();
				$("#dfbox" + num).fadeIn();
			});

	function showDetail(id) {
		//背景
		var bgObj = document.getElementById("df_member_bgDiv");
		bgObj.style.width = document.body.offsetWidth + "px";
		bgObj.style.height = screen.height + "px";

		//定义窗口
		var msgObj = document.getElementById("df_member_msgDiv");
		msgObj.style.marginTop = -75 + document.documentElement.scrollTop
				+ "px";

		//关闭
		document.getElementById("msgShut").onclick = function() {
			bgObj.style.display = msgObj.style.display = "none";
		}
		msgObj.style.display = bgObj.style.display = "block";
		msgDetail.innerHTML = "111";

	}
</script>
<%@ include file="../Common/footer.jsp"%>