<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>快捷银行卡</title>
<SCRIPT language="javascript" src="${SiteStatics}/Common/js/area.js" type="text/javascript"></SCRIPT>
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
	<div class="df_member_content_r" style="_width: 770px;">
		<h2 class="df_member_jfh2">
                	<a href="${dfn:SU(_thisUrl_,'index')}">资金提现</a>  <a href="javascript:;" style="background:#BBBBBB;">绑定银行卡</a>  <a href="${dfn:SU(_thisUrl_,'detail')}">提现记录</a>
        </h2>
		<div class="df_member_zfir">
                        <c:if test="${verifyStatus.id_status != 1}">
                        <li class="abank_recharge">
                            <span class="invest_name">身份认证：</span>
                            <div class="invest_radio" id="kjarr">
                                <div class="add_bank">
                                    <span>您还未进行身份认证，不能绑定银行卡，请先完成，<a href="${dfn:U('member/safe/index')}" class="ajaxReload">身份认证</a></span>
                                </div>
                            
                            </div>
                            <div style="clear:both;"></div>
                        </li>
						</c:if>

           <ul class="c_bankCardUl" style="margin-left:0px">
                <c:if test="${not empty bankList }">
                    <c:forEach items="${bankList}" var="user">
                            <li>
                                <div class="c_bankCard_box">
                                    <div class="c_bankCard_box_top">
                                        <span class="fn_left">开户名：${useri.real_name}</span>
                                        <span class="f_right">借记卡<c:if test="${user.card_type eq 'q'}">[快捷卡]</c:if></span>
                                    </div>
                                    <div class="c_bankCard_box_info">
                                        <div class="c_bankCard_num">
                                            ${dfn:hideCard(user.bank_num,"4","15")}
                                        </div>
                                        <div class="c_bankCard_box_img">
                                            <img  src="${MemberStatics}/images/bank/${user.bank_name}.png">
                                        </div>
                                    </div>
                                    <div class="edtBox">
                                        <a href="javascript:;" class="deleteBtn" onclick="delbank('${user.CardId}')"><img src="${MemberStatics}/images/c_delete.png"></a>
                                    </div>
                                </div>
                            </li>
                    </c:forEach>
                </c:if>
                <c:if test="${verifyStatus.id_status eq 1}">
           		<li>
                	<div class="c_bankCard_box">
                    	<div class="c_addCard">
                        	<a href="javascript:;" onclick="$('#addBankForm').show();"><img src="${MemberStatics}/images/add_card.png"></a>
                        </div>
                    </div>
                </li>
                </c:if>
           </ul>
                        
          <form id="addBankForm" name="addBankForm" style="display:none">
              <table class="data_table m_t_b_20">
                  <tbody>
          
                      <tr>
                          <td class="tdTitle">
                               您当前的银行名称：
                          </td>
                          <td class="tdValue">
                          <select name="bank_name" class="myselect input_select" id="bank_name"><option value="BOC">中国银行</option><option value="ICBC">工商银行</option><option value="ABC">农业银行</option><option value="GDB">广发银行</option><option value="CCB">建设银行</option><option value="SPDB">浦发银行</option><option value="CMB">招商银行</option><option value="BOS">上海银行</option><option value="PSBC">中国邮政储蓄银行</option><option value="CMBC">中国民生银行</option><option value="CIB">兴业银行</option><option value="CEB">光大银行</option><option value="CITIC">中信银行</option><option value="NJCB">南京银行</option><option value="SZPAB">平安银行</option><option value="CZB">浙商银行</option><option value="CBHB">渤海银行</option><option value="HXB">华夏银行</option></select>                </td>
                      </tr>
                      <tr>
                          <td class="tdTitle">
                              您银行账号户主姓名：
                          </td>
                          <td class="tdValue">
                              <span id="spname">${useri.real_name}</span><span style="color: Red; margin: 0px 5px;">*</span>
                          </td>
                      </tr>
                      <tr style="display: none;">
                          <td class="tdTitle">
                              您的当前的银行账号：
                          </td>
                          <td class="tdValue">
                              <input type="text" class="input input_text" name="txt_oldaccount" id="txt_oldaccount" value=""><span style="color: Red; margin: 0px 5px;">*</span> (为了您的资金安全，请输入您当前的银行账号)
                          </td>
                      </tr>
                      <tr>
                          <td class="tdTitle">
                              输入您新的银行账号：
                          </td>
                          <td class="tdValue">
                              <input type="text" class="input input_text" name="txt_account" id="txt_account" value=""><span style="color: Red; margin: 0px 5px;">*</span> (信用卡账号无法提现，请不要误填)
                          </td>
                      </tr>
                      <tr>
                          <td class="tdTitle">
                             确认您新的银行账号：
                          </td>
                          <td class="tdValue">
                              <input type="text" class="input input_text" name="txt_confirmaccount" id="txt_confirmaccount" value=""><span style="color: Red; margin: 0px 5px;">*</span> (请再次确认您添加的银行账号)
                          </td>
                      </tr>
                      
                      <tr>
                          <td class="tdTitle">
                              开户银行所在省份：
                          </td>
                          <td class="tdValue">
                              <select name="selectp" id="province" style="width: 110px;" class="myselect input_select"><option value="">--请选择省份--</option></select>
                              <span style="color: Red; margin: 0px 5px;">*</span>
                          </td>
                      </tr>
                      <tr>
                          <td class="tdTitle">
                              开户银行所在市：
                          </td>
                          <td class="tdValue">
                              <select name="selectc" id="city" style="width: 110px;" class="myselect input_select"><option value="">--请选择城市--</option></select>
                              <select name="selectc" id="district" style="width: 110px; display:none" class="selectStyle"><option value="">--请选择城市--</option></select>
                              <span style="color: Red; margin: 0px 5px;">*</span>
                          </td>
                      </tr>
                      
          
                      <tr class="tdoptional">
                          <td class="tdTitle">
                             手机号：
                          </td>
                          <td class="tdValue">
                              <input type="text" class="input input_text" name="txt_phone" id="txt_phone" value=""> <span style="color: Red; margin: 0px 5px;">*</span> (此卡在银行预留手机号)
                          </td>
                      </tr>
          
                      <tr class="tdoptional">
                          <td class="tdTitle">
                             请输入收到的验证码：
                          </td>
                          <td class="tdValue">
                              <input type="text" class="input input_text" name="txt_code_add" id="txt_code_add" value=""><a class="but_return send" href="javascript:" id="sendCode" style="background:#69c1ff;margin-left:10px;color:#ffffff;padding:5px 15px;border-radius:5px;">发送验证码</a>
                          </td>
                      </tr>
                        <tr>
                            <td colspan="2"><input type="checkbox">  我已阅读并同意<a style="color:#69c1ff" href="http://www.p2pok.com/article/index.do?id=673" target="_blank">《新浪支付快捷支付与银行卡变更协议》</a>
    </td>
                        </tr>
                      <tr>
                          <td class="tdTitle">
                          </td>
                          <td class="tdValue">
                              <a class="but" href="javascript:" id="bankspecbind" onclick="addBank();"><img src="${MemberStatics}/images/submit.png" /></a>
                          </td>
                      </tr>
                  </tbody>
              </table>
          </form>
    <div style="padding-top:20px;">* 如果您想解除已绑定的银行卡，请参照协议<a href="http://www.p2pok.com/article/index.do?id=673" target="_blank" style="border-bottom:1px solid #69c1ff;color:#69c1ff;">《新浪支付快捷支付与银行卡变更协议》</a>，并<a href="http://float2006.tq.cn/static.jsp?version=vip&admiuin=9637954&ltype=0&iscallback=1&page_templete_id=83395&is_message_sms=0&is_send_mail=0&uin=9637954" target="_blank" style="border-bottom:1px solid #69c1ff;color:#69c1ff;">联系客服</a>。</div>
