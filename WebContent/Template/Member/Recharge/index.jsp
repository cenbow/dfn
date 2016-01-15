<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>在线充值_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	<a href="javascript:;" style="background:#BBBBBB">网银充值</a>  <a href="${dfn:SU(_thisUrl_,'qcbank')}">快捷卡</a>  <a href="${dfn:SU(_thisUrl_,'detail')}">充值记录</a>
                </div>
                <div class="df_member_content_box">
                    <ul class="invest_recharge" style="padding-top:30px;">
                        <li class="m_b_15">
                            <span class="invest_name">充值方式：</span>
                            <div class="invest_radio" id="rechargeType">
                                <div class="recharge_radio checked" style="position: relative;"><input type="radio" class="recharge_radio" name="manner" id="internet_radio" title="bank_internet" style="position: absolute; opacity: 0;"><span class="recharge_right">网上银行支付</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="recharge_radio" style="position: relative;"><input type="radio" class="recharge_radio" id="shortcut_radio" name="manner" title="bank_shortcut" style="position: absolute; opacity: 0;"><span class="recharge_right">快捷支付</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                            
                            </div>
                        </li>
                        <c:if test="${verifyStatus.id_status != 1}">
                        <li class="abank_recharge">
                            <span class="invest_name">身份认证：</span>
                            <div class="invest_radio" id="kjarr">
                                <div class="add_bank">
                                    <span>您还未进行身份认证，不能充值，请先完成，<a href="${dfn:U('member/safe/index')}" class="ajaxReload">身份认证</a></span>
                                </div>
                            
                            </div>
                            <div style="clear:both;"></div>
                        </li>
						</c:if>
                        
                        <c:if test="${verifyStatus.id_status eq 1}">
                        <li id="bank_internet" class="bank_recharge" style="padding-top:20px; <c:if test="${verifyStatus.id_status != 1}">display:none</c:if>">
                            <span class="invest_name">选择银行：</span>
                            <div class="invest_radio" id="onlinebank">
                            
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="BOC" style="position: absolute; opacity: 0;"><span class="bank_rightBOC bank_bg">中国银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="ICBC" style="position: absolute; opacity: 0;"><span class="bank_rightICBC bank_bg">中国工商银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CMB" style="position: absolute; opacity: 0;"><span class="bank_rightCMB bank_bg">招商银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CITIC" style="position: absolute; opacity: 0;"><span class="bank_rightCITIC bank_bg">中信银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="GDB" style="position: absolute; opacity: 0;"><span class="bank_rightGDB bank_bg">广发银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CBHB" style="position: absolute; opacity: 0;"><span class="bank_rightCBHB bank_bg">渤海银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="ABC" style="position: absolute; opacity: 0;"><span class="bank_rightABC bank_bg">中国农业银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="PSBC" style="position: absolute; opacity: 0;"><span class="bank_rightPSBC bank_bg">中国邮政储蓄银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CMBC" style="position: absolute; opacity: 0;"><span class="bank_rightCMBC bank_bg">中国民生银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio checked" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CCB" style="position: absolute; opacity: 0;"><span class="bank_rightCCB bank_bg">中国建设银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="COMM" style="position: absolute; opacity: 0;"><span class="bank_rightCOMM bank_bg">交通银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="SPDB" style="position: absolute; opacity: 0;"><span class="bank_rightSPDB bank_bg">浦发银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CZB" style="position: absolute; opacity: 0;"><span class="bank_rightCZB bank_bg">浙商银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="SZPAB" style="position: absolute; opacity: 0;"><span class="bank_rightSZPAB bank_bg">平安银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CEB" style="position: absolute; opacity: 0;"><span class="bank_rightCEB bank_bg">中国光大银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="BCCB" style="position: absolute; opacity: 0;"><span class="bank_rightBCCB bank_bg">北京银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="NJCB" style="position: absolute; opacity: 0;"><span class="bank_rightNJCB bank_bg">南京银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="CIB" style="position: absolute; opacity: 0;"><span class="bank_rightCIB bank_bg">兴业银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                    
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="HXB" style="position: absolute; opacity: 0;"><span class="bank_rightHXB bank_bg">华夏银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                
                                
                                <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="BOS" style="position: absolute; opacity: 0;"><span class="bank_rightBOS bank_bg">上海银行</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>                                
                            
                            </div>
                            <div style="clear:both;"></div>
                        </li>
                        
                        <li id="bank_shortcut" class="bank_recharge" style="padding-top:20px;">
                            <span class="invest_name">快捷银行：</span>
                            <div class="invest_radio" id="kjarr">
                                	<c:if test="${not empty cardInfo}">
                                   <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="${cardInfo.id}" style="position: absolute; opacity: 0;"><span class="bank_right${cardInfo.bank_name} bank_bg">${cardInfo.bank_name}</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>

                                   </c:if>
                                	<c:if test="${empty cardInfo}">
                                        <div class="add_bank">
                                        <span>您是否需要添加快捷支付，<a href="${dfn:SU(_thisUrl_,'qcbank')}" class="ajaxReload">添加快捷支付</a></span>
                                        </div>
                                    </c:if>
                            
                            </div>
                            <div style="clear:both;"></div>
                        </li>
                        </c:if>
                    </ul>
                        <script type="text/javascript">
							$("#rechargeType>div.recharge_radio").click(function(){
								$(this).addClass('checked').siblings().removeClass('checked');
								var index=$(this).index("#rechargeType>div.recharge_radio");
								$(".bank_recharge").eq(index).show().siblings('.bank_recharge').hide();
							})
							$("#onlinebank .bank_radio,#bank_shortcut .bank_radio").click(function(){
								$(this).addClass('checked').siblings('.bank_radio').removeClass('checked');
							})
						</script>
					<div class="df_member_money_input rchargeInputDefault" style="padding-bottom:0px">
                    	<label  for="df_member_topupMoney">输入充值金额</label>
                        <input type="text" autofocus id="rechargeMoney" class="df_member_inputB" alt="请输入充值金额" style="line-height:23px;font-size:18px;color:#898988;padding-left:7px;"/>
                        <a href="javascript:viod(0)" onclick="toRecharge();" class="confirmBtn"><img src="${MemberStatics}/images/confirm.png" /></a>
                        <a href="javascript:;" class="returnBtn">可用余额：${userMoney.account_money}</a>
                    </div>
					<div class="df_member_money_input qkrchargeD" style="padding-bottom:0px; display:none">
                    	<label  for="df_member_topupMoney">本次充值金额</label>
                        <b style="font-size:18px; color:#0C0" id="qkMoney">10000元</b>
                    </div>
					<div class="df_member_money_input qkrchargeD" style="padding:0px; display:none">
                    	<label  for="df_member_topupMoney">输入验证码：</label>
                        <input type="text" autofocus id="rechargeMoneyQC" class="df_member_inputB" placeholder="请输入快捷卡绑定手机所收到的验证码" />
                        <a href="javascript:viod(0)" onclick="toRechargeQC();" class="confirmBtn"><img src="${MemberStatics}/images/confirm.png" /></a>
                    </div>
                    
                </div>
                
                <div class="warmPrompt">
                	<h3 class="warmPrompt-title">
                    	温馨提示：
                    </h3>
                    <ol class="warmPrompt_text" style="font-size:12px;line-height:20px;">
                    	<li>1：建议您优先使用<a href="#" class="yellow_3 aHover">工商银行</a><a href="#" class="yellow_3 aHover">,农业银行</a><a href="#" class="yellow_3 aHover">,建设银行</a>等银行卡进行充值</li>
                    	<li>2：投资人充值过程全程免费,不收任何手续费;</li>
                    	<li>3：最低充值金额应大于等于1元;</li>
                    	<li>4：请投资人根据发标计划合理充值,因${_siteInfo_.siteName}无法触及用户资金账户,无法收取用户任何费用,为防止套现,所充资金必须经投标回款后才能提现;</li>
                    	<li>5：充值/提现必须为银行借记卡,不支持存折,信用卡充值;</li>
                        <li>6：严禁利用充值功能进行信用卡套现,转账,洗钱等行为,一经发现,将封停账号30天;</li>
                        <li>7：充值期间,请勿关闭浏览器,待充值成功并返回首页后,所充资金才能入账,如有疑问,请<a href="http://float2006.tq.cn/static.jsp?version=vip&admiuin=9637954&ltype=0&iscallback=1&page_templete_id=83395&is_message_sms=0&is_send_mail=0&uin=9637954" target="_blank" class="colorBlue_m aHover">联系客服</a></li>
                        <li>8：充值需开通网上银行才能进行充值，各个银行的银行卡都具有不同的支付功能，如对支付功能有疑问请咨询您的开户行客服</li>
                        <li>9：支付限额请参照<a href="http://www.p2pok.com/article/index.do?id=675" class="colorBlue_m aHover">支付说明</a>.</li>
                    </ol>
                </div>
            </div>
          </div>  
     <!--df_member_content_r  END-->       
            
