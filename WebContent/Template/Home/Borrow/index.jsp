<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>发布借款</title>
<meta name="keywords" content="{$webConfig.siteKeywords.value}" />
<meta name="description" content="{$webConfig.siteDes.value}" />
<link rel="stylesheet" type="text/css" href="${HomeStatics}/css/postborrow.css" />
<script type="text/javascript">
var dayRate = [${borrow_lixi_day[0]},${borrow_lixi_day[1]},"天利率"];
var MonthRate = [${borrow_lixi[0]},${borrow_lixi[1]},"年利率"];
var borrowInterest = MonthRate;
</script>
<SCRIPT language="javascript" src="${HomeStatics}/js/borrow.js" type="text/javascript"></SCRIPT>
<link rel="stylesheet" type="text/css" href="${SiteStatics}/Common/JQtip/tip-yellowsimple/tip-yellowsimple.css" />
<style type="text/css">
.tip span.condition_tip{ margin-left:20px; color:#F90; font-size:10px}
.thumbnails .albCt{ float:left; margin-left:10px; padding:5px}
.thumbnails .albCt input{ width:80px}
.borrowtable.labelcks label{ margin-left:20px; padding:10px 0px; float:left}
.df_list_banner_wper{ height:45px;background: none;}
</style>
<SCRIPT language="javascript" src="${SiteStatics}/Common/JQtip/jquery.poshytip.js" type="text/javascript"></SCRIPT>
<SCRIPT language="javascript" src="${SiteStatics}/Common/js/validator.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
$(function(){
	$('.x_input').poshytip({
		className: 'tip-yellowsimple',
		showOn: 'hover',
		alignTo: 'target',
		alignX: 'center',
		alignY: 'top',
		offsetX: 0,
		offsetY: 5
	});
	$('.x_checkbox').poshytip({
		className: 'tip-yellowsimple',
		showOn: 'hover',
		alignTo: 'target',
		alignX: 'right',
		alignY: 'center',
		offsetX: 10,
		offsetY: -25
	});
	$('.x_select').poshytip({
		className: 'tip-yellowsimple',
		showOn: 'hover',
		alignTo: 'target',
		alignX: 'right',
		alignY: 'center',
		offsetX: 10,
		offsetY: -25
	});
	changeInterestTip();
});
function changeInterestTip(){
	$("#borrow_interest_rate").poshytip({
		content:"填写您提供给投资者的"+borrowInterest[2]+",所填写的利率是您还款的"+borrowInterest[2]+"。年利率应在"+borrowInterest[0]+"%至"+borrowInterest[1]+"%之间，且只保留小数后最后两位。",
		className: 'tip-yellowsimple',
		showOn: 'hover',
		alignTo: 'target',
		alignX: 'center',
		alignY: 'top',
		offsetX: 0,
		offsetY: 5
	});
}
</script>
<link href="${SiteStatics}/editer/mueditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${SiteStatics}/editer/mueditor/umeditor.config.js"></script>
<script type="text/javascript" src="${SiteStatics}/editer/mueditor/umeditor.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
	<!--中部开始-->
	<div id="maincontent">
    	<div class="tip">你正在发布的是<span>${BorrowType[borrowPostString]}</span></div>
        <form method="post" action="${dfn:U('home/borrow/save')}" name="postBorrow" id="postBorrow">
        <input type="hidden" name="vkey" value="${borrowPostString}" />
        <div class="borrow_block">
            <ul class="ax clearfix">
                <li class="mn_dk">
                    <div class="mn_ll"></div>
                    <div class="mn_rr"></div>
                    <span>借款信息</span>
                </li>
            </ul>
            <ul>
                <div class="axbody">
                          ${dfForm:select("_day_option",borrow_day_time,"","x_select","",'style="display:none"')}
                          ${dfForm:select("_month_option",borrow_month_time,"","x_select","",'style="display:none"')}
                  <table class="borrowtable">
                      <tr>
                          <th class="col_1">借贷总金额：</th><td class="col_2"><input onblur="NumberCheck(this,'borrow',[${borrow_money_limit[0]},${borrow_money_limit[1]}])" type="text" class="x_input" name="borrow_money" title="借款金额应在${borrow_money_limit[0]}至${borrow_money_limit[1]}之间。交易币种均为人民币。借款成功如有管理费则在借款金额中直接扣除，不计息，不退还。 更详尽的信息请查看帮助网站 收费规则" /></td>
                          <th class="col_3" id="_day_rate">年利率：</th><td class="col_4"><input onblur="NumberCheck(this,'rate',[${borrow_lixi[0]},${borrow_lixi[1]}])" type="text" class="x_input" name="borrow_interest_rate" id="borrow_interest_rate" title="" />%</td>
                      </tr>
                      <tr>
                          <th class="col_1">借款用途：</th><td class="col_2">
                          ${dfForm:select("borrow_use",borrow_use,"","x_select","",'title="说明借款成功后的具体用途"')}
                          </td>
                          <th class="col_3">借款期限：</th><td class="col_4">
                          <c:choose>
                          <c:when test="${miao =='yes'}">
                          <span style="color:#F00">标满自动还款</span>
                          </c:when>
                          <c:otherwise>
                          ${dfForm:select("borrow_duration",borrow_month_time,"","x_select","",'title="借款成功后,打算以几(天)个月的时间来还清贷款。"')}
                          <input type="checkbox" class="x_checkbox" name="is_day" id="is_day" style="margin-left:10px" value="yes" onclick="checkday()" title="按天还款注意利率为 '日利率',如 '日利率为1%' 则100元借1天利息1元，借两天利息2元" /><label for="is_day">按天</label>
                          </c:otherwise>
                          </c:choose>
                          </td>
                      </tr>
                      <tr>
                          <th class="col_1">最低投标金额：</th><td class="col_2">
                          ${dfForm:select("borrow_min",borrow_min,"","x_select","",'title="允许投资者对一个借款标的最低投标额的限制"')}
                          </td>
                          <th class="col_3">最多投标总额：</th><td class="col_4">
                          ${dfForm:select("borrow_max",borrow_max,"","x_select","",'title="允许投资者对一个借款标的投标总额的限制"')}
                          </td>
                      </tr>
                      <tr>
                          <th class="col_1">有效时间：</th><td class="col_2">
                          ${dfForm:select("borrow_time",borrow_time,"","x_select","",'title="设置此次借款融资的天数。融资进度达到100%后直接进行网站的复审"')}
                         </td>
                          <th class="col_3">还款方式：</th><td class="col_4">
                          <c:choose>
                          <c:when test="${miao =='yes'}">
                          <span style="color:#F00">标满自动还款</span>
                          </c:when>
                          <c:otherwise>
                          ${dfForm:select("repayment_type",repayment_type,"2","x_select","",'title="1.按天到期还款 是按天算利息，到期的那一天同时还本息。2.按月分期还款是指贷款者借款成功后，每月还本息。3.按季分期还款是指贷款者借款成功后,每月还息，季度还本。4.到期还本按月付息是指贷款者借款成功后,每月还息,最后一月还同时还本金。" onchange="test_duration()"')}
                          </c:otherwise>
                          </c:choose>
                          </td>
                      </tr>
                      <tr>
                          <th class="col_1">是否有投标奖励：</th><td class="col_2"><input type="checkbox" class="x_checkbox" name="is_reward" id="is_reward" onclick="is_reward_do();" title="如果您设置了奖励金额，将会冻结您帐户中相应的账户余额。如果要设置奖励，请确保您的帐户有足够 的账户余额。"/></td>
                          <th class="col_3">&nbsp;</th><td class="col_4">&nbsp;</td>
                      </tr>
                  </table>
                </div>
            </ul>
        </div>
        <div class="borrow_block" id="_is_reward" style="display:none">
            <ul class="ax clearfix">
                <li class="mn_dk">
                    <div class="mn_ll"></div>
                    <div class="mn_rr"></div>
                    <span>投标奖励</span>
                </li>
            </ul>
            <ul>
                <div class="axbody">
                  <table class="borrowtable">
                      <tr>
                          <th class="col_1"><input type="radio" id="reward_type_1" class="x_radio" name="reward_type" value="1" /><label for="reward_type_1">按投标金额比例奖励</label>：</th><td class="col_2"><input type="text" class="x_input" name="reward_type_1_value" onclick="reward_type_do(1)" onkeyup="NumberCheck(this)" title="范围：0.1%~6% ，这里设置本次标的要奖励给所有投标用户的奖励比例。" />%</td>
                          <th class="col_3"><input type="radio" class="x_radio" id="reward_type_2" name="reward_type" value="2" /><label for="reward_type_2">按固定金额分摊奖励</label>：</th><td class="col_4"><input type="text" class="x_input" name="reward_type_2_value" onclick="reward_type_do(2)" onkeyup="NumberCheck(this)" title="不能低于5元,不能高于总标的金额的2%，且请保留到“元”为单位。这里设置本次标的要奖励给所有投标用户的总金额。" />元</td>
                      </tr>
                  </table>
                
                </div>
            </ul>
          </div>
           <!--多图1-->
        <div class="borrow_block">
            <ul class="ax clearfix">
                <li class="mn_dk">
                    <div class="mn_ll"></div>
                    <div class="mn_rr"></div>
                    <span>图片资料</span>
                </li>
            </ul>
            <ul>
                <div class="axbody">
                  <table class="borrowtable">
                      <tr>
                          <th class="col_1">图片上传：</th><td colspan="3"><div class="swfUploadBar clearfix"><span id="spanButtonPlaceholder"></span><div id="divFileProgressContainer"></div></div></td>

                      </tr>
                      <tr>
                          <th class="col_1">图片类型：</th><td colspan="3">${dfForm:radio("imgType",imgType,"1","x_select","",'title="请选择您所上传图片的分类"')}</td>

                      </tr>
                      <tr id="img_type_1">
                          <th class="col_1">项目证明：</th><td colspan="3" class="thumbnails">
							
                          </td>
                      </tr>
                      <tr id="img_type_2">
                          <th class="col_1">担保方资质证明：</th><td colspan="3" class="thumbnails">
							
                          </td>
                      </tr>
                  </table>
                </div>
            </ul>
          </div>
          <!--多图1-->
          <!--的详细说明-->
        <div class="borrow_block">
            <ul class="ax clearfix">
                <li class="mn_dk">
                    <div class="mn_ll"></div>
                    <div class="mn_rr"></div>
                    <span>借款的详细说明</span>
                </li>
            </ul>
            <ul>
                <div class="axbody">
                  <table class="borrowtable">
                      <tr>
                          <th class="col_1">标题：</th><td colspan="3"><input type="text" class="x_input" style="width:300px" name="borrow_name" title="填写借款的标题，写好一点能借的几率也大一点" /> <span style="margin-left:25px; color:#333333">定向密码：<input type="text" class="x_input" style="width:100px" name="borrow_pass" title="定向标，只有知道密码的人才能投标,无密码则留空" /></span></td>

                      </tr>
                       <tr>
                          <th class="col_1">抵押详情：</th><td colspan="3" style="border-bottom:0 none">
							<script type="text/plain" id="collateral" style="width:800px; height:200px; padding:10px"></script>
                            <script type="text/javascript">
                                 var ue = UM.getEditor('collateral', {
                                    imageUrl:"{$_thisUrl_}saveborrowimg",
                                    imagePath:"",
                                    lang:/^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
                                    langPath:UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
                                    focus: true
                                });
                            </script>
                            <textarea name="company_financial_text" id="company_financial_text" style="display:none"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <th class="col_1" style="border-bottom:0 none">借款说明：</th><td colspan="3" style="border-bottom:0 none">
							<script type="text/plain" id="borrow_info" style="width:800px; height:200px; padding:10px"></script>
                            <script type="text/javascript">
                                 var ue = UM.getEditor('borrow_info', {
                                    imageUrl:"{$_thisUrl_}saveborrowimg",
                                    imagePath:"",
                                    lang:/^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
                                    langPath:UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
                                    focus: true
                                });
                            </script>
                          </td>
                      </tr>
                      <tr><th style="height:40px; line-height:40px" class="col_1">&nbsp;</th><td colspan="3"><img id="submitF" src="${HomeStatics}/images/submitdai.gif" /></td></tr>
                  </table>
                </div>
            </ul>
          </div>
          <textarea name="borrow_info" id="borrow_info_text" style="display:none"></textarea>
          <input name="canborrow" id="canborrow" value="{$borrow_condition[0]+1}" type="hidden" />
          <!--的详细说明-->
          <dfTag:token />
          </form>
	</div>
	<!--中部结束-->
<script type="text/javascript">
<c:if test="${miao=='yes'}">
var miao = 'yes';
</c:if>
$("#submitF").click(function(){
	if(validate()) window.document.forms['postBorrow'].submit();
})
function validate()
{
	var content = UM.getEditor('collateral').getContent();
	$('#company_financial_text').text(content);
	
	var content = UM.getEditor('borrow_info').getContent();
	var canborrow = parseInt($("#canborrow").val()-1);
    validator = new Validator("postBorrow");
    validator.required("borrow_money",      	"借款金额不能为空！");
	validator.required("borrow_interest_rate",	"借款利率不能为空！");
	validator.required("borrow_use",			"借款用途不能为空！");
	validator.required("borrow_min",			"最小投资金额不能为空！");
	validator.required("borrow_time",			"借款有效时间不能为空！");
	validator.required("borrow_name",			"借款标题不能为空！");
	if(content=="") validator.required("borrow_info",			"借款内容不能为空！");
	else $("#borrow_info_text").text(content);
	if(typeof miao=="undefined"){
		validator.gt("canborrow", "borrow_money",  "借款金额不能大于"+canborrow+"元！");
		validator.required("borrow_duration",		"借款期限不能为空！");
		validator.required("repayment_type","还款方式不能为空！");
	}
    return validator.passed();
}
</script>
<script type="text/javascript">
var mysn=0;
var _SWFbuttonConfig_={
		"text":'',
		"img":'${SiteStatics}/Swfupload/images/upload.png',
		"w":110,
		'h':36
	};
var _swfUploadUrl = "${dfn:SU(_thisUrl_,'swfupload')}";
var _swfFlashUrl = "${SiteStatics}/Swfupload/swfupload.swf";
var _swfSessionID = "<%String s = session.getId();%><%=s %>";
var _swfUploadSuccess=function(data){
	var imgType = $("input[name='imgType']:checked").val();
	if(data.status=="success"){
		mysn++;
		var addStr = '';
		var newImgDiv = document.createElement("div");
		var thisId = 'swfImgSn'+mysn;
		var imgName = data.oldName.split(".");
		newImgDiv.className = 'albCt';
		newImgDiv.id = thisId;
		$("#img_type_"+imgType).find('.thumbnails').get(0).appendChild(newImgDiv);
		var htmlImg = '<img src="'+GV.WEB_ROOT+getImgThumb(data.data)+'" width="120px" height="120px" /><input type="hidden" name="swfimglist['+mysn+']" value="'+data.data+'" /><input type="hidden" name="swfimgtype['+mysn+']" value="'+imgType+'" />';
		var htmlInfo = '<div style="margin-top:10px">说明：<input type="text" name="picinfo['+mysn+']" value="'+imgName[0]+'" class="swfPicInfo" /></div>';
		var htmlBar = '<a href="javascript:;" onclick="javascript:delPic(\''+thisId+'\')">[删除]</a><a href="javascript:;" onclick="javascript:leftPic(\''+thisId+'\')">[前移]</a><a href="javascript:;" onclick="javascript:rightPic(\''+thisId+'\')">[后移]</a>';
		newImgDiv.innerHTML = htmlImg;
		newImgDiv.innerHTML += htmlInfo;
		newImgDiv.innerHTML += addStr;
		newImgDiv.innerHTML += htmlBar;
	}
	else alert(data.info);
}
</script>
<script type="text/javascript" src="${SiteStatics}/Common/js/common.js"></script>
<script type="text/javascript" src="${SiteStatics}/Swfupload/handlers.js"></script>
<script type="text/javascript" src="${SiteStatics}/Swfupload/swfupload.js"></script>
<script type="text/javascript">
$(function(){
	initSWF();	
})
</script>

<%@ include file="../Common/footer.jsp"%>