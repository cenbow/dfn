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
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet" type="text/css">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css" rel="stylesheet" type="text/css">
<link href="${AdminStatics}/js/artDialog/skins/default.css" rel="stylesheet" type="text/css">
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<script type="text/javascript">    
var catid = "12";
</script>
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
<!--[if IE 7]> <link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
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
<script src="${AdminStatics}/js/artDialog/artDialog.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/iframeTools.js" type="text/javascript"></script>

<script src="${AdminStatics}/js/datePicker/datePicker.js" type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet" type="text/css">
</head>
<body class="J_scroll_fixed">
<div class="wrap jj">
	<ul class="nav nav-tabs">
			<li class="active"><a href="#">所有页面</a></li>
			<li><a href="#">添加页面</a></li>
	</ul>
	
	<div class="wrap J_check_wrap">
		<form class="well form-search" method="post"
			action="/admin_page/index.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">时间： <input name="start_time"
						class="input length_2 J_date date" style="width: 80px;"
						autocomplete="off" type="text">-<input autocomplete="off"
						class="input length_2 J_date date" name="end_time"
						style="width: 80px;" type="text"> <!-- 
        <select class="select_2" name="posids"style="width:70px;"> <option value='' selected>全部</option> </select> <select class="select_2" name="searchtype" style="width:70px;"> <option value='0' >标题</option> </select>         -->
						关键字： <injput class="input length_2" name="keyword"
						style="width: 200px;" placeholder="请输入关键字..." type="text">
						<button class="btn">搜索</button>
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
							<th width="100">ID</th>
							<th>标题</th>
							<!-- <th>点击量</th> -->
							<th width="80">发布人</th>
							<th width="120"><span>发布时间</span></th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="2" type="checkbox"></td>
							<td><a>2</a></td>
							<td><a
								href="http://demo.鼎峰P2P.com/portal/page/index/id/2.html"
								target="_blank"><span>联系我们</span></a></td>
							<!--  <td>0</td> -->
							<td>admin</td>
							<td>2014-10-13 11:22:24</td>
							<td><a
								href="http://demo.鼎峰P2P.com/admin_page/edit/id/2.html"
								target="_blank">修改</a>| <a
								href="http://demo.鼎峰P2P.com/admin_page/delete/id/2.html"
								class="J_ajax_del">删除</a></td>
						</tr>
						<tr>
							<td><input class="J_check" data-yid="J_check_y"
								data-xid="J_check_x" name="ids[]" value="14" type="checkbox"></td>
							<td><a>14</a></td>
							<td><a
								href="http://demo.鼎峰P2P.com/portal/page/index/id/14.html"
								target="_blank"><span>关于我们</span></a></td>
							<!--  <td>0</td> -->
							<td>admin</td>
							<td>2014-10-20 07:07:24</td>
							<td><a
								href="http://demo.鼎峰P2P.com/admin_page/edit/id/14.html"
								target="_blank">修改</a>| <a
								href="http://demo.鼎峰P2P.com/admin_page/delete/id/14.html"
								class="J_ajax_del">删除</a></td>
						</tr>
					</tbody>
				</table>
				<div class="pagination"></div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					class="J_check_all" data-direction="y" data-checklist="J_check_y"
					id="check_all" type="checkbox">全选</label>
				<button class="btn J_ajax_submit_btn btn-primary" type="submit"
					data-action="/admin_page/delete.html" data-subcheck="true">删除</button>
			</div>
		</form>
	</div>
	
	<div style="display:none;" class="wrap J_check_wrap">
		<form style="" name="myform" id="myform" action="/admin_page/add_post.html" method="post" class="form-horizontal J_ajaxForms" enctype="multipart/form-data">
			<input name="post[post_type]" value="2" type="hidden">
			<div class="col-right">
				<div class="table_full">
					<table cellpadding="2" cellspacing="2" width="100%">
						<tbody>
							<tr>
								<td><b>缩略图</b></td>
							</tr>
							<tr>
								<td>
									<div style="text-align: center;">
										<input name="smeta[thumb]" id="thumb" value="" type="hidden">
										<a href="javascript:void(0);" onclick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,1,,,1','','','');return false;">
											<img src="statics/images/icon/upload-pic.png" id="thumb_preview" style="cursor: hand" height="113" width="135">
										</a>
										<!-- <input type="button" class="btn" onclick="crop_cut_thumb($('#thumb').val());return false;" value="裁减图片"> -->
										<input class="btn" onclick="$('#thumb_preview').attr('src','/statics/images/icon/upload-pic.png');$('#thumb').val('');return false;" value="取消图片" type="button">
									</div>
								</td>
							</tr>
							<tr>
								<td><b>发布时间</b></td>
							</tr>
							<tr>
								<td><input name="post[post_modified]" id="updatetime" value="2015-01-27 16:38:31" size="21" class="input length_3 J_datetime  date" type="text"></td>
							</tr>
							<tr>
								<td><b>状态</b></td>
							</tr>
							<tr>
								<td>
									<span class="switch_list cc"> 
									<label><input name="post[post_status]" value="1" checked="checked" type="radio"><span>审核通过</span></label> 
									<label><input name="post[post_status]" value="0" type="radio"><span>待审核</span></label>
									</span>
								</td>
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
								<th width="80">标题</th>
								<td>
									<input style="width: 400px;" name="post[post_title]" id="title" class="input input_hd J_title_color" placeholder="请输入标题" onkeyup="strlen_verify(this, 'title_len', 160)" type="text"> 
									<span class="must_red">*</span>
								</td>
							</tr>
							<tr>
								<th width="80">模版</th>
								<td><select style="min-width: 290px;" name="smeta[template]">
										<option selected="selected" value="page">page.html</option>
										<option value="article">article.html</option>
										<option value="contact">contact.html</option>
										<option value="index">index.html</option>
										<option value="list">list.html</option>
										<option value="list_masonry">list_masonry.html</option>
										<option value="search">search.html</option>
								</select></td>
							</tr>
							<tr>
								<th width="80">关键词</th>
								<td><input name="post[post_keywords]" id="keywords" style="width: 280px" class="input" placeholder="请输入关键字" type="text"> 
									多关键词之间用空格隔开
								</td>
							</tr>
							<tr>
								<th width="80">摘要</th>
								<td><textarea name="post[post_excerpt]" id="description" style="width: 98%; height: 100px;"></textarea></td>
							</tr>
							<tr style="">
								<th width="80">内容</th>
								<td>
									<script type="text/javascript"  src="statics/ueditor/ueditor.config.js"></script>
					                <script type="text/javascript"  src="statics/ueditor/ueditor.all.min.js"></script>
									<span class="must_red">*</span><div id='content_tip'></div>
									<script type="text/plain" id="content" name="post[post_content]"></script>
					                <script type="text/javascript">
						                var width=$("#description").width();
						                var ue = UE.getEditor('content',{
						                	textarea:'article_content',
						                	initialFrameHeight:300,
						                	initialFrameWidth:900
						                });
					                </script> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="form-actions">
				<button class="btn btn_submit J_ajax_submit_btn" type="submit">提交</button>
				<a class="btn" href="#">返回</a>
			</div>
		</form>
	</div>
	
</div>
<script type="text/javascript" src="statics/js/common.js"></script>
<script type="text/javascript" src="statics/js/content_addtop.js"></script>
<script>
setCookie('refersh_time', 0);
function refersh_window() {
	var refersh_time = getCookie('refersh_time');
	if (refersh_time == 1) {
		window.location.reload();
	}
}
setInterval(function() {
	refersh_window()
}, 2000);

$(".nav-tabs li").click(function(){
	var index=$(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	$(".J_check_wrap").eq(index).show().siblings(".J_check_wrap").hide();
});


$(function () {
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
												name: '返回列表',
												callback:function(){
													location.href="{:U('AdminPage/index')}";
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
</body>
</html>