<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>光谷惠众-系统后台</title>
<link href="http://www.ggmoney.com/statics/admin/css/admin_style.css"
	rel="stylesheet" />
<link
	href="http://www.ggmoney.com/statics/admin/js/artDialog/skins/default.css"
	rel="stylesheet" />
<style type="text/css">
.table_list tr.higlight_select td {
	background-color: #CC0
}
</style>
<script type="text/javascript">
	//全局变量
	var GV = {
		DIMAUB : "",
		JS_ROOT : "http://www.ggmoney.com/statics/admin/js/",
		TOKEN : "261e1cb7ca6fbd9e458d1f1aa861f67a_6b24c62df9a7aa3d4f1ecd995249b21b",
		MAIN_DOMAIN : "http://www.ggmoney.com"
	};
</script>
<script src="http://www.ggmoney.com/statics/admin/js/wind.js"></script>
<script src="http://www.ggmoney.com/statics/admin/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$(".table_list tr").click(
				function() {
					$(this).addClass("higlight_select").siblings("tr")
							.removeClass("higlight_select");
				})
	})
</script>
</head>
<body>
	<style type="text/css">
.rybll {
	width: 50px;
	border: 0 none;
	border-bottom: 1px solid #000;
	text-align: center
}

#rybll {
	padding: 0px 5px;
}

