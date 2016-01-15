<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>${borrowInfo.borrow_name}_融友网</title>
<link rel="stylesheet" type="text/css" href="${HomeStatics}/editTPL/css/jquery.inputbox.css">		
<link rel="stylesheet" type="text/css" href="${HomeStatics}/editTPL/css/xrcss.css">		
<script type="text/javascript" src="${SiteStatics}/Common/js/calculator.js"></script>
<script type="text/javascript" src="${SiteStatics}/Common/js/jquery.imageScroller.js"></script>
<script src="${HomeStatics}/editTPL/js/xrjs.js"></script>
<script src="${HomeStatics}/editTPL/js/jquery.inputbox.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
<div class="repay_curpage_wper">
     <div class="repay_curpage px1000">
			<a href="${_WEB_ROOT_}/">融友网</a>><a href="${dfn:U('home/invest/index')}">我要投资</a>><a href="javascript:;">项目详情</a>
     </div>
</div>
<!-- end curpage -->
<div class="repay_con_wper pb30 mt10 repay_con_bb">
	   <div class="repay_con px1000">
	   	       <div class="repay_juandai">
	   	       	      <h2 class="repay_jd_tit clearfix"><span class="fl"><img src="${HomeStatics}/images/borrowico/${borrowInfo.borrow_type}.png">${borrowInfo.borrow_name}</span></h2>
	   	       	      <div class="repay_text">
	   	       	      	    <div class="repay_text_l fl">
	   	       	      	    	  <ul class="repay_tl_ul clear clearfix">
	   	       	      	    	  	  <li class="tl_w265 tl_br">
	   	       	      	    	  	  	  <span>借款总额：</span>
	   	       	      	    	  	  	  <strong>${borrowInfo.borrow_money}</strong>
	   	       	      	    	  	  </li>
	   	       	      	    	  	  <li class="tl_w185 tl_br">
	   	       	      	    	  	  	  <span>年化收益：</span>
	   	       	      	    	  	  	  <em class="tl_ft01"><strong>${borrowInfo.borrow_interest_rate}</strong>%</em>
	   	       	      	    	  	  </li>
	   	       	      	    	  	  <li class="tl_w110">
	   	       	      	    	  	  	  <span>借款周期：</span>
	   	       	      	    	  	  	  <em><strong>${borrowInfo.borrow_duration}</strong><c:if test="${borrowInfo.repayment_type ==4}">天</c:if><c:if test="${borrowInfo.repayment_type !=4}">个月</c:if></em>
	   	       	      	    	  	  </li>
	   	       	      	    	  </ul>
	   	       	      	    	  <p class="tl_baozhang clear clearfix"><span class="fl">保障范围：<img src="${HomeStatics}/images/repay_ben.png"><img src="${HomeStatics}/images/repay_xi.png"></span><span class="fr">还款方式：                              <c:choose>
                                <c:when test="${borrowInfo.repayment_type ==1}">按月等额本金</c:when>
                                <c:when test="${borrowInfo.repayment_type ==2}">按月等额本息</c:when>
                                <c:when test="${borrowInfo.repayment_type ==3}">到期一次性还本付息</c:when>
                                <c:when test="${borrowInfo.repayment_type ==4}">按天计息</c:when>
                                <c:when test="${borrowInfo.repayment_type ==5}">每月还息到期还本</c:when>
                                </c:choose>
