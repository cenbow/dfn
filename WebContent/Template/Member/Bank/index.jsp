<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>银行账号_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	<div class="clearFix">
          		<div class="df_member_content_r_title">
                	银行卡号
                </div>

           <ul class="c_bankCardUl">
    <c:if test="${not empty bankList }">
        <c:forEach items="${bankList}" var="user">
           		<li>
                	<div class="c_bankCard_box">
                    	<div class="c_bankCard_box_top">
                        	<span class="fn_left">开户名：${user.UsrName}</span>
                        	<span class="f_right">借记卡</span>
                        </div>
                        <div class="c_bankCard_box_info">
                        	<div class="c_bankCard_num">
                            	${dfn:hideCard(user.CardId,"4","15")}
                            </div>
                            <div class="c_bankCard_box_img">
                            	<img  src="${MemberStatics}/images/bank/${user.BankId}.png">
                            </div>
                        </div>
                        <div class="edtBox">
                        	<a href="javascript:;" class="deleteBtn" onclick="delbank('${user.CardId}')"><img src="${MemberStatics}/images/c_delete.png"></a>
                        </div>
                    </div>
                </li>
        </c:forEach>
    </c:if>
           		<li>
                	<div class="c_bankCard_box">
                    	<div class="c_addCard">
                        	<a href="${dfn:U('thirdparty/tpsend/bindbank')}"><img src="${MemberStatics}/images/add_card.png"></a>
                        </div>
                    </div>
                </li>
           </ul>
           
           <div class="c_warmText">
           		温馨提示：银行卡实名认证信息与${_siteInfo_.siteName}实名认证信息一致,才能进行银行卡绑定。
           </div>





            </div>
          </div>  
     <!--df_member_content_r  END-->       
   <script type="text/javascript">
   $(".c_bankCard_box").hover(function(){
	   $(this).find(".edtBox").show();
   },function(){
	   $(this).find(".edtBox").hide();
   });
   function delbank(card){
	   Mix.confirm("删除确认","确定要删除此银行卡吗？",function(){
		   getData("${dfn:SU(_thisUrl_,'delbank')}",function(json){
			   if(json.status==1){
				   Mix.msg(json.msg,'success',2);
				   setTimeout(function(){
					   window.location.reload();
				   },2000);
			   }else{
				   Mix.alert(json.msg);
			   }
		   },{"cardNum":card},'json');
	   },function(){},2,['确认删除','暂不删除']);
   }
   </script>       
<%@ include file="../Common/footer.jsp"%>
