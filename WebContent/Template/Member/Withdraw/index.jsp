<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>资金提现_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	<a href="javascript:;" style="background:#BBBBBB;">资金提现</a>  <a href="${dfn:SU(_thisUrl_,'bindcard')}">绑定银行卡</a>  <a href="${dfn:SU(_thisUrl_,'detail')}">提现记录</a>
                </div>
                
                <ul class="invest_recharge" style="padding-top:30px;">
                    <li id="bank_shortcut" class="bank_recharge" style="padding-top:20px; display:block">
                        <span class="invest_name" style="font-size:18px; width:114px;">提现银行卡：</span>
                        <div class="invest_radio" id="kjarr" style="width:600px;">
                                <c:if test="${not empty bankList }">
                                    <c:forEach items="${bankList}" var="cardInfo">
                                               <div class="bank_radio" style="position: relative;"><input type="radio" class="bank_radio" name="bank_manner" value="${cardInfo.id}" style="position: absolute; opacity: 0;"><span class="bank_right${cardInfo.bank_name} bank_bg">${cardInfo.bank_name}</span><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                               
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty bankList}">
                                    <div class="add_bank">
                                    <span>请，<a href="${dfn:SU(_thisUrl_,'bindcard')}" class="ajaxReload">添加银行卡</a></span>
                                    </div>
                                </c:if>
                        
                        </div>
                        <div style="clear:both;"></div>
                    </li>
                </ul>
                        <script type="text/javascript">
							$("#bank_shortcut .bank_radio").click(function(){
								$(this).addClass('checked').siblings('.bank_radio').removeClass('checked');
							})
						</script>
                <div class="df_member_content_box">
					<div class="df_member_money_input">
                    	<label  for="df_member_topupMoney">输入提现金额</label>
                        <input type="text" autofocus id="withdrawMoney" class="df_member_inputB" alt="请输入提现金额" style="line-height:23px;font-size:18px;color:#898988;padding-left:7px;"/>

                        <a href="javascript:;" class="returnBtn">可用余额：${userMoney.account_money}</a>
                    </div>
					<div class="df_member_money_input" style="padding:0; border:0 none;">
						<label  for="df_member_topupMoney">输入支付密码</label>
						<input type="password" id="pass" style="padding-left:7px;color:#898988;line-height:23px;font-size:18px;background:url(${MemberStatics}/images/money_input-none.png) no-repeat center left" class="df_member_inputB" alt="请输入支付密码" />
	<a href="javascript:viod(0)" onclick="toRecharge();" class="confirmBtn"><img src="${MemberStatics}/images/confirmtx.png" /></a>
					</div>
                </div>
                <div style="padding-top:20px;">* 如果您想解除已绑定的银行卡，请参照协议<a href="http://www.p2pok.com/article/index.do?id=673" target="_blank" style="border-bottom:1px solid #69c1ff;color:#69c1ff;">《新浪支付快捷支付与银行卡变更协议》</a>，并<a href="http://float2006.tq.cn/static.jsp?version=vip&admiuin=9637954&ltype=0&iscallback=1&page_templete_id=83395&is_message_sms=0&is_send_mail=0&uin=9637954" target="_blank" style="border-bottom:1px solid #69c1ff;color:#69c1ff;">联系客服</a>。</div>
                <div class="warmPrompt">
                	<h3 class="warmPrompt-title">
                    	温馨提示：
                    </h3>
                    <ol class="warmPrompt_text" style="font-size:12px;line-height:20px;">
                    	<li>1：建议您优先使用<a href="#" class="yellow_3 aHover">工商银行</a><a href="#" class="yellow_3 aHover">,农业银行</a><a href="#" class="yellow_3 aHover">,建设银行</a>等银行卡进行充值</li>
                    	<li>2：投资人充值过程全程免费,不收任何手续费;</li>
                    	<li>3：最低充值金额应大于等于1元;</li>
                    	<li>4：请投资人根据发标计划合理充值,因${_siteInfo_.siteName}无法触及用回资金账户,无法收取用户任何费用,为防止套现,所充资金必须经投标回款后才能提现;</li>
                    	<li>5：充值/体现必须为银行借记卡,不支持存折,信用卡充值;</li>
                        <li>6：严禁利用充值功能进行信用卡套现,转账,洗钱等行为,一经发现,将封停账号30天;</li>
                        <li>7：充值期间,请勿关闭浏览器,待充值成功并返回首页后,所充资金才能入账,如有疑问,请<a href="http://float2006.tq.cn/static.jsp?version=vip&admiuin=9637954&ltype=0&iscallback=1&page_templete_id=83395&is_message_sms=0&is_send_mail=0&uin=9637954" target="_blank" class="colorBlue_m aHover">联系客服</a></li>
                        <li>8：充值需开通银行卡往后是哪个支付功能,如有疑问请咨询开户行客服</li>
                        <li>9：支付限额请参照<a href="http://www.p2pok.com/article/index.do?id=675" class="colorBlue_m aHover">支付说明</a>.</li>
                    </ol>
                </div>
            </div>
          </div>  
     <!--df_member_content_r  END-->       
            
<script type="text/javascript">
	$(function(){
		$(".confirmBtn").mouseover(function(){
			$(this).children().attr("src","/Statics/Member/images/confirmtx_hover.png");
		});
		$(".confirmBtn").mouseout(function(){
			$(this).children().attr("src","/Statics/Member/images/confirmtx.png");
		});
	});
function toRecharge(){
	var money = parseFloat($("#withdrawMoney").val());
	var pin = $("#pass").val();
	if(pin==""){
		Mix.tip("#pin","请输入支付密码",1,3);
		return false;
	}
	if(isNaN(money)||money<=0){
		Mix.tip("#withdrawMoney","请输入正确的提现金额",1,3);
		return false;
	}
	var bankId = $("#bank_shortcut .bank_radio.checked").find('input[name="bank_manner"]').val();
	if(typeof bankId=="undefined"){
		Mix.msg("请选定要提现的银行卡","fail",2);
		return false;
	}

	var p={};
	p.money=money;
	p.bank_id = bankId;
	p.pin_pass=pin;
	Mix.confirm("提现确认","您确定要提现"+money+"元吗？",function(){
		Mix.load("提交中，请稍候.....");
		getData("${dfn:SU(_thisUrl_,'dowithdraw')}",function(d){
			if(d.status==1){
				Mix.msg(d.msg,"success",2);
				setTimeout(function(){
				window.location.reload();
				},2000)
			}else{
				Mix.msg(d.msg,"fail",2);
			}
		},p,'json');	
	},function(index){
		Mix.close(index);
	},2,['确认提现','暂不提现']);
}
</script>
<%@ include file="../Common/footer.jsp"%>
