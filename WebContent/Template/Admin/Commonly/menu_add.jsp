<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css"
	rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css"
	rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css"
	rel="stylesheet">
<link
	href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<style>
.length_3 {
	width: 180px;
}

.col-auto {
	overflow: hidden;
	_zoom: 1;
	_float: left;
	border: 1px solid #c2d1d8;
}

.col-right {
	float: right;
	width: 210px;
	overflow: hidden;
	margin-left: 6px;
	border: 1px solid #c2d1d8;
}

body fieldset {
	border: 1px solid #D8D8D8;
	padding: 10px;
	background-color: #FFF;
}

body fieldset legend {
	background-color: #F9F9F9;
	border: 1px solid #D8D8D8;
	font-weight: 700;
	padding: 3px 8px;
}

.list-dot {
	padding-bottom: 10px
}

.list-dot li, .list-dot-othors li {
	padding: 5px 0;
	border-bottom: 1px dotted #c6dde0;
	font-family: "宋体";
	color: #bbb;
	position: relative;
	_height: 22px
}

.list-dot li span, .list-dot-othors li span {
	color: #004499
}

.list-dot li a.close span, .list-dot-othors li a.close span {
	display: none
}

.list-dot li a.close, .list-dot-othors li a.close {
	background: url("/statics/images/cross.png") no-repeat left 3px;
	display: block;
	width: 16px;
	height: 16px;
	position: absolute;
	outline: none;
	right: 5px;
	bottom: 5px
}

.list-dot li a.close:hover, .list-dot-othors li a.close:hover {
	background-position: left -46px
}

.list-dot-othors li {
	float: left;
	width: 24%;
	overflow: hidden;
}
</style>
<!--[if IE 7]> <link rel="stylesheet" href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<script type="text/javascript">
	//全局变量
	var GV = {
		DIMAUB : "/",
		JS_ROOT : "statics/js/",
		TOKEN : ""
	};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js"
	type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/iframeTools.js"
	type="text/javascript"></script>

<script src="${AdminStatics}/js/datePicker/datePicker.js"
	type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">
