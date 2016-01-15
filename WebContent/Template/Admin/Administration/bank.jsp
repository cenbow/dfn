<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body>
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">会员银行卡信息</a></li>
		</ul>
		<div class="wrap J_check_wrap">
			<form class="well form-search" method="post"
				action="/admin_post/index.html">
				<div class="search_type cc mb10">
					<div class="mb10">
						<span class="mr20"> 开户行： <input type="text"
							name="textfield2" /> 会员名： <label> <input type="text"
								name="textfield" />
						</label> 真实姓名： <label> <input type="text" name="textfield4" />
						</label> 所属客服： <input type="text" name="textfield3" /> &nbsp;&nbsp; 添加时间：
							<input name="start_time" class="input length_2 J_date date"
							style="width: 80px;" autocomplete="off" type="text" /> - <input
							class="input length_2 J_date date" name="end_time"
							style="width: 80px;" autocomplete="off" type="text" /> <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
							<label> <input type="submit" name="Submit2" value="搜索" />
						</label> &nbsp; <input type="submit" name="Submit2" value="导出" />
						</span>
					</div>
				</div>
			</form>
			<form method="post" class="J_ajaxForm" action="#">
				<div class="table_list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th align="center">ID</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>所属客服</th>
								<th>身份证号</th>
								<th>银行卡号</th>
								<th>开户行</th>
								<th>支行</th>
								<th>积分</th>
								<th>添加时间</th>
								<th align="center">修改时间</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">238</td>
								<td><a
									href="http://ggmoney.com/newadmin-other-o-menuid-61.shtml">123456789</a></td>
								<td>梁旭</td>
								<td>投资者</td>
								<td>370827198902211055</td>
								<td>6228489651237</td>
								<td>---</td>
								<td>建行</td>
								<td>0分</td>
								<td>2014-09-24 10:41:59</td>
								<td>未修改</td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						<p>
							222 条记录 5/23 页 <a
								href="/newadmin-user-index-menuid-50.shtml?page=4">上一页</a> <a
								href="http://demo.鼎峰P2P.com/user/oauthadmin/index/p/2.html">下一页</a>
							&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=1">&nbsp;1&nbsp;</a>
							&nbsp; <a href="/newadmin-user-index-menuid-50.shtml?page=10">下5页</a>
							<a href="/newadmin-user-index-menuid-50.shtml?page=23">最后一页</a>
						</p>
					</div>
				</div>
			</form>
		</div>
		<div style="display: none;" class="wrap J_check_wrap">
			<form style="" name="myform" id="myform"
				action="/admin_post/add_post.html" method="post"
				class="form-horizontal J_ajaxForms" enctype="multipart/form-data">
				<div class="col-right">
					<div class="table_full">
						<table width="100%">
							<tbody>
								<tr>
									<td><b>缩略图</b></td>
								</tr>
								<tr>
									<td><div style="text-align: center;">
											<input name="smeta[thumb]" id="thumb" value="" type="hidden" />
											<a href="javascript:void(0);"
												onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','','','');return false;">
												<img src="statics/images/upload-pic.png" alt="f1"
												width="135" height="113" id="thumb_preview"
												style="cursor: hand" />
											</a>
											<!-- <input type="button" class="btn" onclick="crop_cut_thumb($('#thumb').val());return false;" value="裁减图片">  -->
											<input name="button" type="button" class="btn"
												onclick="$('#thumb_preview').attr('src','statics/images/upload-pic.png');$('#thumb').val('');return false;"
												value="取消图片" />
										</div></td>
								</tr>
								<tr>
									<td><b>发布时间</b></td>
								</tr>
								<tr>
									<td><input name="post[post_modified]" id="updatetime"
										value="2015-01-27 16:14:03" size="21"
										class="input length_3 J_datetime  date" type="text" /></td>
								</tr>
								<tr>
									<td><b>状态</b></td>
								</tr>
								<tr>
									<td><label> <input name="post[post_status]"
											value="1" checked="checked" type="radio" /> <span>审核通过</span></label>
										<label> <input name="post[post_status]" value="0"
											type="radio" /> <span>待审核</span></label></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div style="" class="col-auto">
					<div style="" class="table_full">
						<table style="" cellpadding="2" cellspacing="2" width="100%">
							<tbody style="">
								<tr>
									<th width="80">栏目</th>
									<td><select name="term[term_id]" class="normal_select">
											<option selected="selected" value="1">新闻中心</option>
											<option value="2">发现</option>
									</select></td>
								</tr>
								<tr>
									<th width="80">标题</th>
									<td><input style="width: 400px;" name="post[post_title]"
										id="title" required="" class="input input_hd J_title_color"
										placeholder="请输入标题"
										onkeyup="strlen_verify(this, 'title_len', 160)" type="text" />
										*</td>
								</tr>
								<tr>
									<th width="80">关键词</th>
									<td><input name="post[post_keywords]" id="keywords"
										style="width: 400px" class="input" placeholder="请输入关键字"
										type="text" /> 多关键词之间用空格隔开</td>
								</tr>
								<tr>
									<th width="80">摘要</th>
									<td><textarea name="post[post_excerpt]" id="description"
											required="" style="width: 98%; height: 50px;"
											placeholder="请填写摘要"></textarea></td>
								</tr>
								<tr style="">
									<th width="80">内容</th>
									<td style=""><script type="text/javascript"
											src="statics/ueditor/ueditor.config.js"></script> <script
											type="text/javascript"
											src="statics/ueditor/ueditor.all.min.js"></script> <script
											id="editor" type="text/plain"
											style="width: 1024px; height: 500px;"></script>
										<style type="text/css">
.content_attr {
	border: 1px solid #CCC;
	padding: 5px 8px;
	background: #FFC;
	margin-top: 6px
}
</style> <script type="text/javascript">
	//编辑器路径定义
	var ue = UE.getEditor('editor', {
		textarea : 'article_content',
		initialFrameHeight : 200
	});
</script></td>
								</tr>
								<tr>
									<th width="80">相册图集</th>
									<td><fieldset class="blue pad-10">
											<legend>图片列表</legend>
											<ul id="photos" class="picList">
											</ul>
										</fieldset>
										<div class="bk10"></div> <a href="javascript:void(0);"
										onclick="javascript:flashupload('albums_images', '图片上传','photos',change_images,'10,gif|jpg|jpeg|png|bmp,0','','','')"
										class="btn">选择图片 </a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="form-actions">
					<button class="btn btn_submit J_ajax_submit_btn" type="submit">提交</button>
					<a class="btn"
						href="http://demo.鼎峰P2P.com/admin_post/index.html">返回</a>
				</div>
				<textarea style="display: none;"
					id="ueditor_textarea_post[post_content]" name="post[post_content]"></textarea>
			</form>
		</div>
	</div>
	<div id="calroot" style="display: none; position: absolute;">
</body>
</html>
