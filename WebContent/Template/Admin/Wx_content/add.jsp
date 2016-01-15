<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/wx_content/index')}">微信内容管理</a></li>
			<li class="active"><a href="${dfn:U('admin/wx_content/add')}">添加微信内容
			</a></li>

		</ul>

		<form method="post" action="${dfn:U('admin/wx_content/doadd')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">


                <div class="table_full">
                  <table width="100%" class="table_form ">
                    <tr>
                      <th width="200">信息类型：</th>
                      <td>${dfForm:radio("msg_type",typeSelect,"news","","","onclick='showwx(this);'")}</td>
                    </tr>
                    <tr>
                      <th>标题：</th>
                      <td>${dfForm:input( "title", data['title'], dfForm_class, dfForm_style,dfForm_others)}</td>
                    </tr>
                    <tr>
                      <th>事件ID：</th>
                      <td>${dfForm:input( "event_key", data['event_key'], dfForm_class, dfForm_style,dfForm_others)}</td>
                    </tr>
                    <tr>
                      <th colspan="2"  style="text-align:left">微信内容：</th>
                     </tr>
                  </table>
                </div>
                <div class="table_full wxcontents" id="wx_text" style="display:none">
                  <table width="100%" class="table_form ">
                     <tr>
                      <td colspan="2"><textarea rows="5" cols="40" class="myarea" name="content" id="content"></textarea></td>
                    </tr>
                  </table>
                </div>
                <div class="table_full wxcontents" id="wx_news">
                  <table width="100%" class="table_form " id="area_list">
                   <tr><td colspan="1">上传图片：<div class="swfUploadBar clearfix"><span id="spanButtonPlaceholder"></span><div id="divFileProgressContainer"></div></div></td><td colspan="5">图片网址：<input type="text" id="urlimg" value="" class="input" onClick="this.select()" readonly></td></tr>
        
                      <tr>
                        <th class="line_l" align="left">序号</th>
                        <th class="line_l" align="left">标题</th>
                        <th class="line_l" align="left">描述</th>
                        <th class="line_l" align="left">图片地址</th>
                        <th class="line_l" align="left">网址</th>
                        <th class="line_l" align="left">操作</th>
                      </tr>
        	  <c:set var="countNum" value="0" />
              <c:if test="${not empty newlist}" > 
                  <c:forEach var ="news" items="${newlist}" varStatus="varStatusName">
                  <c:set var="countNum" value="${varStatusName.index}" />
                      <tr overstyle='on' id="list_news_${varStatusName.index}">
                        <td>{$countNum}</td>
                        <td><input type="text" style="width:200px" class="input" name="news[${countNum}][title]" value="${news.title}" /></td>
                        <td><input type="text" style="width:200px" class="input" name="news[${countNum}][des]" value="${news.des}" /></td>
                        <td><input type="text" style="width:200px" class="input" name="news[${countNum}][picurl]" value="${news.picurl}" /></td>
                        <td><input type="text" style="width:200px" class="input" name="news[${countNum}][url]" value="${news.url}" /></td>
                        <td>
                            <a href="javascript:void(0);" onClick="delx(${countNum});">删除</a>  
                        </td>
                      </tr>
                  </c:forEach>
                  </c:if>
                  </table>
                	<a class="btn" class="btn" style="margin-top:5px" onClick="addone();return false;">添加一个内容</a>
                </div>


			</div>


			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">保存</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
<script type="text/javascript">
var xss=parseInt("${countNum}")||0;
function addone(){
	xss++;
	var htmladd = '<tr overstyle="on" id="list_'+xss+'">';
		htmladd += '<td>'+xss+'</td>';
		htmladd += '<td><input type="text" class="input" style="width:200px" name="news['+xss+'][title]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:200px" name="news['+xss+'][des]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:200px" name="news['+xss+'][picurl]" value="" /></td>';
		htmladd += '<td><input type="text" class="input" style="width:200px" name="news['+xss+'][url]" value="" /></td>';
		htmladd += '<td><a href="javascript:void(0);" onclick="delx('+xss+');">删除</a></td>';
		htmladd += '</tr>';	
	$(htmladd).appendTo("#area_list");
}
function delx(id){
	if(confirm("删除后不可恢复，并且删除完要确定保存后才会生产，确定要删除吗?")) $("#list_"+id).remove();
}
</script>
<script type="text/javascript">
var _SWFbuttonConfig_={
		"text":'',
		"img":'${SiteStatics}/Swfupload/images/upload.png',
		"w":110,
		'h':36
	};
var _swfUploadUrl = "${dfn:SU(_thisUrl_,'swfupload')}";
var _swfFlashUrl = "${SiteStatics}/Swfupload/swfupload.swf";
var _swfSessionID = "<%String s = session.getId();%><%=s %>";
var _swfUploadSuccess=function(data){
	if(data.status=="success"){
		$("#urlimg").val(data.data);
	}
	else alert(data.info);
}
</script>
<script type="text/javascript" src="${SiteStatics}/Common/js/common.js"></script>
<script type="text/javascript" src="${SiteStatics}/Swfupload/handlers.js"></script>
<script type="text/javascript" src="${SiteStatics}/Swfupload/swfupload.js"></script>
<script type="text/javascript">
$(function(){
	initSWF();	
})
</script>

<script type="text/javascript">
function showwx(obj){
	var id = "wx_"+obj.value;
	$(".wxcontents").hide();
	$("#"+id).show();
}
</script>
	<%@ include file="../Common/footer.jsp"%>