</head>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="active.jsp">添加子菜单</a></li>
		</ul>
		<div class="common-form">
		<form class="form-horizontal J_ajaxForm" method="post"
				action="/admin/user/userinfo_post.html">
		
					<div class="control-group">
						<label class="control-label" for="input01">上级:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<td><select name="parentid">
									<option value="0">作为一级菜单</option>
									<option value='1'>网站管理</option>
									<option value='2'>&nbsp;├ 系统设置</option>
									<option value='3'>&nbsp;│&nbsp;├ 站点配置</option>
									<option value='5'>&nbsp;│&nbsp;│&nbsp;├ 邮件配置</option>
									<option value='6'>&nbsp;│&nbsp;│&nbsp;├ 附件设置</option>
									<option value='231'>&nbsp;│&nbsp;│&nbsp;│&nbsp;└
										保存水印图片</option>
									<option value='135'>&nbsp;│&nbsp;│&nbsp;├ 修改后台入口</option>
									<option value='134'>&nbsp;│&nbsp;│&nbsp;├ 借款相关参数配置</option>
									<option value='150'>&nbsp;│&nbsp;│&nbsp;└ 手机参数配置</option>
									<option value='4'>&nbsp;│&nbsp;├ 后台菜单管理</option>
									<option value='8'>&nbsp;│&nbsp;│&nbsp;├ 添加子菜单</option>
									<option value='19'>&nbsp;│&nbsp;│&nbsp;├ 修改菜单</option>
									<option value='33'>&nbsp;│&nbsp;│&nbsp;├ 排序</option>
									<option value='41'>&nbsp;│&nbsp;│&nbsp;└ 删除菜单</option>
									<option value='141'>&nbsp;│&nbsp;├ 前台导航设置</option>
									<option value='142'>&nbsp;│&nbsp;│&nbsp;├ 添加导航</option>
									<option value='143'>&nbsp;│&nbsp;│&nbsp;├ 删除导航</option>
									<option value='144'>&nbsp;│&nbsp;│&nbsp;├ 修改导航</option>
									<option value='145'>&nbsp;│&nbsp;│&nbsp;└ 导航排序</option>
									<option value='175'>&nbsp;│&nbsp;└ 计划任务</option>
									<option value='176'>&nbsp;│&nbsp;&nbsp;├ 添加新任务</option>
									<option value='177'>&nbsp;│&nbsp;&nbsp;├ 修改任务</option>
									<option value='178'>&nbsp;│&nbsp;&nbsp;├ 删除任务</option>
									<option value='179'>&nbsp;│&nbsp;&nbsp;└ 执守程序操作</option>
									<option value='180'>&nbsp;│&nbsp;&nbsp;&nbsp;├ 开启服务</option>
									<option value='181'>&nbsp;│&nbsp;&nbsp;&nbsp;├ 关闭服务</option>
									<option value='182'>&nbsp;│&nbsp;&nbsp;&nbsp;├ 开启程序</option>
									<option value='183'>&nbsp;│&nbsp;&nbsp;&nbsp;├ 关闭程序</option>
									<option value='184'>&nbsp;│&nbsp;&nbsp;&nbsp;└ 查看执守状态</option>
									<option value='10'>&nbsp;├ 日志管理</option>
									<option value='11'>&nbsp;│&nbsp;├ 后台登陆日志</option>
									<option value='12'>&nbsp;│&nbsp;└ 后台操作日志</option>
									<option value='13'>&nbsp;├ 管理员设置</option>
									<option value='15'>&nbsp;│&nbsp;├ 管理员列表</option>
									<option value='14'>&nbsp;│&nbsp;│&nbsp;├ 添加管理员</option>
									<option value='30'>&nbsp;│&nbsp;│&nbsp;├ 修改管理员</option>
									<option value='240'>&nbsp;│&nbsp;│&nbsp;└ 删除管理员</option>
									<option value='16'>&nbsp;│&nbsp;└ 管理员角色</option>
									<option value='17'>&nbsp;│&nbsp;&nbsp;├ 添加角色</option>
									<option value='31'>&nbsp;│&nbsp;&nbsp;├ 修改管理员角色</option>
									<option value='241'>&nbsp;│&nbsp;&nbsp;└ 删除角色</option>
									<option value='32'>&nbsp;├ 地区管理</option>
									<option value='34'>&nbsp;│&nbsp;└ 地区列表</option>
									<option value='35'>&nbsp;│&nbsp;&nbsp;├ 添加地区</option>
									<option value='37'>&nbsp;│&nbsp;&nbsp;├ 删除地区</option>
									<option value='38'>&nbsp;│&nbsp;&nbsp;└ 修改地区</option>
									<option value='137'>&nbsp;├ 附件管理</option>
									<option value='138'>&nbsp;│&nbsp;└ 附件列表</option>
									<option value='190'>&nbsp;├ 数据库管理</option>
									<option value='191'>&nbsp;│&nbsp;├ 数据库列表</option>
									<option value='192'>&nbsp;│&nbsp;│&nbsp;├ 查看表结构</option>
									<option value='193'>&nbsp;│&nbsp;│&nbsp;└ 备份数据库</option>
									<option value='194'>&nbsp;│&nbsp;└ 备份管理</option>
									<option value='195'>&nbsp;│&nbsp;&nbsp;├ 删除备份</option>
									<option value='196'>&nbsp;│&nbsp;&nbsp;├ 打包下载</option>
									<option value='197'>&nbsp;│&nbsp;&nbsp;└ 恢复备份</option>
									<option value='257'>&nbsp;└ 代理商管理</option>
									<option value='260'>&nbsp;&nbsp;├ 代理商菜单</option>
									<option value='261'>&nbsp;&nbsp;│&nbsp;├ 添加菜单</option>
									<option value='248'>&nbsp;&nbsp;│&nbsp;├ 修改菜单</option>
									<option value='249'>&nbsp;&nbsp;│&nbsp;└ 删除菜单</option>
									<option value='258'>&nbsp;&nbsp;├ 代理商列表</option>
									<option value='252'>&nbsp;&nbsp;│&nbsp;├ 添加代理商</option>
									<option value='254'>&nbsp;&nbsp;│&nbsp;├ 修改代理商信息</option>
									<option value='255'>&nbsp;&nbsp;│&nbsp;└ 删除代理商</option>
									<option value='259'>&nbsp;&nbsp;└ 代理商角色</option>
									<option value='250'>&nbsp;&nbsp;&nbsp;├ 添加角色</option>
									<option value='251'>&nbsp;&nbsp;&nbsp;├ 修改角色</option>
									<option value='253'>&nbsp;&nbsp;&nbsp;└ 删除角色</option>
									<option value='22'>内容管理</option>
									<option value='23'>&nbsp;├ 文章及分类管理</option>
									<option value='24'>&nbsp;│&nbsp;├ 文章列表</option>
									<option value='25'>&nbsp;│&nbsp;│&nbsp;├ 添加文章</option>
									<option value='26'>&nbsp;│&nbsp;│&nbsp;├ 修改文章</option>
									<option value='27'>&nbsp;│&nbsp;│&nbsp;└ 删除文章</option>
									<option value='28'>&nbsp;│&nbsp;└ 文章分类</option>
									<option value='29'>&nbsp;│&nbsp;&nbsp;├ 添加文章分类</option>
									<option value='36'>&nbsp;│&nbsp;&nbsp;├ 修改文章分类</option>
									<option value='39'>&nbsp;│&nbsp;&nbsp;├ 删除分类</option>
									<option value='217'>&nbsp;│&nbsp;&nbsp;└ 分类排序</option>
									<option value='185'>&nbsp;└ 广告内容管理</option>
									<option value='186'>&nbsp;&nbsp;└ 广告管理</option>
									<option value='187'>&nbsp;&nbsp;&nbsp;├ 添加广告</option>
									<option value='188'>&nbsp;&nbsp;&nbsp;├ 修改广告</option>
									<option value='189'>&nbsp;&nbsp;&nbsp;└ 删除广告</option>
									<option value='48'>会员管理</option>
									<option value='49'>&nbsp;├ 会员管理</option>
									<option value='50'>&nbsp;│&nbsp;├ 会员列表</option>
									<option value='154'>&nbsp;│&nbsp;│&nbsp;├ 群发信息</option>
									<option value='232'>&nbsp;│&nbsp;│&nbsp;├ 发标</option>
									<option value='281'>&nbsp;│&nbsp;│&nbsp;└ 添加会员</option>
									<option value='51'>&nbsp;│&nbsp;├ 调整帐户余额</option>
									<option value='52'>&nbsp;│&nbsp;├ 调整会员授信</option>
									<option value='53'>&nbsp;│&nbsp;├ 修改会员</option>
									<option value='64'>&nbsp;│&nbsp;├ 会员资料填写情况</option>
									<option value='146'>&nbsp;│&nbsp;├ 查看会员资料详细</option>
									<option value='225'>&nbsp;│&nbsp;├ 会员银行卡信息</option>
									<option value='226'>&nbsp;│&nbsp;│&nbsp;└ 导出会员银行卡信息</option>
									<option value='326'>&nbsp;│&nbsp;└ 调整帐户积分</option>
									<option value='54'>&nbsp;├ 认证及申请管理</option>
									<option value='55'>&nbsp;│&nbsp;├ 手机认证会员</option>
									<option value='56'>&nbsp;│&nbsp;├ 视频认证申请</option>
									<option value='65'>&nbsp;│&nbsp;│&nbsp;└ 视频认证审核</option>
									<option value='57'>&nbsp;│&nbsp;├ 现场认证申请</option>
									<option value='66'>&nbsp;│&nbsp;│&nbsp;└ 现场认证审核</option>
									<option value='58'>&nbsp;│&nbsp;├ VIP申请</option>
									<option value='67'>&nbsp;│&nbsp;│&nbsp;└ VIP申请审核</option>
									<option value='59'>&nbsp;│&nbsp;├ 实名认证申请</option>
									<option value='68'>&nbsp;│&nbsp;│&nbsp;├ 查看身份证照片</option>
									<option value='69'>&nbsp;│&nbsp;│&nbsp;└ 审核实名认证</option>
									<option value='60'>&nbsp;│&nbsp;└ 贷款额度申请</option>
									<option value='70'>&nbsp;│&nbsp;&nbsp;└ 贷款额度审核</option>
									<option value='61'>&nbsp;├ 其他</option>
									<option value='62'>&nbsp;│&nbsp;├ 会员上传资料管理</option>
									<option value='161'>&nbsp;│&nbsp;│&nbsp;└ 会员上传资料审核</option>
									<option value='63'>&nbsp;│&nbsp;├ 会员留言管理</option>
									<option value='71'>&nbsp;│&nbsp;└ 会员资料类型管理</option>
									<option value='206'>&nbsp;├ 会员积分</option>
									<option value='207'>&nbsp;│&nbsp;└ 查看会员积分明细</option>
									<option value='218'>&nbsp;└ 会员推荐管理</option>
									<option value='219'>&nbsp;&nbsp;├ 会员推荐情况</option>
									<option value='221'>&nbsp;&nbsp;│&nbsp;├ 取消关联</option>
									<option value='222'>&nbsp;&nbsp;│&nbsp;├ 指定推荐人</option>
									<option value='223'>&nbsp;&nbsp;│&nbsp;└ 设置推荐奖励</option>
									<option value='220'>&nbsp;&nbsp;└ 推荐统计</option>
									<option value='72'>分组相关权限</option>
									<option value='73'>&nbsp;├ 添加分组</option>
									<option value='74'>&nbsp;├ 修改分组</option>
									<option value='75'>&nbsp;├ 删除分组</option>
									<option value='76'>&nbsp;└ 排序</option>
									<option value='77'>资金统计</option>
									<option value='78'>&nbsp;├ 会员资金统计</option>
									<option value='79'>&nbsp;│&nbsp;├ 会员帐户情况</option>
									<option value='201'>&nbsp;│&nbsp;│&nbsp;└ 导出excel</option>
									<option value='83'>&nbsp;│&nbsp;├ 会员提现统计</option>
									<option value='200'>&nbsp;│&nbsp;│&nbsp;└ 导出excel</option>
									<option value='82'>&nbsp;│&nbsp;├ 会员充值统计</option>
									<option value='199'>&nbsp;│&nbsp;│&nbsp;└ 导出excel</option>
									<option value='88'>&nbsp;│&nbsp;├ 会员资金变动记录</option>
									<option value='91'>&nbsp;│&nbsp;│&nbsp;└ 导出excel</option>
									<option value='242'>&nbsp;│&nbsp;└ 会员奖金变动记录</option>
									<option value='84'>&nbsp;├ 网站资金统计</option>
									<option value='85'>&nbsp;│&nbsp;└ 网站资金统计</option>
									<option value='86'>&nbsp;├ 客服服务统计</option>
									<option value='87'>&nbsp;│&nbsp;└ 客服服务统计</option>
									<option value='89'>&nbsp;├ 投资排名统计</option>
									<option value='90'>&nbsp;│&nbsp;└ 投资排名统计</option>
									<option value='198'>&nbsp;│&nbsp;&nbsp;└ 导出excel</option>
									<option value='234'>&nbsp;├ 余额宝</option>
									<option value='235'>&nbsp;│&nbsp;├ 余额宝发放统计</option>
									<option value='236'>&nbsp;│&nbsp;└ 会员余额宝明细</option>
									<option value='237'>&nbsp;└ 代发工资</option>
									<option value='238'>&nbsp;&nbsp;├ 工资代发统计</option>
									<option value='239'>&nbsp;&nbsp;└ 工资代发明细</option>
									<option value='97'>充值提现</option>
									<option value='98'>&nbsp;└ 充值提现</option>
									<option value='99'>&nbsp;&nbsp;├ 充值记录</option>
									<option value='101'>&nbsp;&nbsp;│&nbsp;├ 充值处理</option>
									<option value='228'>&nbsp;&nbsp;│&nbsp;├ 导出充值记录</option>
									<option value='284'>&nbsp;&nbsp;│&nbsp;└ 二级审核</option>
									<option value='100'>&nbsp;&nbsp;└ 提现记录</option>
									<option value='102'>&nbsp;&nbsp;&nbsp;├ 提现处理</option>
									<option value='215'>&nbsp;&nbsp;&nbsp;├ 导出excel</option>
									<option value='283'>&nbsp;&nbsp;&nbsp;└ 二级审核</option>
									<option value='92'>参数配置</option>
									<option value='96'>&nbsp;├ 常用参数配置</option>
									<option value='93'>&nbsp;│&nbsp;├ 第三方登陆配置</option>
									<option value='94'>&nbsp;│&nbsp;├ 支付接口配置</option>
									<option value='152'>&nbsp;│&nbsp;│&nbsp;└ 线下充值银行</option>
									<option value='95'>&nbsp;│&nbsp;├ 会员级别配置</option>
									<option value='151'>&nbsp;│&nbsp;└ 提现银行设置</option>
									<option value='121'>&nbsp;├ 贷款相关参数</option>
									<option value='123'>&nbsp;│&nbsp;├ 费用设置</option>
									<option value='204'>&nbsp;│&nbsp;└ 合同相关参数</option>
									<option value='147'>&nbsp;├ 各类通知信息设置</option>
									<option value='148'>&nbsp;│&nbsp;├ 邮件通知信息</option>
									<option value='149'>&nbsp;│&nbsp;├ 手机通知信息</option>
									<option value='158'>&nbsp;│&nbsp;├ 站内信管理</option>
									<option value='159'>&nbsp;│&nbsp;│&nbsp;├ 删除</option>
									<option value='160'>&nbsp;│&nbsp;│&nbsp;└ 编辑</option>
									<option value='167'>&nbsp;│&nbsp;├ 信息通知设置</option>
									<option value='168'>&nbsp;│&nbsp;├ 站内信通知信息</option>
									<option value='216'>&nbsp;│&nbsp;└ 短信发送记录</option>
									<option value='208'>&nbsp;└ 自定义借款标参数</option>
									<option value='209'>&nbsp;&nbsp;├ 信用标配置</option>
									<option value='211'>&nbsp;&nbsp;├ 抵押标配置</option>
									<option value='213'>&nbsp;&nbsp;└ 担保标配置</option>
									<option value='114'>借款标管理</option>
									<option value='104'>&nbsp;├ 借款列表</option>
									<option value='105'>&nbsp;│&nbsp;├ 发标复审待审核</option>
									<option value='120'>&nbsp;│&nbsp;│&nbsp;└ 审核初审标</option>
									<option value='106'>&nbsp;│&nbsp;├ 满标复审待审核</option>
									<option value='166'>&nbsp;│&nbsp;│&nbsp;└ 复审审核</option>
									<option value='107'>&nbsp;│&nbsp;├ 正在招标</option>
									<option value='139'>&nbsp;│&nbsp;│&nbsp;└ 流标|延时</option>
									<option value='108'>&nbsp;│&nbsp;├ 正在还款</option>
									<option value='109'>&nbsp;│&nbsp;├ 已完成</option>
									<option value='110'>&nbsp;│&nbsp;├ 已流标</option>
									<option value='111'>&nbsp;│&nbsp;├ 初审未通过</option>
									<option value='112'>&nbsp;│&nbsp;├ 复审未通过</option>
									<option value='323'>&nbsp;│&nbsp;├ 发标初审</option>
									<option value='324'>&nbsp;│&nbsp;│&nbsp;└ 初审审核</option>
									<option value='285'>&nbsp;│&nbsp;└ 修改借款信息</option>
									<option value='113'>&nbsp;├ 流转标管理</option>
									<option value='115'>&nbsp;│&nbsp;├ 流转中的借款</option>
									<option value='124'>&nbsp;│&nbsp;│&nbsp;├ 编辑流转标</option>
									<option value='125'>&nbsp;│&nbsp;│&nbsp;└ 添加流转标</option>
									<option value='116'>&nbsp;│&nbsp;└ 完成的流转标</option>
									<option value='203'>&nbsp;│&nbsp;&nbsp;└ 修改流转标</option>
									<option value='117'>&nbsp;├ 逾期借款管理</option>
									<option value='118'>&nbsp;│&nbsp;├ 逾期借款列表</option>
									<option value='128'>&nbsp;│&nbsp;│&nbsp;├ 代还</option>
									<option value='229'>&nbsp;│&nbsp;│&nbsp;└ 导出</option>
									<option value='119'>&nbsp;│&nbsp;└ 逾期借款会员</option>
									<option value='230'>&nbsp;│&nbsp;&nbsp;└ 导出</option>
									<option value='162'>&nbsp;├ 留言管理</option>
									<option value='163'>&nbsp;│&nbsp;└ 留言管理</option>
									<option value='164'>&nbsp;│&nbsp;&nbsp;├ 留言审核</option>
									<option value='165'>&nbsp;│&nbsp;&nbsp;└ 删除留言</option>
									<option value='205'>&nbsp;├ 查看借款标投资详情</option>
									<option value='227'>&nbsp;├ 查看流转标借款详情</option>
									<option value='243'>&nbsp;├ 债权转让管理</option>
									<option value='244'>&nbsp;│&nbsp;└ 债权转让列表</option>
									<option value='245'>&nbsp;│&nbsp;&nbsp;├ 转让审核</option>
									<option value='325'>&nbsp;│&nbsp;&nbsp;└ 转让详细</option>
									<option value='263'>&nbsp;├ 定存宝划管理</option>
									<option value='264'>&nbsp;│&nbsp;├ 定存宝划列表</option>
									<option value='265'>&nbsp;│&nbsp;│&nbsp;├ 添加定存宝</option>
									<option value='266'>&nbsp;│&nbsp;│&nbsp;├ 修改定存宝</option>
									<option value='268'>&nbsp;│&nbsp;│&nbsp;├ 审核定存宝</option>
									<option value='269'>&nbsp;│&nbsp;│&nbsp;└ 发放收益</option>
									<option value='267'>&nbsp;│&nbsp;└ 定存宝销售情况</option>
									<option value='270'>&nbsp;└ 融资申请管理</option>
									<option value='271'>&nbsp;&nbsp;└ 申请列表</option>
									<option value='272'>&nbsp;&nbsp;&nbsp;└ 审核</option>
									<option value='126'>其他权限菜单</option>
									<option value='127'>&nbsp;├ 后台SWF上传图片</option>
									<option value='129'>&nbsp;├ 后台编辑器相关操作</option>
									<option value='130'>&nbsp;│&nbsp;├ 上传图片</option>
									<option value='131'>&nbsp;│&nbsp;├ 涂鸦上传</option>
									<option value='132'>&nbsp;│&nbsp;├ 附件上传</option>
									<option value='133'>&nbsp;│&nbsp;└ 图片管理</option>
									<option value='140'>&nbsp;├ 查看会员详情</option>
									<option value='224'>&nbsp;├ 检测会员是否存在</option>
									<option value='233'>&nbsp;├ 修改瑞盈宝利率</option>
									<option value='282'>&nbsp;└ 后台地区联动</option>
									<option value='169'>安全中心</option>
									<option value='170'>&nbsp;└ 安全中心</option>
									<option value='171'>&nbsp;&nbsp;├ 文件夹权限检测</option>
									<option value='172'>&nbsp;&nbsp;└ 可疑文件扫描</option>
									<option value='173'>&nbsp;&nbsp;&nbsp;├ 删除可疑文件</option>
									<option value='174'>&nbsp;&nbsp;&nbsp;└ 查看可疑文件源码</option>
							</select></td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">名称:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">项目:</label>
						<div class="controls">
							<input class="input" name="id" value="admin" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">模块:</label>
						<div class="controls">
							<input class="input" name="id" value="Menu" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">方法:</label>
						<div class="controls">
							<input class="input" name="id" value="add" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">关联方法:</label>
						<div class="controls">
							<td><input class="input" name="id" value="21" type="hidden">
								<input name="user_nicename" type="text">权限判断时使用，可为空</td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">参数:</label>
						<div class="controls">
							<td><input class="input" name="id" value="21" type="hidden">
								<input name="user_nicename" type="text">
								例:groupid=1&amp;type=2</td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-signature">备注：</label>
						<div class="controls">
							<textarea id="input-signature" placeholder="个性签名"
								name="signature"></textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">状态:</label>
						<div class="controls">

							<td><select name="status">
									<option value="1">显示</option>
									<option value="0">不显示</option>
							</select></td>

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">类型:</label>
						<div class="controls">
							<td><select name="type">
									<option value="1" selected>权限认证+菜单</option>
									<option value="0">只作为菜单</option>
							</select> 注意：“权限认证+菜单”表示加入后台权限管理，纯碎是菜单项请不要选择此项。</td>

						</div>
					</div>
			</form>
		</div>


		<div class="form-actions">
			<button type="submit"
				class="btn btn-primary btn_submit  J_ajax_submit_btn">添加</button>
			&nbsp;&nbsp;<a class="btn"  href="javascript:;"
				onClick="window.history.back(-1);return false;">返回</a>
		</div>

	</div>



	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>

</body>
</html>