</span></p>
	   	       	      	    	  <!--<p class="tl_ft02"><span>旅行服务商：名贷通杭州分公司</span></p>-->
	   	       	      	    	  <div class="tl_count clear clearfix">
	   	       	      	    	  	   <div class="fl">投标：${borrowInfo.borrow_times}人/次</div>
	   	       	      	    	  	   <div class="fr zyz_xmjd clearfix"><label class="fl">项目进度：</label><span class="ui-progressbar-mid ui-progressbar-mid-${borrowInfo.progress} fl">${borrowInfo.progress}%</span></div><br>
	   	       	      	    	  	   <span class=" fl pt20">剩余时间：<em class="loan_time">-------</em></span>
	   	       	      	    	  </div>
	   	       	      	    </div>  
	   	       	      	    <!-- end left -->
	   	       	      	    <div class="repay_text_r fl">
	   	       	      	    	   <p class="tr_ft01 pl30 mt20"><span>可投余额：</span><strong>${dfn:getFloatValue(borrowInfo.need)}</strong>元</p>
	   	       	      	    	   <p class="zyz_zhye tr_ft01">账户余额：
                                     <c:choose>
                                        <c:when test="${not empty _USERINFO_}">
                                         ${userMoney.account_money}元
                                        </c:when>
                                        <c:otherwise>
                                         <a href="${dfn:U('home/login/index')}">登录</a>后可见
                                        </c:otherwise>
                                    </c:choose>
                                   </p>
	   	       	      	    	   <p class="tr_ft01"><span>投资金额：</span></p>
	   	       	      	    	   <input type="text" placeholder="${borrowInfo.borrow_min}元起投" onkeyup="calculInterest(this);" class="tr_input" id="number" />
	   	       	      	    	    <p class="tr_ft01 pt10">预计收益：<strong id="getInterestMoney">0</strong>元</p>
	   	       	      	    	    <p class="overFlow clear clearfix pt10">
                                    <c:choose>
                                        <c:when test="${borrowInfo.borrow_status == 6}">
                                            <a class="tr_btn01 fl" href="javascript:;">还款中</a>
                                        </c:when>
                                        <c:when test="${borrowInfo.borrow_status == 4}">
                                            <a class="tr_btn01 fl" href="javascript:;">复审中</a>
                                        </c:when>
                                        <c:when test="${borrowInfo.borrow_status == 7}">
                                            <a class="tr_btn01 fl" href="javascript:;">已完成</a>
                                        </c:when>
                                        <c:when test="${borrowInfo.collect_time < currentTime}">
                                            <a class="tr_btn01 fl" href="javascript:;">已结束</a>
                                        </c:when>
                                        <c:when test="${borrowInfo.borrow_status == 6}">
                                            <a class="tr_btn01 fl" href="javascript:;">还款中</a>
                                        </c:when>
                                        <c:otherwise>
                                        <a href="javascript:;" onclick="showInvest(${borrowInfo.id});" class="tr_btn01 fl">立即投资</a>
                                        </c:otherwise>
                                     </c:choose>

                                   <a href="${dfn:U('home/tools/calculator')}" target="_blank" class="fl"><img src="${HomeStatics}/images/repay_cal.png"></a></p>
	   	       	      	    	  
	   	       	      	    </div>
	   	       	      	    <!-- end right -->
	   	       	      </div>
	   	       </div>
               <script type="text/javascript">
			    var allInterest = ${repaymentPlan.lxall};
				var allBorrow = ${borrowInfo.borrow_money};
			   	function calculInterest(obj){
					var _start  =obj.value.indexOf(".");
					if(_start<0){
						var ccc = obj.value;
					}else{
						var ccc =  obj.value.substring(0, _start);
					}
					obj.value=ccc.replace(/[^0-9]/g,'');
					var _tbnum = parseInt(obj.value);
						_tbnum=isNaN(_tbnum)?0:_tbnum;
					var _rate = accDiv(_tbnum,allBorrow);
					var interst=accMul(_rate,allInterest);
					$("#getInterestMoney").html(round2(interst,2));
				}
			   </script>
	   	       <!-- end 定投 -->
	   	       <div class="repay_seccon overFlow mt30 clear clearfix">
	   	       	     <div class="repay_seccon_l ">
	   	       	     	    <h2 class="seccon_tit seccon_h2"><span class="sec_curspan">项目详情</span><span>投资记录</span><span>还款计划</span> </h2>

	   	       	        <!-- 20150616改 -->
	   	       	     	    <div class="seccon_tbox">
	   	       	     	        <div class="seccon_box1">

                                 <!-- end  风控节点  -->
								${borrowInfo.borrow_info}

	   	       	     	    	   
                                   
	   	       	     	          <!-- end  认证资料 -->
	   	       	     	           <div class="seccon_pro  mt30">
	   	       	     	    	   	     <span class="seccon_pro_tit">图片资料</span>
	   	       	     	    	   	     <div id="demo" class="mt30">
                                                <div class="clearfix e_xgzj" style="margin-left:20px; margin-top:20px">
                                                    <div class="e_zl_l"><a href="javascript:;" id="btn1"><img src="${HomeStatics}/images/jiantouleft.jpg" /></a></div>
                                                    <div class="e_zl_r"><a href="javascript:;" id="btn2"><img src="${HomeStatics}/images/jiantouright.jpg" /></a></div>
                                                    <div class="clearfix e_zl_tp" id="imgSrc" style="width:855px; height:153px; overflow:hidden">
                                                        <div id="frame">
				<c:if test="${not empty deJson.img_type_1 }">
					<c:forEach items="${deJson.img_type_1 }" var="swfImgList"  varStatus="foreach">
												<dl><dt><a class="group" href="${_WEB_ROOT_}${swfImgList.img}"><img src="${dfn:getThumbImgUrl(swfImgList['img'])}" border="0" width="100px" /></a></dt><dd>${swfImgList.info}</dd></dl>
					</c:forEach>
				</c:if>
                                                        </div>
                                                    </div>
                                                </div>

										 </div>
	   	       	     	    	   	</div>
	   	       	     	          <!-- end 图片资料 -->
	   	       	     	        </div>	   
	   	       	     	
	   	       	     	    <!-- end 项目简介 -->
	   	       	     	    <div class="seccon_box1" style="display:none;" id="include_page_borrow_page">
                                <jsp:include page="investor_page.jsp" />
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
	   	       	     	    <!-- end 资金用途-->
	   	       	     	    <div class="seccon_box1" style="display:none;">
                                <jsp:include page="plan_page.jsp" />
	   	       	     	    </div>
	   	       	     	    <!-- end 企业信息-->
	   	       	     	   
	   	       	     	   
                          </div>

                          <!-- end seccon_tbox-->
                
                         
	   	       	     </div>
	   	       	     <!-- end left -->
	   	       	     
	   	       </div>
	   	       <!-- end repay_secon -->
	   </div>
