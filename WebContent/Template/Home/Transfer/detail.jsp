<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>投资记录</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!-- header end -->
	<div class="repay_curpage_wper">
		<div class="repay_curpage px1000">
			<a href="${_WEB_ROOT_}/">融友网</a>><a href="${dfn:U('home/invest/index')}">我要投资</a>><a href="javascript:;">项目详情</a>
		</div>
	</div>
	<!-- end curpage -->
	<div class="repay_con_wper pb30 mt10 repay_con_bb">
		<div class="repay_con px1000">
			<div class="repay_juandai">
				<h2 class="repay_jd_tit">
					<img src="${HomeStatics}/images/repay_pic01.png">${borrowInfo.borrow_name}
				</h2>
				<div class="repay_text">
					<div class="repay_text_l fl">
						<ul class="repay_tl_ul clear clearfix">
							<li class="tl_w265 tl_br" style="width:220px"><span>转让价格：</span> <strong>${transferInfo.credit_money+transferInfo.transfer_fee}</strong>
							</li>
							<li class="tl_w185 tl_br"><span>年华收益：</span> <em
								class="tl_ft01"><strong>${borrowInfo.borrow_interest_rate}</strong>%</em></li>
							<li class="tl_w110"><span>转让溢价：</span> <em><strong>${transferInfo.transfer_fee}</strong></em>
							</li>
						</ul>
						<p class="tl_baozhang clear clearfix">
							<span class="fl">保障范围：<img
								src="${HomeStatics}/images/repay_ben.png"><img
								src="${HomeStatics}/images/repay_xi.png"></span><span class="fr">还款方式：一次付息
								到期还本</span>
						</p>
						<p class="tl_ft02">
							<span>履约服务商：名贷通杭州分公司</span>
						</p>
						<div class="tl_count clear clearfix">
							<span class="fl">投标人数：${borrowInfo.borrow_times}人/次</span> <span class="fr">剩余时间：<em class="loan_time">${borrowInfo.leftdays}</em></span>
						</div>
					</div>
					<!-- end left -->
					<div class="repay_text_r fl">
						<div class="pro_jindu clear clearfix">
							<span>项目进度：</span>
							<div class="repay_presswper fl">
								<div class="repay_press" style="width:${transferInfo.progress}%"></div>
							</div>
							<span>${transferInfo.progress}%</span>
						</div>
						<p class="tr_ft01">
							<span>可投余额：</span><strong>${transferInfo.need}</strong>元
						</p>
						<p class="tr_ft01">
							<span>投资金额：</span>
						</p>
						<input type="text" placeholder="${borrowInfo.borrow_min}元起投" class="tr_input" id="number" />
						<p class="overFlow clear clearfix pt10">
                        <c:choose>
                        	<c:when test="${transferInfo.status == 2}">
                                <a class="tr_btn01 fl" href="javascript:;">已转让</a>
                            </c:when>
                        	<c:when test="${transferInfo.status == 1}">
                                <a class="tr_btn01 fl" href="javascript:;" onclick="doTransfer(${transferInfo.id});">转让中</a>
                            </c:when>
							<c:otherwise>
							<a class="invest_btn" href="javascript:;">已结束</a>
                            </c:otherwise>
                         </c:choose>
                            <a href="" class="fl"><img	src="${HomeStatics}/images/repay_cal.png"></a>
						</p>
						<p class="tr_ft01 pt10">
							预计收益：<strong>1.30</strong>元
						</p>
					</div>
					<!-- end right -->
				</div>
			</div>
			<!-- end 定投 -->
			<div class="repay_seccon overFlow mt30 clear clearfix">
				<div class="repay_seccon_l mr20 fl">
					<h2 class="seccon_tit seccon_h2">
						<span class="sec_curspan">项目简介</span><span>资金用途</span><span>企业信息</span>
						<span>安全保障</span><span style="border-right: none;">还款来源</span>
					</h2>
					<div class="seccon_tbox">
						<div class="seccon_box1">
							<div class="seccon_pro">
								<span class="seccon_pro_tit">项目简介</span>
								<div class="seccon_ft01">
									要找到日本为何如此上心的答案，首先要读一下这份《关于海洋安全的声明》。虽然声明只有6页但满是官话话话
									内容颇为庞杂海上通商、走私和偷渡、打击海盗、生物多样性等多个方面。然而，声明第4段还是引起了记者注话 意。引起</div>
							</div>
							<!-- end pro -->
							<div class="seccon_pro  mt30">
								<span class="seccon_pro_tit">资金用途</span>
								<div class="seccon_ft01">
									要找到日本为何如此上心的答案，首先要读一下这份《关于海洋安全的声明》。虽然声明只有6页但满是官话话话
									内容颇为庞杂海上通商、走私和偷渡、打击海盗、生物多样性等多个方面。然而，声明第4段还是引起了记者注话 意。引起</div>
							</div>
							<!-- end pro -->
							<div class="seccon_pro  mt30">
								<span class="seccon_pro_tit">企业信息</span>
								<div class="seccon_ft01">
									要找到日本为何如此上心的答案，首先要读一下这份《关于海洋安全的声明》。虽然声明只有6页但满是官话话话
									内容颇为庞杂海上通商、走私和偷渡、打击海盗、生物多样性等多个方面。然而，声明第4段还是引起了记者注话 意。引起</div>
							</div>
							<!-- end pro -->
							<div class="seccon_pro  mt30">
								<span class="seccon_pro_tit">安全保障</span>
								<div class="seccon_ft01">
									要找到日本为何如此上心的答案，首先要读一下这份《关于海洋安全的声明》。虽然声明只有6页但满是官话话话
									内容颇为庞杂海上通商、走私和偷渡、打击海盗、生物多样性等多个方面。然而，声明第4段还是引起了记者注话 意。引起</div>
							</div>
							<!-- end pro -->
							<div class="seccon_pro  mt30">
								<span class="seccon_pro_tit">还款来源</span>
								<div class="seccon_ft01">
									要找到日本为何如此上心的答案，首先要读一下这份《关于海洋安全的声明》。虽然声明只有6页但满是官话话话
									内容颇为庞杂海上通商、走私和偷渡、打击海盗、生物多样性等多个方面。然而，声明第4段还是引起了记者注话 意。引起</div>
							</div>
						
							<!-- end pro -->
						</div>

						<!-- end 项目简介 -->
						<div class="seccon_box1" style="display: none;">2</div>
						<!-- end 资金用途-->
						<div class="seccon_box1" style="display: none;">3</div>
						<!-- end 企业信息-->
						<div class="seccon_box1" style="display: none;">4</div>
						<!-- end 安全保障-->
						<div class="seccon_box1" style="display: none;">5</div>
						<!-- end 还款来源-->
					</div>

					<!-- end seccon_tbox-->
					<!-- 投资记录 start -->

					<div id="include_page_borrow_page">
						<jsp:include page="borrow_page.jsp" />
					</div>

					<script type="text/javascript">
					$(".sec_pagelink a").live("click",function(){
							var url = $(this).attr("href");
							$.get(url, function(data) {
								$("#include_page_borrow_page").html(data);
							});
							return false;
					});
					</script>

					<!-- 投资记录 end -->
				</div>
				<!-- end left -->
				<div class="repay_secon_r fl">
					<div class="repay_r_fir">
						<h2>
							<img src="${HomeStatics}/images/repay_rs360.png">
						</h2>
						<p>湖南融圣360金融网络</p>
						<div class="re_ft05 pt10">何如此上心的答案，首先要读一下这份《关于
							海洋安全的声明》。虽然声明只有6页，但满 是官话，内容颇为庞杂海上通商、走私和偷渡 、打击海盗、生物多样性等多个方面。然而，
							声明第4段还是引起了记者注意。</div>


					</div>
					<!--end  -->
					<h3 class="re_r_h3 mt20">项目证明</h3>
					<ul class="re_r_ul">
						<li><span>营业执照</span> <img
							src="${HomeStatics}/images/repay_zhizhao.png"></li>
						<li class="ml20"><span>机构代码证</span> <img
							src="${HomeStatics}/images/repay_zhizhao.png"></li>
					</ul>
					<h3 class="re_r_h3 mt20">担保方资质证明</h3>
					<ul class="re_r_ul">
						<li><span>担保函</span> <img
							src="${HomeStatics}/images/repay_danbaohan.png"></li>
						<li class="ml20"><span>股东会决议</span> <img
							src="${HomeStatics}/images/repay_danbaohan.png"></li>
					</ul>
				</div>
				<!-- end right -->
			</div>
			<!-- end repay_secon -->
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".seccon_tit2 span").live("click",
					function() {
						$(this).addClass("sec_curspan").siblings().removeClass(
								"sec_curspan");
						var index = $(this).index();
						$(".record_box").eq(index).show().siblings().hide();
					})
		})
	</script>
