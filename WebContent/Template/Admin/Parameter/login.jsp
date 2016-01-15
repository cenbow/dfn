<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
<div class="nav">
  <ul class="cc">
        <li class="current"><a href="#">第三方登陆配置</a></li>
  </ul>
</div>

	 <div class="pop_nav">
    <ul class="J_tabs_nav">
			<li class="active"><a href="#A" data-toggle="tab">QQ登陆</a></li>
			<li><a href="#B" data-toggle="tab">新浪微博</a></li>
			<li><a href="#C" data-toggle="tab">UC同步登陆</a></li>
			<li><a href="#D" data-toggle="tab">COOKIE密钥设置</a></li>
		</ul>
		<form class="J_ajaxForms" name="myform" id="myform"
			action="/admin/setting/site_post.html" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							 <div class="h_a">QQ登陆</div>
        <div class="table_full">
          <table width="100%" class="table_form ">
            <tr>
              <th width="200">是否启用：</th>
              <td><input type="radio" name="login[qq][enable]" value="1" id="login[qq][enable]_1" ><label for="login[qq][enable]_1">是</label><input type="radio" name="login[qq][enable]" value="0" id="login[qq][enable]_2" ><label for="login[qq][enable]_2">否</label></select></td>
            </tr>
            <tr>
              <th>APP ID：</th>
              <td><input  type="text" class="input" name="login[qq][partner]" id="login[qq][partner]" value=""/></td>
            </tr>
            <tr>
              <th>APP KEY：</th>
              <td><input  type="text" class="input" name="login[qq][key]" id="login[qq][key]" value=""/></td>
            </tr>
          </table>
        </div>

						</div>
						<div class="tab-pane" id="B">
							<div class="h_a">新浪微博</div>
        <div class="table_full">
          <table width="100%" class="table_form ">
            <tr>
              <th width="200">是否启用：</th>
              <td><input type="radio" name="login[sina][enable]" value="1" id="login[sina][enable]_1" ><label for="login[sina][enable]_1">是</label><input type="radio" name="login[sina][enable]" value="0" id="login[sina][enable]_2" ><label for="login[sina][enable]_2">否</label></select></td>
            </tr>
            <tr>
              <th>WB_AKEY：</th>
              <td><input  type="text" class="input" name="login[sina][akey]" id="login[sina][akey]" value=""/></td>
            </tr>
            <tr>
              <th>WB_SKEY：</th>
              <td><input  type="text" class="input" name="login[sina][skey]" id="login[sina][skey]" value=""/></td>
            </tr>
          </table>
        </div>

						</div>
						<div class="tab-pane" id="C">
							 <div class="h_a">UC同步登陆</div>
        <div class="table_full">
          <table width="100%" class="table_form ">
            <tr>
              <th width="200">是否启用：</th>
              <td><input type="radio" name="login[uc][enable]" value="1" id="login[uc][enable]_1" ><label for="login[uc][enable]_1">是</label><input type="radio" name="login[uc][enable]" value="0" id="login[uc][enable]_2" ><label for="login[uc][enable]_2">否</label></select></td>
            </tr>
            <tr>
              <th colspan="2">UCenter 通信相关:与UC链接验证的相关信息 </th>
            </tr>
            <tr>
              <th>UC_KEY：</th>
              <td><input  type="text" class="input" name="login[uc][UC_KEY]" id="login[uc][UC_KEY]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter的 URL 地址：</th>
              <td><input  type="text" class="input" name="login[uc][UC_API]" id="login[uc][UC_API]" value=""/><span class="commonToolTip">带http://</span></td>
            </tr>
            <tr>
              <th>UCenter 的字符集：</th>
              <td><input  type="text" class="input" name="login[uc][UC_CHARSET]" id="login[uc][UC_CHARSET]" value=""/><span class="commonToolTip">gbk | utf-8</span></td>
            </tr>
            <tr>
              <th>UCenter 的 IP：</th>
              <td><input  type="text" class="input" name="login[uc][UC_IP]" id="login[uc][UC_IP]" value=""/><span class="commonToolTip">默认留空,当前应用服务器解析域名有问题时, 请设置此值</span></td>
            </tr>
            <tr>
              <th>当前应用的 ID：</th>
              <td><input  type="text" class="input" name="login[uc][UC_APPID]" id="login[uc][UC_APPID]" value=""/></td>
            </tr>
            <tr>
              <th colspan="2">UCenter 数据库相关:UC所用数据库的相关信息 </th>
            </tr>
            <tr>
              <th>UCenter 数据库主机：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBHOST]" id="login[uc][UC_DBHOST]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter 数据库用户名：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBUSER]" id="login[uc][UC_DBUSER]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter 数据库密码：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBPW]" id="login[uc][UC_DBPW]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter 数据库名称：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBNAME]" id="login[uc][UC_DBNAME]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter 数据库字符集：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBCHARSET]" id="login[uc][UC_DBCHARSET]" value=""/></td>
            </tr>
            <tr>
              <th>UCenter 数据库表前缀：</th>
              <td><input  type="text" class="input" name="login[uc][UC_DBTABLEPRE]" id="login[uc][UC_DBTABLEPRE]" value=""/></td>
            </tr>
          </table>
        </div>

						</div>
						<div class="tab-pane" id="D">
							<div class="h_a">COOKIE密钥设置</div>
        <div class="table_full">
          <table width="100%" class="table_form ">
            <tr>
              <th width="200">COOKIE_KEY：</th>
              <td><input  type="text" class="input" name="login[cookie][key]" id="login[cookie][key]" value=""/><span class="commonToolTip">越复杂越好</span></td>
            </tr>
          </table>
        </div>
      </div>

						</div>
									
			</div>
		  </fieldset>
	   </form>
