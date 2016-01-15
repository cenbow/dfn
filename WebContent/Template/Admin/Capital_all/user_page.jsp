<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>

<form method="post" class="J_ajaxForm" action="#">
	<div class="table_list">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th class="line_l">会员统计</th>
					<th class="line_l">资金进出统计</th>
					<th class="line_l">借款统计</th>
				</tr>
			</thead>
			<tr>
				<td valign="top">
					<dl class="lx">
						<dt>会员总数:</dt>
						<dd>
							<a href="/newadmin-user-index.shtml">222</a>人
						</dd>
					</dl>
					<dl class="lx">
						<dt>VIP:</dt>
						<dd>
							<a href="/newadmin-user-index.shtml?is_vip=yes">0</a>人
						</dd>
					</dl>
					<dl class="lx">
						<dt>通过身份认证:</dt>
						<dd>
							<a href="/newadmin-applyreal-index.shtml?mi%23id_status=1">11</a>人
						</dd>
					</dl>
					<dl class="lx">
						<dt>通过手机认证:</dt>
						<dd>
							<a href="/newadmin-verify_phone-index.shtml">0</a>人
						</dd>
					</dl>
					<dl class="lx">
						<dt>通过现场认证:</dt>
						<dd>
							<a href="/newadmin-applyface-index.shtml?v%23apply_status=1">7</a>人
						</dd>
					</dl>
					<dl class="lx">
						<dt>通过视频认证:</dt>
						<dd>
							<a href="/newadmin-applyvideo-index.shtml?v%23apply_status=1">5</a>人
						</dd>
					</dl>
				</td>
				<td valign="top">
					<dl class="lx">
						<dt>线上充值:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=3">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>线下充值:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=27">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>成功提现:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=29">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>管理员操作:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=7">￥-1,398,779,068.99</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>总计:</dt>
						<dd>￥-1,398,779,068.99</dd>
					</dl>
				</td>
				<td valign="top">
					<dl class="lx">
						<dt>成功借出总额:</dt>
						<dd>￥10,600.00</dd>
					</dl>
					<dl class="lx">
						<dt>已还款总额:</dt>
						<dd>￥10,000.00</dd>
					</dl>
					<dl class="lx">
						<dt>未还款总额:</dt>
						<dd>￥600.00</dd>
					</dl>
					<dl class="lx">
						<dt>冻结中的保证金总额:</dt>
						<dd>￥0.00</dd>
					</dl>
				</td>
			</tr>
			<tr>
			<thead>
				<th class="line_l">逾期统计</th>
				<th class="line_l">网站收益统计</th>
				<th class="line_l">投资者收益统计</th>
			</thead>

			<tr>
				<td valign="top">
					<dl class="lx">
						<dt>逾期已还款总额:</dt>
						<dd>￥0.00</dd>
					</dl>
					<dl class="lx">
						<dt>逾期未还款总额:</dt>
						<dd>￥0.00</dd>
					</dl>
					<dl class="lx">
						<dt>催收费总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=31">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>逾期罚息总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=30">￥0.00</a>
						</dd>
					</dl>
				</td>
				<td valign="top">
					<dl class="lx">
						<dt>借入者成交管理费总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=18">￥1,023,336.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>投资者成交管理费总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=23">￥1,534.97</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>提现手续费总额:</dt>
						<dd>￥0.00</dd>
					</dl>
					<dl class="lx">
						<dt>VIP费用总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=14">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>实名认证费用总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=25">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>视频认证费用总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=22">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>现场认证费用总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=26">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>总计:</dt>
						<dd>￥1,024,870.97</dd>
					</dl>
				</td>
				<td valign="top">
					<dl class="lx">
						<dt>成功借款利息总额:</dt>
						<dd>￥0.00</dd>
					</dl>
					<dl class="lx">
						<dt>成功借款投标奖励总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=21">￥66,766.66</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>邀请注册奖金总额:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=1">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>回款奖励:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=34">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>线下充值奖励:</dt>
						<dd>
							<a href="/newadmin-capitallog-index.shtml?l%23type=36">￥0.00</a>
						</dd>
					</dl>
					<dl class="lx">
						<dt>总计:</dt>
						<dd>￥66,766.66</dd>
					</dl>
				</td>
			</tr>

		</table>


	</div>
</form>
<%@ include file="../Common/footer.jsp"%>