<script type="text/javascript">
$(function(){	
 $(".group").colorbox({rel:'group'});  
});
</script>
<script type="text/javascript">
$(function(){
	var cornerHtml = '<span class="corner left_top"></span>';
        cornerHtml+='<span class="corner right_top"></span>';
	$(".borrow_tab li").click(function(){
		if($(this).hasClass('selected')) return false;
		$(this).siblings("li").removeClass("selected").find("span").remove();
		$(cornerHtml).appendTo($(this));
		$(this).addClass("selected");
		
		var indexb = $(this).index(".borrow_tab li");
		$(".detail_info_box .boxpd").hide().eq(indexb).show();
	})
})

function doTransfer(id){
	var p=makevar(['number']);
	p["id"] = id;
	if(typeof p.number=="undefined"){
		 Mix.tip("#number","承接金额不能为0",1,3);
		 return false;
	}
	var money = parseInt(p.number);
	if(isNaN(money)||money<=0){
		 Mix.tip("#number","请输入正确的承接金额",1,3);
		 return false;
	}
	/*if(typeof p.pin=="undefined"){
		 Mix.tip("#pin","支付密码不能为空",1,3);
		 return false;
	}*/

	p['is_confirm']=1;
	Mix.load('提交中......');
	postData("${dfn:U('home/transfer/transferMoney')}",p,function(d){
		if(d.status==0){
			Mix.msg(d.msg,'fail',1);
		}else if(d.status==2){
			Mix.confirm("余额不足",d.msg,function(){
				window.location.href="${dfn:U('member/recharge/index')}";
			},function(index){
				Mix.close(index);
			},2,['去充值','暂不充值']);
		}else if(d.status==3){
			Mix.alert(d.msg);
		}else if(d.status==4){
			Mix.confirm("确认承接",d.msg,function(){
				Mix.load('提交中......');
				window.location.href="${dfn:U('thirdparty/tpsend/creditAssign')}?id="+id+"&number="+money;
/*				p['is_confirm']=0;
				postData("${dfn:U('home/transfer/transferMoney')}",p,function(d){
					if(d.status==1){
						Mix.close();
						Mix.msg(d.msg,'success',2);
						location.reload();
					}
					else  Mix.msg(d.msg,'fail',2);
				});
*/			},function(index){
				Mix.close(index);
			},2,['确认承接','暂不承接']);
		}
	});
}
</script>
<%@ include file="../Common/footer.jsp"%>