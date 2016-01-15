<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>推荐赚钱</title>
<script type="text/javascript" src="${SiteStatics}/Common/ZeroClipboard/ZeroClipboard.js"></script>
<script language="JavaScript">
function initCopyCode() {
	ZeroClipboard.setMoviePath("${SiteStatics}/Common/ZeroClipboard/ZeroClipboard.swf" );
	var clip = new ZeroClipboard.Client();
	clip.setHandCursor( true );

	clip.setText("${xcode}"); 
	clip.addEventListener('complete', function (client, text) {
		Mix.msg("推荐码复制成功",'success',1);
	});
	clip.glue( 'xcodeCode', 'xcodeBtn');
}
function initCopyCodeUrl() {
	ZeroClipboard.setMoviePath("${SiteStatics}/Common/ZeroClipboard/ZeroClipboard.swf" );
	var clip = new ZeroClipboard.Client();
	clip.setHandCursor( true );

	clip.setText("${xurl}"); 
	clip.addEventListener('complete', function (client, text) {
		Mix.msg("推荐链接复制成功",'success',1);
	});
	clip.glue( 'xcodeUrl', 'xurlBtn');
}
</script>
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	<a href="${dfn:SU(_thisUrl_,'index')}">我的体验金</a>   <a href="javascript:;" style="background:#BBBBBB;">推荐赚钱</a>   <a href="${dfn:SU(_thisUrl_,'recommendlog')}">推广记录</a>
                </div>
				<div class="r_recommend">
                <ul class=" clearFix">
                    <li class="qcode">
                        <p class="r_rtitle">二维码推荐</p>
                        <p><img src="${_WEB_ROOT_}${ximg}" /></p>
                    </li>
                    <li class="r_xcode" id="xcodeCode">
                    	<p class="r_text">邀请朋友来注册、投资，注册时填写您的推荐码</p>
                        <p class="r_rtitle">推荐码</p>
                        <p class="r_code_text">${xcode}</p>
                        <p><span class="r_recommend_btn" id="xcodeBtn">复制推荐码</span></p>
                    </li>
                    <li class="r_xurl" id="xcodeUrl">
                    	<p class="r_text">复制推荐链接，邀请朋友来投资</p>
                        <p class="r_rtitle">邀请链接推荐</p>
                        <p><input type="text" style="width:310px;" class="r_xurl_input" value="${xurl}" onclick="this.select();" /></p>
                        <p><span class="r_recommend_btn" id="xurlBtn">复制邀请链接</span></p>
                    </li>
                </ul>
		</div>
        <script type="text/javascript">initCopyCode();initCopyCodeUrl();</script>
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