#rybll:hover {
	background: #999
}
</style>
	<div class="wrap">
		<div class="welcome_login">
			<span class="green">test</span> 您好，欢迎登陆光谷惠众<span>上次登陆时间：2015-03-11
				11:50:07</span><span>上次登陆地区：湖北省武汉市(电信ADSL)</span>
		</div>

		<div class="welcome_important_tip">
			系统检测到系统后台入口还是默认的Newadmin，建议修改后台入口<a
				href="/newadmin-config-changegroup.shtml">修改入口</a>
		</div>

		<div class="welcome_block" style="width: 96%">
			<h2 class="h_a">待办事项</h2>
			<table class="centerTable" cellpadding="0" cellspacing="1">
				<tr>
					<th>3天内到期</th>
					<th>待初审</th>
					<th>待复审</th>
					<th>额度申请</th>
					<th>线下充值</th>
					<th>提现申请</th>
					<th>资料上传</th>
					<th>VIP认证</th>
					<th>实名认证</th>
					<th>现场认证</th>
					<th>视频认证</th>
				</tr>
				<tr>
					<td>5</td>
					<td>2</td>
					<td>2</td>
					<td><span class="gray">0</span></td>
					<td><span class="gray">0</span></td>
					<td><span class="gray">0</span></td>
					<td>6</td>
					<td><span class="gray">0</span></td>
					<td>9</td>
					<td>11</td>
					<td>10</td>
				</tr>
				<tr>
					<td><a
						href="/newadmin-borrow_repayment-index.shtml?start_time=2015-03-11&end_time=2015-03-14"
						class="taba">查看详情</a></td>
					<td><a href="/newadmin-borrow_check-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-borrow_recheck-index.shtml"
						class="taba">查看详情</a></td>
					<td><a href="/newadmin-apply_limit-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-recharge-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-withdraw-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-user_upload-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-apply_vip-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-apply_real-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-apply_face-index.shtml" class="taba">查看详情</a></td>
					<td><a href="/newadmin-apply_video-index.shtml" class="taba">查看详情</a></td>
				</tr>
			</table>
		</div>

		<div class="welcome_block" style="width: 96%">
			<h2 class="h_a">今日统计</h2>
			<table class="centerTable" cellpadding="0" cellspacing="1">
				<tr>
					<th>新增会员</th>
					<th>新增VIP</th>
					<th>新增充值</th>
					<th>新增提现</th>
					<th>新增普通借款</th>
					<th>新增普通投资</th>
					<th>新增流转借款</th>
					<th>新增流转投资</th>
				</tr>
				<tr>
					<td><span class="gray">0</span></td>
					<td><span class="gray">0</span></td>
					<td><span class="gray">0</span>(0笔)</td>
					<td><span class="gray">0</span>(0笔)</td>
					<td>20000(2笔)</td>
					<td>11200(6笔)</td>
					<td><span class="gray">0</span>(0笔)</td>
					<td><span class="gray">0</span>(0笔)</td>
				</tr>
			</table>
		</div>

		<div id="container" class="welcome_block" style="width: 96%"></div>

		<div class="welcome_block">
			<h2 class="h_a">系统信息</h2>
			<div class="home_info">
				<ul>
					<li><em>系统版本</em> <span>V3.0.1(2014-07-08)</span></li>
					<li><em>操作系统</em> <span>Linux</span></li>
					<li><em>运行环境</em> <span>Apache</span></li>
					<li><em>PHP运行方式</em> <span>apache2handler</span></li>
					<li><em>MYSQL版本</em> <span>5.1.63</span></li>
					<li><em>空间上传附件限制</em> <span>2M</span></li>
					<li><em>执行超时时间设置</em> <span>30秒</span></li>
					<li><em>剩余空间</em> <span>21921.36M</span></li>
				</ul>
			</div>
		</div>

		<div class="welcome_block">
			<h2 class="h_a">官网公告</h2>
			<div class="home_info" id="newslist">
				<ul>
					<li><a
						href="http://bbs.aliyun.com/read/176977.html?spm=5176.383338.4.1.0a8nqW"
						style="color: red" target="_blank">Linux Bash严重漏洞修复紧急通知</a>(由鼎峰p2p维护的服务器已更新完毕，自己维护的客户请及时处理或者联系鼎峰工作人员协助处理)</li>
					<li>新增定向标功能(2013-10-19)</li>
					<li>新增自定义标种功能(2013-10-08)</li>
					<li>更新了借款，合同，更新手机号等相关功能(2013-09-06)</li>
					<li>增加了实时财务功能，优化了提现手续费处理调整为可后台修改手续费(2013-08-14)</li>
					<li>当前系统最新版本为V1.1.1(2013-07-23)</li>
					<li>新增了网站运营历史统计图表和积分相关的一些修改</li>
					<li>当前系统最新版本为V1.0.1(2013-07-18)</li>
					<li>更新了会员头像上传，后台欢迎页和其他细节</li>
				</ul>
			</div>
		</div>

	</div>
	<!--升级提示-->
	<script type="text/javascript">
		var old_interest = '';
		$.get("/newadmin-Main-getNewsList", {}, function(data) {
			$("#newslist").html(data.html);
		}, "JSON");

		$("#rybll")
				.click(
						function() {
							var ipt = $("#rybll_input");
							if (ipt.length == 0) {
								var interest_rate = $("#rybll").html();
								old_interest = interest_rate;
								$("#rybll")
										.html(
												'<input id="rybll_input" class="rybll" value="'+interest_rate+'"/>');
								$("#rybll_input").focus();
							}
						})
		$("#rybll_input").live(
				'blur',
				function() {
					var new_interest = $(this).val();
					if (new_interest == '' || isNaN(parseInt(new_interest))
							|| parseInt(new_interest) < 0) {
						alert('请输入正确的利率');
					} else if (new_interest == old_interest) {
						$("#rybll").html(new_interest);
					} else {
						var p = {};
						p.interest = new_interest;
						$.get("/newadmin-cache_balance-index.shtml", p,
								function(data) {
									if (data.status == 1) {
										$("#rybll").html(data.interest_rate);
										alert(data.info);
									} else {
										alert(data.info);
									}
								}, "JSON");
					}
				});
	</script>
	<script src="http://www.ggmoney.com/statics/admin/js/common.js?v"></script>

	<script type="text/javascript">
		$(function() {
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart : {
						renderTo : 'container',
						type : 'spline'
					},
					title : {
						text : '光谷惠众历史统计'
					},
					subtitle : {
						text : '最近三十天的运营概况统计数据图表(点击最下面曲线名称可 显示 或者 隐藏对应曲线)'
					},
					xAxis : {
						categories : []
					},
					yAxis : {
						title : {
							text : '新增数量(个)'
						},
						min : 0
					},
					tooltip : {
						formatter : function() {
							var _html = '<b>' + this.series.name + '</b><br/>';
							_html += '数量：' + this.y;
							if (this.point.name)
								_html += this.point.name;
							return _html;
						}
					},

					series : [ {
						name : '新增会员',
						data : []
					}, {
						name : '新增VIP会员',
						data : []
					}, {
						name : '新增普通投资',
						data : []
					}, {
						name : '新增普通贷款',
						data : []
					}, {
						name : '新增提现',
						data : []
					}, {
						name : '新增充值',
						data : []
					}, {
						name : '新增流转标投资',
						data : []
					}, {
						name : '新增流转标贷款',
						data : []
					} ]
				});
			});

		});
	</script>
	<script src="http://www.ggmoney.com/statics/common/js/chart.js"></script>
</body>
</html>
