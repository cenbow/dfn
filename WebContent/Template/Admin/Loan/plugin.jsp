<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">所有插件</a></li>
			<!-- <li><a href="/admin/plugin/add.html">创建插件</a></li> -->
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								<th>名称</th>
								<th>标识</th>
								<th>钩子</th>
								<th>描述</th>
								<th>作者</th>
								<th width="45">状态</th>
								<th width="150">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>插件演示</td>
								<td>Demo</td>
								<td>footer</td>
								<td>插件演示</td>
								<td>鼎峰P2P</td>
								<td>禁用</td>
								<td><a
									href="http://demo.鼎峰P2P.com/admin/plugin/setting/id/1.html">设置</a>|

									<a href="javascript:;" style="color: #ccc;">管理</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/update/name/Demo.html"
									class="J_ajax_dialog_btn" data-msg="确定更新该插件吗？">更新</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/toggle/id/1/enable/1.html"
									class="J_ajax_dialog_btn" data-msg="确定启用该插件吗？">启用</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/uninstall/id/1.html"
									class="J_ajax_dialog_btn" data-msg="确定卸载该插件吗？">卸载</a></td>
							</tr>
							<tr>
								<td>圣诞雪花</td>
								<td>Snow</td>
								<td>footer_end</td>
								<td>圣诞雪花特效</td>
								<td>鼎峰P2P</td>
								<td>启用</td>
								<td><a
									href="http://demo.鼎峰P2P.com/admin/plugin/setting/id/3.html">设置</a>|

									<a href="javascript:;" style="color: #ccc;">管理</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/update/name/Snow.html"
									class="J_ajax_dialog_btn" data-msg="确定更新该插件吗？">更新</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/toggle/id/3/disable/1.html"
									class="J_ajax_dialog_btn" data-msg="确定禁用该插件吗？">禁用</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/uninstall/id/3.html"
									class="J_ajax_dialog_btn" data-msg="确定卸载该插件吗？">卸载</a></td>
							</tr>
							<tr>
								<td>百度分享</td>
								<td>Sharebaidu</td>
								<td>footer_end</td>
								<td>百度分享</td>
								<td>M</td>
								<td>启用</td>
								<td><a href="javascript:;" style="color: #ccc;">设置</a>| <a
									href="javascript:;" style="color: #ccc;">管理</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/update/name/Sharebaidu.html"
									class="J_ajax_dialog_btn" data-msg="确定更新该插件吗？">更新</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/toggle/id/4/disable/1.html"
									class="J_ajax_dialog_btn" data-msg="确定禁用该插件吗？">禁用</a>| <a
									href="http://demo.鼎峰P2P.com/admin/plugin/uninstall/id/4.html"
									class="J_ajax_dialog_btn" data-msg="确定卸载该插件吗？">卸载</a></td>
							</tr>
							<tr>
								<td>世界，你好！</td>
								<td>Helloworld</td>
								<td></td>
								<td>helloworld</td>
								<td>无名</td>
								<td>未安装</td>
								<td><a
									href="http://demo.鼎峰P2P.com/admin/plugin/install/name/Helloworld.html"
									class="J_ajax_dialog_btn" data-msg="确定安装该插件吗？">安装</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>