<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css" rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">


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
<script type="text/javascript">//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
	
<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/iframeTools.js" type="text/javascript"></script>

<script src="${AdminStatics}/js/datePicker/datePicker.js" type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">
</head>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">会员列表</a></li>
	</ul>
	<div class="wrap J_check_wrap">
		<form class="well form-search" method="post"
			action="/admin_post/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">分类： <select class="select_2" name="term">
							<option selected="selected" value="0">全部</option>
							<option value="1">新闻中心</option>
							<option value="2">发现</option>
					</select> &nbsp;&nbsp;时间： <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" autocomplete="off" type="text"> <!-- 
        <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
						&nbsp; &nbsp;关键字： <input class="input length_2" name="keyword"
						style="width: 200px;" placeholder="请输入关键字..." type="text"> <input
						class="btn" value="搜索" type="submit">
					</span>
				</div>
			</div>
		</form>
		<form class="J_ajaxForm" action="" method="post">
			<div class="table_list">
				<table class="table table-hover" width="100%">
					<thead>
						<tr>
							<th width="16"><label><input class="J_check_all"
									data-direction="x" data-checklist="J_check_x" type="checkbox"></label></th>
							<th width="50">排序</th>
							<th>ID</th>
							<th>标题</th>
							<th width="45">点击量</th>
							<th width="50">摘要</th>
							<th width="50">缩略图</th>
							<th width="80">发布人</th>
							<th width="120"><span>发布时间</span></th>
							<th width="45">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="J_check" data-yid="J_check_y" data-xid="J_check_x" name="ids[]" value="93" type="checkbox"></td>
							<td><input name="listorders[93]" class="input input-order" size="3" value="0" type="text"></td>
							<td><a>93</a></td>
							<td>
								<a href="http://demo.鼎峰P2P.com/portal/article/index/id/93.html" target="_blank"> 
								<span>家居O2O适应未来应用场景的几种模式</span>
								</a>
							</td>
							<td>1114</td>
							<td>已填写</td>
							<td>
								<a href="#" target="_blank">查看</a>
							</td>
							<td>admin</td>
							<td>2014-10-17 21:20:13</td>
							<td>已审核<br>未置顶<br>未推荐
							</td>
							<td>
								<a href="javascript:open_iframe_dialog('/comment/commentadmin/index/post_id/4.html','%E8%AF%84%E8%AE%BA%E5%88%97%E8%A1%A8')">查看评论</a>
								| <a href="http://demo.鼎峰P2P.com/admin_post/edit/id/4.html">修改</a>|
								<a href="http://demo.鼎峰P2P.com/admin_post/delete/tid/93.html" class="J_ajax_del">删除</a>
							</td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y" data-xid="J_check_x" name="ids[]" value="92" type="checkbox"></td>
							<td><input name="listorders[92]" class="input input-order" size="3" value="0" type="text"></td>
							<td><a>92</a></td>
							<td><a
								href="http://demo.鼎峰P2P.com/portal/article/index/id/92.html"
								target="_blank"> <span>来认识下谷歌领投5.42亿美元的这家视觉技术初创公司——Magic Leap</span>
							</a></td>
							<td>1454</td>
							<td>已填写</td>
							<td><a
								href="http://demo.鼎峰P2P.com/data/upload/ueditor/201410220859575447018d43d8f.jpg"
								target="_blank">查看</a></td>
							<td>admin</td>
							<td>2014-10-17 21:15:36</td>
							<td>已审核<br>未置顶<br>未推荐
							</td>
							<td><a
								href="javascript:open_iframe_dialog('/comment/commentadmin/index/post_id/3.html','%E8%AF%84%E8%AE%BA%E5%88%97%E8%A1%A8')">查看评论</a>
								| <a href="http://demo.鼎峰P2P.com/admin_post/edit/id/3.html">修改</a>|
								<a href="http://demo.鼎峰P2P.com/admin_post/delete/tid/92.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y" data-xid="J_check_x" name="ids[]" value="91" type="checkbox"></td>
							<td><input name="listorders[91]" class="input input-order" size="3" value="0" type="text"></td>
							<td><a>91</a></td>
							<td>
								<a href="http://demo.鼎峰P2P.com/portal/article/index/id/91.html" target="_blank"> 
								<span>为什么大数据在预测《黄金时代》票房时不灵了？</span>
								</a>
							</td>
							<td>315</td>
							<td>已填写</td>
							<td></td>
							<td>admin</td>
							<td>2014-09-16 23:32:39</td>
							<td>已审核<br>未置顶<br>未推荐
							</td>
							<td>
								<a href="javascript:open_iframe_dialog('/comment/commentadmin/index/post_id/1.html','%E8%AF%84%E8%AE%BA%E5%88%97%E8%A1%A8')">查看评论</a>
								| <a href="http://demo.鼎峰P2P.com/admin_post/edit/id/1.html">修改</a>|
								<a href="http://demo.鼎峰P2P.com/admin_post/delete/tid/91.html" class="J_ajax_del">删除</a></td>
						</tr>
					</tbody>
				</table>
				<div class="pagination"></div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					class="J_check_all" data-direction="y" data-checklist="J_check_y"
					id="check_all" type="checkbox">全选</label>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/listorders.html">排序</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/check/check/1.html" data-subcheck="true">审核</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/check/uncheck/1.html" data-subcheck="true">取消审核</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/top/top/1.html" data-subcheck="true">置顶</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/top/untop/1.html" data-subcheck="true">取消置顶</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/recommend/recommend/1.html"
					data-subcheck="true">推荐</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/recommend/unrecommend/1.html"
					data-subcheck="true">取消推荐</button>
				<button class="btn btn-primary J_ajax_submit_btn" type="submit"
					data-action="/admin_post/delete.html" data-subcheck="true"
					data-msg="你确定删除吗？">删除</button>
				<button class="btn btn-primary" type="button" id="J_Content_remove">批量移动</button>
			</div>
		</form>
	</div>

	<div style="display:none;" class="wrap J_check_wrap">
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
								<td>
									<div style="text-align: center;">
										<input name="smeta[thumb]" id="thumb" value="" type="hidden">
										<a href="javascript:void(0);"
											onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','','','');return false;">
											<img src="statics/images/upload-pic.png" id="thumb_preview"
											style="cursor: hand" height="113" width="135">
										</a>
										<!-- <input type="button" class="btn" onclick="crop_cut_thumb($('#thumb').val());return false;" value="裁减图片">  -->
										<input class="btn"
											onclick="$('#thumb_preview').attr('src','statics/images/upload-pic.png');$('#thumb').val('');return false;"
											value="取消图片" type="button">
									</div>
								</td>
							</tr>
							<tr>
								<td><b>发布时间</b></td>
							</tr>
							<tr>
								<td><input name="post[post_modified]" id="updatetime"
									value="2015-01-27 16:14:03" size="21"
									class="input length_3 J_datetime  date" type="text"></td>
							</tr>
							<tr>
								<td><b>状态</b></td>
							</tr>
							<tr>
								<td><span class="switch_list cc"> <label><input
											name="post[post_status]" value="1" checked="checked"
											type="radio"><span>审核通过</span></label> <label><input
											name="post[post_status]" value="0" type="radio"><span>待审核</span></label>
								</span></td>
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
									onkeyup="strlen_verify(this, 'title_len', 160)" type="text"> <span
									class="must_red">*</span></td>
							</tr>
							<tr>
								<th width="80">关键词</th>
								<td><input name="post[post_keywords]" id="keywords"
									style="width: 400px" class="input" placeholder="请输入关键字"
									type="text"> 多关键词之间用空格隔开</td>
							</tr>
							<tr>
								<th width="80">摘要</th>
								<td><textarea name="post[post_excerpt]" id="description"
										required="" style="width: 98%; height: 50px;"
										placeholder="请填写摘要"></textarea></td>
							</tr>
							<tr style="">
								<th width="80">内容</th>
								<td style="">
								<script type="text/javascript"  src="statics/ueditor/ueditor.config.js"></script>
								<script type="text/javascript"  src="statics/ueditor/ueditor.all.min.js"></script>
								<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
								<style type="text/css">
								.content_attr {
									border: 1px solid #CCC;
									padding: 5px 8px;
									background: #FFC;
									margin-top: 6px
								}
								</style>
								<script type="text/javascript">
								//编辑器路径定义
								var ue = UE.getEditor('editor',{
									textarea:'article_content',
									initialFrameHeight:200
								});
								</script>
								</td>
							</tr>
							<tr>
								<th width="80">相册图集</th>
								<td>
									<fieldset class="blue pad-10">
										<legend>图片列表</legend>
										<ul id="photos" class="picList"></ul>
									</fieldset>
									<div class="bk10"></div> <a href="javascript:void(0);"
									onclick="javascript:flashupload('albums_images', '图片上传','photos',change_images,'10,gif|jpg|jpeg|png|bmp,0','','','')"
									class="btn">选择图片 </a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="form-actions">
				<button class="btn btn_submit J_ajax_submit_btn" type="submit">提交</button>
				<a class="btn" href="http://demo.鼎峰P2P.com/admin_post/index.html">返回</a>
			</div>
			<textarea style="display: none;"
				id="ueditor_textarea_post[post_content]" name="post[post_content]"></textarea>
		</form>
	</div>	
