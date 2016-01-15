<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp"/>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="http://demo.鼎峰P2P.com/admin/storage/index.html">文件存储</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/storage/setting_post.html">
				<select name="type">
					<option selected="selected" value="Local">系统默认</option>
					<option value="Qiniu">七牛云存储</option>
				</select>
				<div class="">
					<ul class="nav nav-tabs">
						<li class="active"><a>七牛云存储</a></li>
					</ul>
					<table cellpadding="2" cellspacing="2" width="100%">
						<tbody>
							<tr>
								<td width="120">AccessKey</td>
								<td><input class="input mr5" name="Qiniu[accessKey]" type="text"></td>
							</tr>
							<tr>
								<td>SecretKey</td>
								<td><input class="input mr5" name="Qiniu[secrectKey]"
									type="text"></td>
							</tr>
							<tr>
								<td>空间域名</td>
								<td><input class="input mr5" name="Qiniu[domain]" type="text"></td>
							</tr>
							<tr>
								<td>空间名称</td>
								<td><input class="input mr5" name="Qiniu[bucket]" type="text"></td>
							</tr>
							<tr>
								<td>获取AccessKey</td>
								<td><a href="https://portal.qiniu.com/signup?code=3lfihpz361o42"
									target="_blank">马上获取</a></td>
							</tr>
							<tr>
								<td>七牛专享优惠码</td>
								<td><a
									href="http://www.鼎峰P2P.com/topic/topic/index/id/103.html"
									target="_blank">507670e8</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit J_ajax_submit_btn">确定</button>
				</div>
			</form>
		</div>
	</div>
	<script src="${AdminStatics}/js/common.js"></script>
</body>
</html>