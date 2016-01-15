<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../Common/topHeader.jsp" />
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">广告管理</a></li>
			<li><a href="#">添加广告</a></li>
		</ul>
		<div class="common-form">
			<form method="post" class="J_ajaxForm"
				action="/admin/term/listorders.html">
				<div class="table_list">
					<table class="table table-hover" width="100%">
						<thead>
							<tr>
								
            <td align='center' width="50">ID</td>
            <td align='left' width="200">广告位置</td>
            <td align="center">开始时间</td>
            <td align="center">结束时间</td>
            <td align='center'>添加时间</td>
            <td align='center'>广告类型</td>
            <td align='center'>操作</td>

							</tr>
						</thead>
						<tbody>
        <tr id="list_50">
            <td align='center'>50</td>
            <td align='left' title="底部">底部</td>
            <td align='center'>2015-02-05</td>
            <td align='center'>2015-02-05</td>
            <td align='center'>2015-02-05 15:31:02</td>
            <td align="center">普通广告</td>
            <td align='center'><a href="/newadmin-Ad-edit?id=50">修改</a> | <a href="/newadmin-Ad-delete?id=50" class="J_ajax_del">删除</a></td>
          </tr>
						</tr>
					</table>
					<div class="btn_wrap">
						<div class="btn_wrap_pd">
							<button class="btn btn_submit mr10 J_ajax_submit_btn"
								type="submit">排序</button>
							&nbsp;&nbsp;<a href="javascript:;"
								onclick="window.history.back(-1);return false;">返回</a>
						</div>
					</div>
			  </div>
			</form>
		</div>

			<div style="display: none;" class="common-form">
			<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
				action="/newadmin-Article-doadd" method="post">
				<div class="tab-content">
					<div class="h_a">添加广告</div>
        <div class="table_full">
          <table width="100%" class="table_form ">
            <tr>
              <th width="200">广告类型：</th>
              <td><input type="radio" checked="checked" name="ad_type" value="0" id="ad_type_1" ><label for="ad_type_1">普通广告</label><input type="radio" name="ad_type" value="1" id="ad_type_2" ><label for="ad_type_2">多图广告</label></select></td>
            </tr>
            <tr>
              <th>开始时间：</th>
              <td><input type="text" name="start_time" id="start_time" value="" readonly="readonly" class="Wdate timeInput_Day" onFocus="WdatePicker({maxDate:'#F{ $dp.$D(\'end_time\')||\'2020-10-01\'}'})"/></td>
            </tr>
            <tr>
              <th>结束时间：</th>
              <td><input type="text" name="end_time" id="end_time" value="" readonly="readonly" class="Wdate timeInput_Day" onFocus="WdatePicker({maxDate:'2020-10-01',minDate:'#F{ $dp.$D(\'start_time\')}'})"/></td>
            </tr>
            <tr>
              <th width="200">广告位置：</th>
              <td><input style="width:400px" type="text" class="input" name="title" id="title" value=""/></td>
            </tr>
            <tr>
              <th>是否去除P标签：</th>
              <td><input type="radio" class="" checked="checked" name="remove_p" value="0" id="remove_p_1" ><label for="remove_p_1">是</label><input type="radio" name="remove_p" value="1" id="remove_p_2" ><label for="remove_p_2">否</label></select></td>
            </tr>
            <tr>
              <th colspan="2">广告内容：</th>
            </tr>
             <tr>
              <td colspan="2"><script type="text/javascript">window.UEDITOR_HOME_URL = "http://www.ggmoney.com/statics/editer/uedit/";window.UEDITOR_FILE_URL="/index.php?appg=Newadmin&appm=Ueditor&appa=";var _editorAll=[];</script>
 
					<script type="text/javascript" charset="utf-8" src="${AdminStatics}/js/ueditor/ueditor.config.js"></script>
 
					<script type="text/javascript" charset="utf-8" src="${AdminStatics}/js/ueditor/ueditor.all.min.js"></script><textarea name="content" id="content"></textarea>
 
					
 
					<script type="text/javascript">var _editor = UE.getEditor("content");_editorAll.push(_editor);</script></td>
            </tr>
          </table>
        </div>
      </div>
 
 
                <div class="btn_wrap">
<div class="btn_wrap_pd">             
  <button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">添加</button>&nbsp;&nbsp;<a href="javascript:;" onclick="window.history.back(-1);return false;">返回</a></div>
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
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
}
function _afterSuccess(data){
	  var catId = $("#cat_id").val();
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
						  window.location.href = "/newadmin-Ad-add";
						  return true;
					  },
					  focus: true
				  },{
					  name: '返回广告列表页',
					  callback:function(){
						  window.location.href = "/newadmin-Ad-index";
						  return true;
					  },
				  }
			  ]
		  });
	  });
}
</script>


	<script type="text/javascript"
		src="${AdminStatics}/js/content_addtop.js"></script>
	<script src="${AdminStatics}/js/common.js?v"></script>
</body>
</html>