</div>
<script src="${AdminStatics}/js/common.js"></script>
<script type="text/javascript" src="${AdminStatics}/js/content_addtop.js"></script>
<script>
$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});

function refersh_window() {
	var refersh_time = getCookie('refersh_time');
	if (refersh_time == 1) {
		window.location="/admin_post/index.html";
	}
}
setInterval(function(){
	refersh_window();
}, 2000);

$(function () {
	setCookie("refersh_time",0);
    Wind.use('ajaxForm','artDialog','iframeTools', function () {
        //批量移动
        $('#J_Content_remove').click(function (e) {
            var str = 0;
            var id = tag = '';
            $("input[name='ids[]']").each(function () {
                if ($(this).attr('checked')) {
                    str = 1;
                    id += tag + $(this).val();
                    tag = ',';
                }
            });
            if (str == 0) {
				art.dialog.through({
					id:'error',
					icon: 'error',
					content: '您没有勾选信息，无法进行操作！',
					cancelVal: '关闭',
					cancel: true
				});
                return false;
            }
            var $this = $(this);
            art.dialog.open("/index.php?g=portal&m=AdminPost&a=move&ids=" + id, {
                title: "批量移动",
                width:"80%"
            });
        });
    });
});

//setInterval(function(){public_lock_renewal();}, 10000);
	$(".J_ajax_close_btn").on('click', function (e) {
	    e.preventDefault();
	    Wind.use("artDialog", function () {
	        art.dialog({
	            id: "question",
	            icon: "question",
	            fixed: true,
	            lock: true,
	            background: "#CCCCCC",
	            opacity: 0,
	            content: "您确定需要关闭当前页面嘛？",
	            ok:function(){
					setCookie("refersh_time",1);
					window.close();
					return true;
				}
	        });
	    });
	});

