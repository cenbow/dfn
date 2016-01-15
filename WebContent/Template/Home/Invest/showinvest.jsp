<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<c:choose>
  <c:when test="${not empty _USERINFO_}">
<style type="text/css">
#cboxTitle{text-indent:20px}
.ajaxDivInvest-con{height:350px}
</style>
<div class="investCornerTip borrow_type_${vo.borrow_type}"></div>
<div class="ajaxDivInvest-con clearfix">
<div class="ajaxDivInvest-l">
<ul>
    <li>借款人：${vouser.user_name} </li>
    <li>借款金额：<STRONG>${vo.borrow_money}</STRONG> </li>
    <li>借款利率: ${vo.borrow_interest_rate}%/年</li>
    <li>已经完成：${vo.progress} % </li>
    <li>还需借款: ${vo.need} </li>
    <li>最少投标金额: ${vo.borrow_min} </li>
    <li>借款期限: ${vo.borrow_duration}<c:if test="${vo.repayment_type ==4}">天</c:if><c:if test="${vo.repayment_type !=4}">个月</c:if> </li>
    <li>还款方式: ${repayment_typeMap[vo['repayment_type']]} </li>
</ul>
</div>

<div class="ajaxDivInvest-r">
<FORM method="post" name="investForm" id="investForm" action="${dfn:U('home/invest/investMoney')}">
<input type="hidden" name="borrow_id" id="borrow_id" value="${vo.id}" />
<ul>
<li>您的可用余额： ${account_money} 元 <A target="_blank" href="${dfn:U('member/recharge/index')}">我要充值</A> </li>
<li>最多投标总额：<c:if test="${vo.borrow_max > 0}">${vo.borrow_max}元</c:if><c:if test="${vo.borrow_max ==0}">无限制</c:if></li>
<li>当前利率: ${vo.borrow_interest_rate}%/年 </li>
<c:if test="${vo.xtype eq 1}"><li>投标金额：体验标只能使用体验金投标</li></c:if>
<c:if test="${vo.xtype !=1}">
<li>投标金额：<INPUT type="text" id="invest_money" class="invest_input" onkeyup="ccltMoney(this);" size="11" name="money" value="${number}" />&nbsp;元
<a href="javascript:;" onclick="fullBorrow();" title="点击自动填入可投金额">一键投资</a></li>
</c:if>

<c:if test="${not empty cardList}">
<li style="height:60px;">使用体验金：<div style="float:right;margin-right:60px;padding-top:4px;background:url('/Statics/Home/images/select.png') no-repeat;width:160px;background-position:0 5px;height:25px;">
	<select id="card_id" onchange="ctyj();" style="border:none;background:transparent;appearance:none;-moz-appearance:none; -webkit-appearance:none;width:160px;">
<option value="0">不使用</option>
<c:forEach items="${cardList}" var="bo"> 
<option value="${bo.id}" data="${bo.affect_money}">${bo.id}.${bo.card}[${bo.affect_money}]</option>
</c:forEach>
</select></div>
	<div style="font-size:12px;">*<span onclick="javascript:window.location.href='http://www.p2pok.com/memberCard/index.do'" style="cursor:pointer;border-bottom:solid 1px #69c1ff; color:#69c1ff">使用红包</span>占自有资金投标金额的25%</div>

	</li>
</c:if>


<c:if test="${vo.borrow_pass !=''}"><li>定向密码：<INPUT type="text" class="invest_input" id="borrow_pass" name="borrow_pass" value="" /></li></c:if>
<li>投标<font id="tbnum">100</font>元,可获得利息<font id="lxnum">￥${getInterest}</font>元</li>
	<li>支付密码：<INPUT type="password" class="invest_input" id="pin_pass" name="pin_pass" value="" /></li>
	</ul>
<P class="mar20"><img src="${MemberStatics}/images/submit.png" style="cursor:pointer" onclick="InvestMoney(${vo.id});" /></P>
<P></P>
</FORM>
</div>
</div>
<script type="text/javascript">
borrow_min = parseFloat("${vo.borrow_min}");
borrow_max = parseFloat("${vo.borrow_max}");
account_money = parseInt("${dfn:defaultValue(account_money,'0')}");
need_money = parseFloat("${dfn:defaultValue(vo.need,'0')}");
reward_money_have = 0;
function fullBorrow(){
	var needMoney = (need_money>account_money)?account_money:need_money;
	if(needMoney>borrow_max && borrow_max!=0) needMoney=borrow_max;
	if(needMoney>account_money) needMoney=account_money;
	$("#invest_money").val(needMoney);
	ccltMoney($("#invest_money").get(0));
}
var lx100 = parseFloat(${getInterest});
var jl100 = parseFloat(0);

function ctyj(){
	var money = $("#card_id").is(":selected").attr("data");
	var inputMoney = $("#invest_money").val();
		inputMoney=isNaN(inputMoney)?0:inputMoney;
	money = parseInt(money)+parseInt(inputMoney);
	ccltMoney(false,money);
}

function ccltMoney(obj,money){
	if(obj==false){
		obj={"value":money};
	}
	else obj.value=obj.value.replace(/[^0-9]/g,'');

	var hbmoney = $("#card_id").is(":selected").attr("data");
		hbmoney=isNaN(hbmoney)?0:hbmoney;
	
	var _tbnum = parseInt(obj.value)+parseInt(hbmoney);
	var _lxnum = round2(_tbnum/100*lx100,2);
	var _jlnum = round2(_tbnum/100*jl100,2);
	var _zjnum = round2(parseFloat(_lxnum)+parseFloat(_jlnum),2);
	$("#tbnum").html(_tbnum);
	$("#lxnum").html(_lxnum);
	$("#jlnum").html(_jlnum);
	$("#zjnum").html(_zjnum);
}
</script>
    </c:when>
    <c:otherwise>
		<a href="${dfn:U('home/login/index')}" style="padding:50px 30px">请先登陆</a>
    </c:otherwise>
</c:choose>