</div>
<script type="text/javascript">
$(".seccon_h2 span").click(function() {
	  $(this).addClass("sec_curspan").siblings().removeClass("sec_curspan");
	  var index = $(this).index();
	  $(".seccon_box1").eq(index).show().siblings().hide();
})

$(function(){	
   $(".group").colorbox({rel:'group'});  
   $("#imgSrc").imageScroller({
		next:"btn1",
		prev:"btn2",
		frame:"frame",
		width:124,
		child: "dl",
		auto: true
	});	  
});
</script>
<script type="text/javascript">
	var lefttime=${borrowInfo.leftSecond};
	var pers = ${borrowInfo.progress};
	var timer=null;
	function setLeftTime() {
		timer = setInterval(function(){showSeconds();},1000);
	}
	function showSeconds() {
		var day1 = Math.floor(lefttime / (60 * 60 * 24));
		var hour = Math.floor((lefttime - day1 * 24 * 60 * 60) / 3600);
		var minute = Math.floor((lefttime - day1 * 24 * 60 * 60 - hour * 3600) / 60);
		var second = Math.floor(lefttime - day1 * 24 * 60 * 60 - hour * 3600 - minute * 60);
		if(lefttime<0){
			clearInterval(timer);
			$(".loan_time").html("投标已经结束！");
		}else {
			$(".loan_time").html("<span>"+day1+"</span>" + "天 " +"<span>"+ hour+"</span>" + "小时 "+"<span>" + minute+"</span>" + "分 "+"<span>" + second +"</span>" +"秒");
		}
		lefttime--;
	}
	$(function(){                
		if (pers >= 100) {
			$(".loan_time").html("投标已经结束！");
		}else{
			setLeftTime();
		}
	})
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

function showInvest(id){
		if(!id){
			 Mix.alert("数据有误");
			 return false;
		}
		var count = parseInt($("#number").val());
			count = !isNaN(count)?count:0;
		var p={"id":id,"number":count};
		Mix.get("${dfn:U('home/invest/showinvest')}","<span style='font-weight: bold;font-size: 16px;margin-top: 10px;color:#a8c982;padding-bottom: 5px'>我要投标</span>"+'<br>'+"${borrowInfo.borrow_name}",p);
}
function InvestMoney(id){
	var p=makevar(['invest_money','borrow_id','pin_pass','reward_money_use','card_id']);
	if(id!=p.borrow_id){
		 Mix.alert("出错了");
		 return false;
	}
	p["id"] = id;
	if($("#invest_money").length!=0){
		if(typeof p.invest_money=="undefined"){
			 Mix.tip("#invest_money","投标金额不能为0",1,3);
			 return false;
		}
	}
	if(typeof p.invest_money=="undefined"){
		 p['invest_money']=0;
	}
	if($("#borrow_pass").length!=0){
		 if($("#borrow_pass").val()==""){
			 Mix.tip("#borrow_pass","请输入定向标密码",1,3);
			return false;
		 }else{
			 p['borrow_pass'] = $("#borrow_pass").val();
		 }
	}
	if(p.reward_money_use>reward_money_have){
		 Mix.tip("#reward_money_use","您可用奖励金额为:"+reward_money_have,1,3);
		 return false;
	}
	p['__hash__'] = $("#investForm input[name='__hash__']").val();
	p['is_confirm']=1;
	Mix.load('提交中......');
	postData("${dfn:U('home/invest/investMoney')}",p,function(d){
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
			Mix.confirm("确认投标",d.msg,function(){
				Mix.load('提交中......');
				p['is_confirm']=0;
				postData("${dfn:SU(_thisUrl_,'investMoney')}",p,function(d){
					if(d.status==1){
						Mix.close();
						Mix.msg(d.msg,'success',2);
						location.reload();
					}
					else  Mix.msg(d.msg,'fail',2);
				});
				//window.location.href="${dfn:U('thirdparty/tpsend/invest')}?borrow_id="+p.id+"&invest_money="+p.invest_money+"&user_reward="+p.reward_money_use+"&card_id="+p.card_id;
			},function(index){
				Mix.close(index);
			},2,['确认投标','暂不投标']);
		}
	});
}
</script>
<%@ include file="../Common/footer.jsp"%>