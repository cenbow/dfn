<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">会员资金变动记录</a></li>
	</ul>
  <div class="common-form">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">
					
					会员名： 
					 <input type="text" name="textfield2">
					 交易类型： 
					 <select name="l#type" class="myselect" id="l#type" ><option selected="selected" value="">所有</option><option value="2">会员升级</option><option value="3">会员充值</option><option value="4">提现冻结</option><option value="5">撤消提现</option><option value="6">投标冻结</option><option value="15">投标成功本金解冻</option><option value="28">投标成功待收利息</option><option value="7">管理员操作</option><option value="8">流标返还</option><option value="16">复审未通过返还</option><option value="9">会员还款</option><option value="10">网站代还</option><option value="11">偿还借款</option><option value="12">提现失败</option><option value="13">推荐的会员升级</option><option value="14">升级VIP</option><option value="17">借款入帐</option><option value="18">借款管理费</option><option value="19">借款保证金</option><option value="21">支付投标奖励</option><option value="22">视频认证费用</option><option value="23">利息管理费</option><option value="24">还款完成解冻</option><option value="25">实名认证费用</option><option value="26">现场认证费用</option><option value="27">充值审核</option><option value="29">提现成功</option><option value="30">逾期罚息</option><option value="31">催收费</option><option value="32">可用余额利息</option><option value="37">流转标投标</option><option value="38">流转标待收利息</option><option value="39">流转标回购</option><option value="44">提现费用调整</option><option value="51">回购流转标</option><option value="52">会员投流转标</option><option value="53">积分兑换入帐</option><option value="54">债权转出</option><option value="55">承接债权</option><option value="56">债权转让手续费</option><option value="57">收到债权还款</option><option value="67">债权待收变动</option><option value="68">转出债权待收变动</option><option value="58">投资理财冻结</option><option value="59">理财冻结返回</option><option value="60">理财回收本金</option><option value="61">理财审核通过</option><option value="62">理财收益</option><option value="65">投标失败返回到奖金</option><option value="66">奖励投标预扣</option></select>
					 交易对方：
				     <label>
				    <input type="text" name="textfield">
				    </label>
				     变动原因：
					 <input type="text" name="textfield3">
					 &nbsp;影响金额：
					 
					 <select class="select_2" name="select3">
                       <option selected="selected" value="0">大于</option>
                       <option value="1">等于</option>
                       <option value="2">小于</option>
                     </select>
					 <input type="text" name="textfield22"><hr class="searchBor">
					 交易时间： 
					 <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text"> 
					 <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
					 <label></label>
					 <button class="btn">搜索</button>
        <button class="btn export" onClick="window.open('/newadmin-CapitalLog-export?');return false;">导出</button>

			  </span>				</div>
			</div>
		</form>
		<form method="post" class="J_ajaxForm" action="#">
          <div class="table_list">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th class="line_l">ID</th>
    <th class="line_l">用户名</th>
    <th class="line_l">交易对方</th>
    <th class="line_l">交易类型</th>
    <th class="line_l">影响金额</th>
    <th class="line_l">可用余额</th>
    <th class="line_l">冻结金额</th>
    <th class="line_l">待收金额</th>
    <th class="line_l">发生时间</th>
    <th class="line_l">变动原因</th>

                </tr>
              </thead>
              <tbody>
                <tr>
                 <tr overstyle='on' id="list_432">
        <td>432</td>
        <td><a target="_blank" href="/newadmin-common-user-user_name-lincolnbz.shtml">lincolnbz</a></td>
        <td>dftest</td>
        <td>投标成功待收利息</td>
        <td>5.00元</td>
        <td>999671.35元</td>
        <td>0.00元</td>
        <td>606.00元</td>
        <td>2015-02-05 16:50</td>
        <td title="第84号标复审通过，应收利息成为待收金额">第84号标复审通过，应收利息成…</td>
      </tr>
                </tr>
              </tbody>
            </table>
            <div class="pagination"> 222 条记录 5/23 页 <a href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a>
             <a href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a> &nbsp;
              <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a> &nbsp;
               <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a> 
               <a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a> </div>
          </div>
    </form>
  </div>

	<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript">
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});
</script>
<div id="calroot" style="display: none; position: absolute;">
		<div id="calhead">
			<a id="calprev"></a>
			<div id="caltitle">
				<select id="calmonth"></select><select id="calyear"></select>
			</div>
			<a id="calnext"></a>
		</div>
		<div id="calbody">
			<div id="caldays">
				<span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
			</div>
			<div id="calweeks"></div>
			<div class="caltime">
				<button type="button" class="btn btn_submit fr" name="submit">确认</button>
				<input id="calHour" class="input" min="0" max="23" size="2"
					value="0" type="number"><span>点</span><input id="calMin"
					class="input" size="2" min="1" max="59" value="0" type="number"><span>分</span>
			</div>
		</div>
</div>


</body>
</html>