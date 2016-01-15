<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/topHeader.jsp"%>
<%@ page import="java.util.*"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员列表</a></li>
			<li><a href="#">添加会员 </a></li>
		</ul>

		<div class="common-form">	
					<form class="well form-search" method="post"
						action="/admin_post/index.html">
						<div class="search_type cc mb10">
							<div class="mb10">
								<span class="mr20"> 是否VIP： <select name="is_vip"
									class="myselect" id="is_vip"><option
											selected="selected" value="">全部</option>
										<option value="yes">是</option>
										<option value="no">否</option></select> 会员类型： <select name="m#m_type"
									class="myselect" id="m#m_type" style='width: 100px'><option
											selected="selected" value="">全部</option>
										<option value="1">投资人</option>
										<option value="2">借款人</option>
										<option value="5">机构</option></select> 会员名： <input style='width: 100px'
									type="text" class="input" name="m#user_name" id="m#user_name"
									value="" /> 真实姓名： <input style='width: 100px' type="text"
									class="input" name="mi#real_name" id="mi#real_name" value="" />
									所属客服： <input style='width: 100px' type="text" class="input"
									name="m#customer_name" id="m#customer_name" value="" /> 余额： <select
									name="lx" class="myselect" id="lx"><option
											value="mm.account_money">可用余额</option>
										<option value="mm.money_freeze">冻结金额</option></select> <select
									name="bj" class="myselect" id="bj"><option value="gt">大于</option>
										<option value="eq">等于</option>
										<option value="lt">小于</option></select> <input style='width: 100px'
									type="text" class="input" name="money" id="money" value="" />
									注册时间： <input type="text" name="start_time"
									class="input length_2 J_date" value="" style="width: 80px;">
									- <input type="text" class="input length_2 J_date"
									name="end_time" value="" style="width: 80px;"> 是否禁用： <input
									name="radiobutton" type="radio" value="radiobutton" checked>
									全部 <input name="radiobutton" type="radio" value="radiobutton">
									是 <input type="radio" name="radiobutton" value="radiobutton">
									否 </label></select>
									<button class="btn">搜索</button>
									<button class="btn export"
										onClick="dialogUrl('/newadmin-User-msgSend?1=1&','信息发送','',900,470);;return false;">给当前条件下会员发信息</button>
								</span>
							</div>
						</div>
					</form>

					<div class="table_list">
						<table class="table table-hover" width="100%">
							<thead>
								<tr>
									<th class="line_l">ID</th>
									<th class="line_l">用户名</th>
									<th class="line_l">真实姓名</th>
									<th class="line_l">所属客服</th>
									<th class="line_l">会员类型</th>
									<th class="line_l">可用余额</th>
									<th class="line_l">冻结金额</th>
									<th class="line_l">待收金额</th>
									<th class="line_l">积分</th>
									<th class="line_l">注册时间</th>
									<th class="line_l">操作</th>
								</tr>
							</thead>
							<tr overstyle='on' id="list_264">
								<td>264</td>
								<td><a target="_blank"
									href="/newadmin-common-user-user_name-egspoon.shtml">egspoon</a></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>投资者</td>
								<td>0.00元</td>
								<td>0.00元</td>
								<td>0.00元</td>
								<td>0分</td>
								<td>2015-03-16 18:02</td>
								<td><a href="javascript:;"
									onClick="dialogUrl('/newadmin-User-moneyedit?id=264','调整余额','','',330);">调整余额</a>&nbsp;&nbsp;
									<a href="javascript:;"
									onClick="dialogUrl('/newadmin-User-moneyeditc?id=264','调整积分','','',330);">调整积分</a>&nbsp;&nbsp;
									<a href="javascript:;"
									onClick="dialogUrl('/newadmin-User-creditedit?id=264','调整授信');">调整授信</a>&nbsp;&nbsp;
									<a href="/newadmin-User-edit?id=264">修改信息</a>&nbsp;&nbsp; <a
									href="javascript:open_iframe_dialog('${dfn:U('admin/administration/user_moneyedit')}','评论列表','width:50%')">查看评论</a></td>
							</tr>

						</table>
						<div class="pagination">
							222 条记录 5/23 页 <a
								href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a
								href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a>
							&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a>
							&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a>
							<a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a>
						</div>
					</div>
				
			
		</div>
		
		<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="tab-content">
					<div class="control-group">
						<label class="control-label" for="input01">昵称:</label>
						<div class="controls">
							<input class="input" name="id" value="21" type="hidden">
							<input name="user_nicename" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">性别:</label>
						<div class="controls">
							<select name="sex">
								<option value="0" selected="selected">保密</option>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-birthday">生日</label>
						<div class="controls">
							<input class="J_date date" id="input-birthday"
								placeholder="2013-01-04" name="birthday" value="0000-00-00"
								type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-user_url">个人网址</label>
						<div class="controls">
							<a
								href="javascript:open_iframe_dialog('/comment/commentadmin/index/post_id/22.html','评论列表')">查看评论</a>
							<input id="input-user_url" placeholder="http://鼎峰P2P.com"
								name="user_url" type="text">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input-signature">个性签名</label>
						<div class="controls">
							<textarea id="input-signature" placeholder="个性签名"
								name="signature"></textarea>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>


	<script src="${AdminStatics}/js/common.js"></script>
	<script type="text/javascript">
		$(".nav-tabs li").click(function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");
			$(".common-form").eq(index).show().siblings(".common-form").hide();
		});
	</script>

	<script type="text/javascript">
		var dialogCallBack = function() {
			var iframeName = $(".aui_content").find("iframe").attr("name");
			$(".J_ajaxForm", window.frames[iframeName].document).submit();
			return false;

		}
	</script>
	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>

</body>
</html>