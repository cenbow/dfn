<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我的体验金</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	<a href="${dfn:SU(_thisUrl_,'index')}">我的体验金</a>   <a href="${dfn:SU(_thisUrl_,'recommend')}">推荐赚钱</a>   <a href="javascript:;" style="background:#BBBBBB">推广记录</a>
                </div>

        <div id="include_page_recommend"><jsp:include page="recommend_page.jsp"/></div>
        
		
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
<%@ include file="../Common/footer.jsp"%>