</div>
</div>
	<!--df_member_content_r  END-->
    
<script type="text/javascript">
var areaurl="${dfn:U('home/Common/getArea')}";
var s = new GetAreaSelect('#province','#city','#district');
var ticket='';
var cid=0;
function addBank(){
	var p=makevar(['bank_name','txt_phone','province','city','txt_code_add','txt_oldaccount','txt_account','txt_confirmaccount']);
	p.province = $("#province option:selected").text();
	p.city = $("#city option:selected").text();
	p['ticket']=ticket;
	p['cid']=cid;
	Mix.load('提交中......');
	postData("${dfn:U('member/recharge/bindcard')}",p,function(d){
		if(d.status==1){
			Mix.msg(d.message,'success',2);
			window.location.reload();
		}else  Mix.msg(d.message,'fail',2);
	});

}

 var second=60;
 var timer=null;
 var mbTest = /^(13|14|15|18|17)[0-9]{9}$/;
 $(function(){
	$("#sendCode").bind("click",function(){
		sendPhoneCode();
	});
 })
 
 function sendPhoneCode(){
	var p=makevar(['bank_name','txt_phone','province','city','txt_code_add','txt_oldaccount','txt_account','txt_confirmaccount']);
	 var phone = $("#txt_phone").val();
	 if(!mbTest.test(phone)){
		Mix.msg("请输入正确的手机号码","warn",2); 
		return false;
	 }
	 
	Mix.load('短信发送中......');
	p.bank_phone = phone;
	p.step=1;
	p.province = $("#province option:selected").text();
	p.city = $("#city option:selected").text();
	p.bindtype='w';
	
	postData("${dfn:U('member/recharge/bindcard')}",p,function(d){
		if(d.status==1){
			Mix.msg(d.message,'success',2);
			ticket=d.ticket;
			cid=d.cardId;
			setLeftTime();
		}
		else  Mix.msg(d.message,'fail',3);
	});
 }
 
 function setLeftTime(){
	if(second<0){
		clearTimeout(timer);
		second=60;
		$("#sendCode").html("重发验证码").bind("click",function(){
			sendPhoneCode();
		});
	}else{
		$("#sendCode").unbind().html(second + "秒后可重发"); 
		timer = setTimeout(function(){
			 second--;
			 clearTimeout(timer);
			 setLeftTime();
		 },1000);
	}
 }

</script>
<%@ include file="../Common/footer.jsp"%>
	
	
	