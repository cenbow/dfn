<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed" style="min-width: 800px;">
	<div class="" style="display: none; position: absolute;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div class="aui_titleBar">
													<div style="cursor: move;" class="aui_title"></div>
													<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
												</div></td>
										</tr>
										<tr>
											<td style="display: none;" class="aui_icon"><div
													style="background: none repeat scroll 0% 0% transparent;"
													class="aui_iconBg"></div></td>
											<td style="width: auto; height: auto;" class="aui_main"><div
													style="padding: 20px 25px;" class="aui_content"></div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													style="display: none;" class="aui_buttons"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td style="cursor: se-resize;" class="aui_se"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="http://demo.鼎峰P2P.com/comment/commentadmin/index.html">所有评论</a></li>
		</ul>
		<form class="J_ajaxForm" action="" method="post">
			<div class="table_list">
				<table class="table table-hover" width="100%">
					<thead>
						<tr>
							<th width="16"><label><input class="J_check_all"
									data-direction="x" data-checklist="J_check_x" type="checkbox"></label></th>
							<th width="50">ID</th>
							<th>用户名/姓名</th>
							<th>邮箱</th>
							<th width="140">内容</th>
							<th width="140"><span>评论时间</span></th>
							<th width="50"><span>状态</span></th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="170" type="checkbox"></td>
							<td>170</td>
							<td>lonycn</td>
							<td>lonycn@qq.com</td>
							<td>看起来不错的样子~</td>
							<td>2014-12-23 22:42:41</td>
							<td>已审核</td>
							<td><a
								href="http://demo.鼎峰P2P.com/comment/commentadmin/delete/id/170.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="169" type="checkbox"></td>
							<td>169</td>
							<td>天港成客服1</td>
							<td></td>
							<td>1111</td>
							<td>2014-12-23 15:26:05</td>
							<td>已审核</td>
							<td><a
								href="http://demo.鼎峰P2P.com/comment/commentadmin/delete/id/169.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="168" type="checkbox"></td>
							<td>168</td>
							<td>堕落的叹息</td>
							<td></td>
							<td>ddd</td>
							<td>2014-12-19 16:53:59</td>
							<td>已审核</td>
							<td><a
								href="http://demo.鼎峰P2P.com/comment/commentadmin/delete/id/168.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="167" type="checkbox"></td>
							<td>167</td>
							<td>堕落的叹息</td>
							<td></td>
							<td>gg</td>
							<td>2014-12-19 16:52:45</td>
							<td>已审核</td>
							<td><a
								href="http://demo.鼎峰P2P.com/comment/commentadmin/delete/id/167.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="166" type="checkbox"></td>
							<td>166</td>
							<td>一棵树</td>
							<td></td>
							<td>请问 CMF 什么意思？</td>
							<td>2014-12-19 09:26:00</td>
							<td>已审核</td>
							<td><a
								href="http://demo.鼎峰P2P.com/comment/commentadmin/delete/id/166.html"
								class="J_ajax_del">删除</a></td>
						</tr>
					</tbody>
				</table>
				<div class="pagination">
					&nbsp;<span class="current">1</span> <a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/2.html">
						2</a> <a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/3.html">
						3</a> <a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/4.html">
						4</a> <a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/5.html">
						5</a> &nbsp;<a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/2.html">下一页</a>
					<a
						href="http://demo.鼎峰P2P.com/comment/commentadmin/index/p/5.html">尾页</a>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					class="J_check_all" data-direction="y" data-checklist="J_check_y"
					id="check_all" type="checkbox">全选</label>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/comment/commentadmin/check/check/1.html"
					data-subcheck="true">审核</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/comment/commentadmin/check/uncheck/1.html"
					data-subcheck="true">取消审核</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/comment/commentadmin/delete.html"
					data-subcheck="true" data-msg="你确定删除吗？">删除</button>
			</div>
		</form>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>