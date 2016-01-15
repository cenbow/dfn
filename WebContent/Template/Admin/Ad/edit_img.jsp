<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
<style type="text/css">
.tip span.condition_tip{ margin-left:20px; color:#F90; font-size:10px}
.thumbnails .albCt{ float:left; margin-left:10px; padding:5px; height:216px}
.thumbnails .albCt input{ width:80px}
.borrowtable.labelcks label{ margin-left:20px; padding:10px 0px; float:left}
.df_list_banner_wper{ height:45px;background: none;}
</style>
<script type="text/javascript">var mysn=0;</script>
	<div class="wrap jj">
	
		<ul class="nav nav-tabs">
			<li ><a href="${dfn:U('admin/ad/index')}">广告管理</a></li>
		<li class="active"><a href="${dfn:U('admin/ad/add_menu')}">添加广告 </a></li>


		</ul>
		<ul class="nav nav-tabs">
			<li class="actinve">修改广告</li>
		
		</ul>
		<form method="post" action="${dfn:U('admin/ad/editAd')}" class="form-horizontal J_ajaxForm"><input	type="hidden" name="id" value="${data.id }" />
			<div class="common-form cwh">
          <table width="100%" class="table_form ">
            <tr>
              <th class="control-label">广告类型：</th>
              <td>${dfForm:radio("ad_type",adType,"2","","","")} </td>
            </tr>
            <tr>
                <th width="200" height="40px" class="control-label">开始时间：</th>
                <td><input class="input Wdate" style="width: 100px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" type="text"	name="start_time" value="${data.start_time}" /> 
                </td>

            </tr>

            <tr>
                <th class="control-label">结束时间：</th>
                <td><input class="input Wdate" 	style="width: 100px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" name="end_time" value="${data.end_time}" />

                </td>
            </tr>
            <tr>
              <th class="control-label">广告位置：</th>
              <td>${dfForm:input( "title", data['title'], dfForm_class, dfForm_style,dfForm_others)}</td>
            </tr>
            <tr>
              <th class="control-label">广告内容：</th>
              <td><div class="swfUploadBar clearfix"><span id="spanButtonPlaceholder"></span><div id="divFileProgressContainer"></div></div></td>
             </tr>
             <tr>
              <th class="control-label">图片预览：</th>
              <td>
                  <div id="thumbnails" class="thumbnails">
				<c:if test="${not empty imgs }">
					<c:forEach items="${imgs }" var="swfImgList"  varStatus="foreach">
                      <div class="albCt" id="swfImgSn${foreach.index}">
                          <img width="120" height="120" src="${dfn:getThumbImgUrl(swfImgList['img'])}"><div style="margin-top:10px">注释：<input type="text" class="swfPicInfo" value="${swfImgList.info}" name="picinfo[${foreach.index}]"><input type="hidden" value="${swfImgList.img}" name="swfimglist[${foreach.index}]"></div><div style="margin-top:10px">网址：<input type="text" class="swfPicInfo" value="${swfImgList.url}" name="picurl[${foreach.index}]"></div><a onClick="javascript:delPic('swfImgSn${foreach.index}')" href="javascript:;">[删除]</a><a onClick="javascript:leftPic('swfImgSn${foreach.index}')" href="javascript:;">[前移]</a><a onClick="javascript:rightPic('swfImgSn${foreach.index}')" href="javascript:;">[后移]</a>
                      </div>				
                      <c:if test="${foreach.last}"><script type="text/javascript">mysn=${foreach.index};</script></c:if>
					</c:forEach>
				</c:if>
                  </div>
                </td>
            </tr>
          </table>
			</div>

							
							 
			<div class="form-actions">
				<button type="submit"
					class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
				&nbsp;&nbsp;<a class="btn" id="J_dialog_close" href="javascript:;">关闭</a>
			</div>


		</form>


	</div>
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
		mysn++;
		var addStr = '';
		var newImgDiv = document.createElement("div");
		var thisId = 'swfImgSn'+mysn;
		var imgName = data.oldName.split(".");
		newImgDiv.className = 'albCt';
		newImgDiv.id = thisId;
		$("#thumbnails").get(0).appendChild(newImgDiv);
		var htmlImg = '<img src="'+GV.WEB_ROOT+getImgThumb(data.data)+'" width="120px" height="120px" /><input type="hidden" name="swfimglist['+mysn+']" value="'+data.data+'" />';
		var htmlInfo = '<div style="margin-top:10px">说明：<input type="text" name="picinfo['+mysn+']" value="'+imgName[0]+'" class="swfPicInfo" /></div>';
			htmlInfo+='<div style="margin-top:10px">网址：<input type="text" name="picurl['+mysn+']" value="" class="swfPicInfo" /></div>';
		var htmlBar = '<a href="javascript:;" onclick="javascript:delPic(\''+thisId+'\')">[删除]</a><a href="javascript:;" onclick="javascript:leftPic(\''+thisId+'\')">[前移]</a><a href="javascript:;" onclick="javascript:rightPic(\''+thisId+'\')">[后移]</a>';
		newImgDiv.innerHTML = htmlImg;
		newImgDiv.innerHTML += htmlInfo;
		newImgDiv.innerHTML += addStr;
		newImgDiv.innerHTML += htmlBar;
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
	<%@ include file="../Common/footer.jsp"%>