<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="${dfn:U('admin/article_login/index')}">第三方登陆配置</a></li>
		</ul>
	</div>

	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">QQ登陆</a></li>
			<li><a href="#B" data-toggle="tab">新浪微博</a></li>
			<li><a href="#C" data-toggle="tab">UC同步登陆</a></li>
			<li><a href="#D" data-toggle="tab">COOKIE密钥设置</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm"" name="myform" id="myform"
			action="${dfn:U('admin/article_login/addArticle_login')}" method="post">
			<dfTag:token/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div >QQ登陆</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">是否启用：</th>
											<td>${dfForm:select( "login[qq][enable]",loginSelect, data['login[qq][enable]'], dfForm_class,  dfForm_style,dfForm_others)}
											</td>
									</tr>
									<tr>
										<th>APP ID：</th>
											<td>${dfForm:input( "login[qq][partner]", data['login[qq][partner]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th>APP KEY：</th>
											<td>${dfForm:input( "login[qq][key]", data['login[qq][key]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>
							</div>

						</div>
						<div class="tab-pane" id="B">
							<div >新浪微博</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">是否启用：</th>
										<td>${dfForm:select( "login[sina][enable]",loginSelect, data['login[sina][enable]'], dfForm_class,  dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th>WB_AKEY：</th>
										<td>${dfForm:input( "login[sina][akey]", data['login[sina][akey]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th>WB_SKEY：</th>
										<td>${dfForm:input( "login[sina][skey]", data['login[sina][skey]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>
							</div>

						</div>
						<div class="tab-pane" id="C">
							<div >UC同步登陆</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200"  class="control-label">是否启用：</th>
											<td>${dfForm:select( "login[uc][enable]",loginSelect, data['login[uc][enable]'], dfForm_class,  dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th colspan="2">UCenter 通信相关:与UC链接验证的相关信息</th>
									</tr>
									<tr>
										<th class="control-label">UC_KEY：</th>
										<td>${dfForm:input( "login[uc][UC_KEY]", data['login[uc][UC_KEY]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter的 URL 地址：</th>
									<td>${dfForm:input( "login[uc][UC_API]", data['login[uc][UC_API]'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">带http://</span></td>
									</tr>
									<tr>
										<th class="control-label">UCenter 的字符集：</th>
										<td>${dfForm:input( "login[uc][UC_CHARSET]", data['login[uc][UC_CHARSET]'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">gbk | utf-8</span></td>
									</tr>
									<tr>
										<th class="control-label">UCenter 的 IP：</th>
										<td>${dfForm:input( "login[uc][UC_IP]", data['login[uc][UC_IP]'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">默认留空,当前应用服务器解析域名有问题时, 请设置此值</span></td>
									</tr>
									<tr>
										<th class="control-label">当前应用的 ID：</th>
											<td>${dfForm:input( "login[uc][UC_APPID]", data['login[uc][UC_APPID]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th colspan="2">UCenter 数据库相关:UC所用数据库的相关信息</th>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库主机：</th>
										<td>${dfForm:input( "login[uc][UC_DBHOST]", data['login[uc][UC_DBHOST]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库用户名：</th>
											<td>${dfForm:input( "login[uc][UC_DBUSER]", data['login[uc][UC_DBUSER]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库密码：</th>
											<td>${dfForm:input( "login[uc][UC_DBPW]", data['login[uc][UC_DBPW]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库名称：</th>
											<td>${dfForm:input( "login[uc][UC_DBNAME]", data['login[uc][UC_DBNAME]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库字符集：</th>
											<td>${dfForm:input( "login[uc][UC_DBCHARSET]", data['login[uc][UC_DBCHARSET]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
										<th class="control-label">UCenter 数据库表前缀：</th>
											<td>${dfForm:input( "login[uc][UC_DBTABLEPRE]", data['login[uc][UC_DBTABLEPRE]'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
								</table>
							</div>

						</div>
						<div class="tab-pane" id="D">
							<div >COOKIE密钥设置</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200">COOKIE_KEY：</th>
											<td>${dfForm:input( "login[cookie][key]", data['login[cookie][key]'], dfForm_class, dfForm_style,dfForm_others)}<span
											class="commonToolTip">越复杂越好</span></td>
									</tr>
								</table>
							</div>
						</div>

					</div>

				</div>
			</fieldset>
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>
		</form>
	</div>
	
	
	
	
</body>