</div>
					</div>
				<div class="form-actions">
					<button type="submit"
						class="btn btn-primary btn_submit  J_ajax_submit_btn">提交</button>
				</div>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript" src="statics/js/common.js"></script>
	<script>
		/////---------------------
		Wind.use('validate', 'ajaxForm', 'artDialog', function() {
			//javascript
			var form = $('form.J_ajaxForms');
			//ie处理placeholder提交问题
			if ($.browser.msie) {
				form.find('[placeholder]').each(function() {
					var input = $(this);
					if (input.val() == input.attr('placeholder')) {
						input.val('');
					}
				});
			}
			//表单验证开始
			form.validate({
				//是否在获取焦点时验证
				onfocusout : false,
				//是否在敲击键盘时验证
				onkeyup : false,
				//当鼠标掉级时验证
				onclick : false,
				//验证错误
				showErrors : function(errorMap, errorArr) {
					//errorMap {'name':'错误信息'}
					//errorArr [{'message':'错误信息',element:({})}]
					try {
						$(errorArr[0].element).focus();
						art.dialog({
							id : 'error',
							icon : 'error',
							lock : true,
							fixed : true,
							background : "#CCCCCC",
							opacity : 0,
							content : errorArr[0].message,
							cancelVal : '确定',
							cancel : function() {
								$(errorArr[0].element).focus();
							}
						});
					} catch (err) {
					}
				},
				//验证规则
				rules : {
					'options[site_name]' : {
						required : 1
					},
					'options[site_host]' : {
						required : 1
					},
					'options[site_root]' : {
						required : 1
					}
				},
				//验证未通过提示消息
				messages : {
					'options[site_name]' : {
						required : '请输入网站名称！'
					},
					'options[site_host]' : {
						required : '请输入网站域名！'
					},
					'options[site_root]' : {
						required : '请输入安装路径！'
					}
				},
				//给未通过验证的元素加效果,闪烁等
				highlight : false,
				//是否在获取焦点时验证
				onfocusout : false,
				//验证通过，提交表单
				submitHandler : function(forms) {
					$(forms).ajaxSubmit({
						url : form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
						dataType : 'json',
						beforeSubmit : function(arr, $form, options) {

						},
						success : function(data, statusText, xhr, $form) {
							if (data.status) {
								setCookie("refersh_time", 1);
								//添加成功
								Wind.use("artDialog", function() {
									art.dialog({
										id : "succeed",
										icon : "succeed",
										fixed : true,
										lock : true,
										background : "#CCCCCC",
										opacity : 0,
										content : data.info,
										button : [ {
											name : '确定',
											callback : function() {
												return true;
											},
											focus : true
										}, {
											name : '关闭',
											callback : function() {
												return true;
											}
										} ]
									});
								});
							} else {
								alert(data.info);
							}
						}
					});
				}
			});
		});
		////-------------------------
	</script>
</body>
</html>