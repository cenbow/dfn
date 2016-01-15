<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>推荐/奖励_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	<a href="javascript:;" style="background:#BBBBBB">我的体验金</a>   <a href="${dfn:SU(_thisUrl_,'recommend')}">推荐赚钱</a>   <a href="${dfn:SU(_thisUrl_,'recommendlog')}">推广记录</a>
                </div>

        <ul class="c_bonusWarp clearFix" style="display:none">
        	<li>
            	<p>未使用体验金</p>
            	<p><span>${dfn:defaultValue(no_expired.num,"0")}</span>张</p>
            </li>
        	<li>
            	<p>未使用体验金总额</p>
            	<p><span>${dfn:defaultValue(no_expired.money,"0")}</span>元</p>
            </li>
        	<li>
            	<p>已使用体验金</p>
            	<p><span>${dfn:defaultValue(used.use_money,"0")}</span>元</p>
            </li>
        	<li style="border:none;">
            	<p>已过期体验金</p>
            	<p><span>${dfn:defaultValue(expired.money,"0")}</span>元</p>
            </li>
        </ul>
        <div id="include_page"><jsp:include page="list_page.jsp"/></div>
        
    	<h2 class="df_member_jfh2" style="padding-top:30px;">
           如何获取体验金 
        </h2>
        
        <ul class="c_process">
        	<li><a href="javascript:;"><img src="${MemberStatics}/images/c_step1.png"></a></li>
        	<li><a href="javascript:;"><img src="${MemberStatics}/images/c_step2.png"></a></li>
        	<li><a href="javascript:;"><img src="${MemberStatics}/images/c_step3.png"></a></li>
        	<li><a href="javascript:;"><img src="${MemberStatics}/images/c_step4.png"></a></li>
        </ul>
		
        <div class="df_member_awtip">
            <h5>温馨提示:</h5>
            <p>1、体验金使用，需满足体验金使用规则，且仅限于【新手体验专区】投资新手体验标；</p>
            <p>2、体验金请在体验金生效后，在有效期内及时用于投资，过期系统将予以自动回收、清零；</p>
            <p>3、体验金是${_siteInfo_.siteName}的一种虚拟货币，,不显示在用户可用资金中，不可转让、不可提现；</p>
            <p>4、投资所得收益即变为账户余额，可用以继续投资或直接提现；</p>
            <p>5、本次活动的最终解释权归${_siteInfo_.siteName}所有。</p>
            <p>6、使用过程中如有疑问，请联系拨打客服电话： 40000-10068</p>
      </div>
            </div>
          </div>  
     <!--df_member_content_r  END-->       
            
<script type="text/javascript">
function toRecharge(){
	var money = parseFloat($("#rechargeMoney").val());
	if(isNaN(money)||money<=0){
		Mix.tip("#rechargeMoney","请输入正确的充值金额",1,3);
		return false;
	}
	window.location.href="${dfn:U('thirdparty/tpsend/recharge')}?t_money="+money;
}
</script>
<%@ include file="../Common/footer.jsp"%>