<script type="text/javascript">
    $(function(){
        $(".confirmBtn").mouseover(function(){
            $(this).children().attr("src","/Statics/Member/images/confirm_hover.png");
        });
        $(".confirmBtn").mouseout(function(){
            $(this).children().attr("src","/Statics/Member/images/confirm.png");
        });
    });
var ticket='';
function toRecharge(){
	var rechargeType = $("#rechargeType div.recharge_radio.checked").index("#rechargeType div.recharge_radio");
	var money = parseFloat($("#rechargeMoney").val());
	if(isNaN(money)||money<=0){
		Mix.tip("#rechargeMoney","请输入正确的充值金额",1,3);
		return false;
	}
	if(rechargeType==0){
		var bankCode=$("#onlinebank .bank_radio.checked").find('input[name="bank_manner"]').val();
		window.location.href="${dfn:U('thirdparty/tpsend/recharge')}?t_money="+money+"&online_bank_bankid="+bankCode;
	}else{
		var bankId = $("#bank_shortcut .bank_radio.checked").find('input[name="bank_manner"]').val();
		if(typeof bankId=="undefined"){
			Mix.msg("请选定要使用的快捷卡","fail",2);
			return false;
		}

		var p={};
		p.money=money;
		p.bank_id = bankId;
		Mix.confirm("充值确认","您确认要通过快捷支付充值"+money+"元吗？",function(){
			Mix.load("提交中，请稍候.....");
			getData("${dfn:SU(_thisUrl_,'quickRecharge')}",function(d){
				if(d.status==1){
					$(".qkrchargeD").show();
					$(".rchargeInputDefault").hide();
					$("#qkMoney").html(money+"元");
					ticket=d.ticket;
					Mix.msg(d.msg,"success",1);
					//setTimeout(function(){
					//window.location.reload();
					//},2000)
				}else{
					Mix.msg(d.msg,"fail",2);
				}
			},p,'json');	
		},function(index){
			Mix.close(index);
		},2,['确认充值','暂不充值']);
	}
}

function toRechargeQC(){
	var code=$("#rechargeMoneyQC").val();	
	if(code==""){
		Mix.msg("请输入手机收到的验证码","rechargeMoneyQC",2); 
		return false;
	}
	var p={};
	p.ticket=ticket;
	p.code=code;	
	Mix.load('验证中......');
	postData("${dfn:SU(_thisUrl_,'doQuickRecharge')}",p,function(d){
		if(d.status==1){
			Mix.msg(d.msg,'success',2);
			setTimeout(function(){
				window.location.href="${dfn:SU(_thisUrl_,'detail')}";
			},2000)
		}
		else  Mix.msg(d.msg,'fail',2);
	});
}
</script>
<%@ include file="../Common/footer.jsp"%>