/*	
	/////---------------------
	 Wind.use('validate', 'ajaxForm', 'artDialog', function () {
			//javascript
	        
	            //编辑器
	            editorcontent = new baidu.editor.ui.Editor();
	            editorcontent.render( 'content' );
	            try{editorcontent.sync();}catch(err){};
	            //增加编辑器验证规则
	            jQuery.validator.addMethod('editorcontent',function(){
	                try{editorcontent.sync();}catch(err){};
	                return editorcontent.hasContents();
	            });
	            var form = $('form.J_ajaxForms');
	        //ie处理placeholder提交问题
	        if ($.browser.msie) {
	            form.find('[placeholder]').each(function () {
	                var input = $(this);
	                if (input.val() == input.attr('placeholder')) {
	                    input.val('');
	                }
	            });
	        }
	        //表单验证开始
	        form.validate({
				//是否在获取焦点时验证
				onfocusout:false,
				//是否在敲击键盘时验证
				onkeyup:false,
				//当鼠标掉级时验证
				onclick: false,
	            //验证错误
	            showErrors: function (errorMap, errorArr) {
					//errorMap {'name':'错误信息'}
					//errorArr [{'message':'错误信息',element:({})}]
					try{
						$(errorArr[0].element).focus();
						art.dialog({
							id:'error',
							icon: 'error',
							lock: true,
							fixed: true,
							background:"#CCCCCC",
							opacity:0,
							content: errorArr[0].message,
							cancelVal: '确定',
							cancel: function(){
								$(errorArr[0].element).focus();
							}
						});
					}catch(err){
					}
	            },
	            //验证规则
	            rules: {'post[post_title]':{required:1},'post[post_content]':{editorcontent:true}},
	            //验证未通过提示消息
	            messages: {'post[post_title]':{required:'请输入标题'},'post[post_content]':{editorcontent:'内容不能为空'}},
	            //给未通过验证的元素加效果,闪烁等
	            highlight: false,
	            //是否在获取焦点时验证
	            onfocusout: false,
	            //验证通过，提交表单
	            submitHandler: function (forms) {
	                $(forms).ajaxSubmit({
	                    url: form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
	                    dataType: 'json',
	                    beforeSubmit: function (arr, $form, options) {
	                        
	                    },
	                    success: function (data, statusText, xhr, $form) {
	                        if(data.status){
								setCookie("refersh_time",1);
								//添加成功
								Wind.use("artDialog", function () {
								    art.dialog({
								        id: "succeed",
								        icon: "succeed",
								        fixed: true,
								        lock: true,
								        background: "#CCCCCC",
								        opacity: 0,
								        content: data.info,
										button:[
											{
												name: '继续添加？',
												callback:function(){
													reloadPage(window);
													return true;
												},
												focus: true
											},{
												name: '返回列表页',
												callback:function(){
													location='/admin_post/index.html';
													return true;
												}
											}
										]
								    });
								});
							}else{
								isalert(data.info);
							}
	                    }
	                });
	            }
	        });
	    });
	////-------------------------
});
*/
</script>
	<div id="calroot" style="display: none; position: absolute;">
		<div id="calhead">
			<a id="calprev"></a>
			<div id="caltitle">
				<select id="calmonth"></select><select id="calyear"></select>
			</div>
			<a id="calnext"></a>
		</div>
		<div id="calbody">
			<div id="caldays">
				<span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
			</div>
			<div id="calweeks"></div>
			<div class="caltime">
				<button type="button" class="btn btn_submit fr" name="submit">确认</button>
				<input id="calHour" class="input" min="0" max="23" size="2"
					value="0" type="number"><span>点</span><input id="calMin"
					class="input" size="2" min="1" max="59" value="0" type="number"><span>分</span>
			</div>
		</div>
	</div>
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: none repeat scroll 0% 0% rgb(255, 255, 255);"></div>
</body>
</html>