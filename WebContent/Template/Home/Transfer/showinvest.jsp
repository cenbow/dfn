<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<c:choose>
  <c:when test="${not empty _USERINFO_}">
<style type="text/css">
#cboxTitle{text-indent:70px}
.ajaxDivInvest-con{height:300px}
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
    <li>借款期限: ${vo.borrow_duration}<c:if test="${vo.repayment_type ==4}">天</c:if><c:if test="${vo.repayment_type !=1}">个月</c:if> </li>
    <li>还款方式: ${repayment_typeMap[vo['repayment_type']]} </li>
</ul>
</div>

<div class="ajaxDivInvest-r">
<FORM method="post" name="investForm" id="investForm" action="${dfn:U('home/invest/investMoney')}">
<input type="hidden" name="borrow_id" id="borrow_id" value="${vo.id}" />
<ul>
<li>您的可用余额： ${account_money} 元 <A target="_blank" href="${dfn:U('member/recharge/index')}">我要充值</A> </li>
<li>最多投标总额：<c:if test="${vo.borrow_max > 0}">${vo.borrow_max}元</c:if><c:if test="${vo.borrow_max ==0}">无限制</c:if></li>
<li>当前利率: ${vo.borrow_interest_rate}%/<c:if test="${vo.repayment_type == 4}">天</c:if><c:if test="${vo.repayment_type!=4}">年</c:if> </li>
<li>投标金额：<INPUT type="text" id="invest_money" class="invest_input" onkeyup="ccltMoney(this);" size="11" name="money" value="${number}" />&nbsp;元
<a href="javascript:;" onclick="fullBorrow();" title="点击自动填入可投金额">自动填入可投金额</a></li>
<li>使用奖金支付：<INPUT type="text" id="reward_money_use" class="invest_input" size="11" name="reward_money_use" value="0" />&nbsp;元(可用：${reward_money_have})</li>
<!--<li>支付密码：<if condition="$has_pin eq 'yes'"><INPUT type="password" class="invest_input" id="pin" name="pin" value="" /><else/>
<A href="#" target="_blank"><FONT color="#ff0000">请先设一个支付交易密码</FONT></A></if>
</li>
-->
<c:if test="${vo.borrow_pass !=''}"><li>定向密码：<INPUT type="text" class="invest_input" id="borrow_pass" name="borrow_pass" value="" /></li></c:if>
<li>投标<font id="tbnum">100</font>元,可获得利息<font id="lxnum">￥${getInterest}</font>元</li>
</ul>
<P class="mar20"><img src="${MemberStatics}/images/submit.png" style="cursor:pointer" onclick="InvestMoney(${vo.id});" /></P>
<P></P>
</FORM>
</div>
</div>
<script type="text/javascript">
borrow_min = parseFloat("${vo.borrow_min}");
borrow_max = parseFloat("${vo.borrow_max}");
account_money = parseFloat("${dfn:defaultValue(account_money,'0')}");
reward_money_have = 0;
function fullBorrow(){
	var needMoney = "<c:if test="${vo.need>account_money}">${account_money}</c:if><c:if test="${vo.need<=account_money}">${vo.need}</c:if>";
	if(needMoney>borrow_max && borrow_max!=0) needMoney=borrow_max;
	if(needMoney>account_money) needMoney=account_money;
	$("#invest_money").val(needMoney);
	ccltMoney($("#invest_money").get(0));
}
var lx100 = parseFloat(${getInterest});
var jl100 = parseFloat(0);

function ccltMoney(obj){
	obj.value=obj.value.replace(/[^0-9]/g,'');
	var _tbnum = parseInt(obj.value);
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
		<a href="${dfn:U('home/login/index')}">请先登陆</a>
    </c:otherwise>
</c:choose>
