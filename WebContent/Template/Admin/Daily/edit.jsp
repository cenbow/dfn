<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp" %>
<%@ include file="../Common/topHeader.jsp" %>
<body class="J_scroll_fixed">
<style type="text/css">
.tip span.condition_tip{ margin-left:20px; color:#F90; font-size:10px}
.thumbnails .albCt{ float:left; margin-left:10px; padding:5px; height:216px}
.thumbnails .albCt input{ width:80px}
.borrowtable.labelcks label{ margin-left:20px; padding:10px 0px; float:left}
.df_list_banner_wper{ height:45px;background: none;}
</style>
<script type="text/javascript">var mysn1=0;var mysn2=10000;</script>
	<div class="wrap J_check_wrap">

		<ul class="nav nav-tabs">
			<li><a href="${dfn:SU(_thisUrl_,'index')}">产品列表</a></li>
			<li class="active"><a href="#A" data-toggle="tab">基本信息</a></li>
			<li><a href="#C" data-toggle="tab">图片资料</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform" action="${dfn:U('admin/daily/doedit')}" method="post">
        <input type="hidden" name="id" value="${data.id}"/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div >产品信息(公共信息)</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">产品名称：</th>
										<td>${dfForm:input( "product_name", data['product_name'], dfForm_class, dfForm_style,dfForm_others)}</td>
									</tr>
									<tr>
                                        <th width="200" class="control-label">是否显示：</th>
                                        <td> ${dfForm:select( "is_show",showSelect, "1", dfForm_class, dfForm_style,dfForm_others)}</td>
                                    </tr>
                                    <tr>
                                        <th width="200" class="control-label">年化利率：</th>
                                        <td>${dfForm:input( "expect_interest_rate", data['expect_interest_rate'], dfForm_class, dfForm_style,dfForm_others)}%(会转换成天来计算)</td>
                                    </tr>
                                    <tr>
                                        <th width="200" class="control-label">产品总金额：</th>
                                        <td>${dfForm:input( "product_money", data['product_money'], dfForm_class, dfForm_style,dfForm_others)}元</td>
                                    </tr>
                                    <tr>
                                          <th width="200" class="control-label">起投金额：</th>
                                        <td>${dfForm:input( "invest_min", data['invest_min'], dfForm_class, dfForm_style,dfForm_others)}元</td>
                                    </tr>
                                    <tr>
                                          <th width="200" class="control-label">最短持有时间：</th>
                                        <td>${dfForm:input( "invest_min_duration", data['invest_min_duration'], dfForm_class, dfForm_style,dfForm_others)}天</td>
                                    </tr>
                                    <tr>
                                          <th width="200" class="control-label">递增金额：</th>
                                        <td>${dfForm:input( "step_money", data['step_money'], dfForm_class, dfForm_style,dfForm_others)}元(投资会员投资金额必须满足【投资金额-起投金额】=递增金额的整倍数)</td>
                                    </tr>
                                    <tr>
                                          <th width="200" class="control-label">项目结束日期：</th>
                                        <td><input class="input Wdate" 	style="width: 200px;" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="end_count_time" value="${dfn:date(data.end_count_time,'yyyy-MM-dd HH:mm:ss')}" /></td>
                                    </tr>
									<tr>
										<th width="200" class="control-label">项目说明：</th>
										<td>${dfForm:editor("product_detail",data['product_detail'],"")}</td>
									</tr>
								</table>
							</div>
						</div>


						<div class="tab-pane" id="C">
							<div  >图片资料</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">图片：</th>
										<td><div class="swfUploadBar clearfix">
												<span id="spanButtonPlaceholder"></span>
												<div id="divFileProgressContainer"></div>
											</div></td>
									</tr>
									<tr>
										<th width="200" class="control-label">图片类型：</th>
										<td><input type="radio" class=" _RADIO_" checked="checked" name="imgType" value="1" id="imgType_1"	title="请选择您所上传图片的分类"><label for="imgType_1" class="_RADIO_LABEL_CLASS_">项目证明</label>
                                        <input type="radio" class=" _RADIO_" checked="checked" name="imgType" value="2" id="imgType_2"	title="请选择您所上传图片的分类"><label for="imgType_2" class="_RADIO_LABEL_CLASS_">担保方资质证明</label></td>
									</tr>
									<tr>
										<th class="control-label">项目证明图片预览：</th>
										<td id="img_type_1">
											<div class="thumbnails">
				<c:if test="${not empty deJson.img_type_1 }">
					<c:forEach items="${deJson.img_type_1 }" var="swfImgList"  varStatus="foreach">
                      <div class="albCt" id="swfImgSn${foreach.index}">
                          <img width="120" height="120" src="${dfn:getThumbImgUrl(swfImgList['img'])}"><div style="margin-top:10px">注释：<input type="text" class="swfPicInfo" value="${swfImgList.info}" name="picinfo[${foreach.index}]"><input type="hidden" value="${swfImgList.img}" name="swfimglist[${foreach.index}]"></div><input type="hidden" class="swfUrlInfo" value="1" name="swfimgtype[${foreach.index}]"></br><a onClick="javascript:delPic('swfImgSn${foreach.index}')" href="javascript:;">[删除]</a><a onClick="javascript:leftPic('swfImgSn${foreach.index}')" href="javascript:;">[前移]</a><a onClick="javascript:rightPic('swfImgSn${foreach.index}')" href="javascript:;">[后移]</a>
                      </div>				
                      <c:if test="${foreach.last}"><script type="text/javascript">mysn1=${foreach.index};</script></c:if>
					</c:forEach>
				</c:if>
                                            </div>
                                            
										</td>
									</tr>
									<tr>
										<th class="control-label">担保方资质证明图片预览：</th>
										<td id="img_type_2">
											<div class="thumbnails">
				<c:if test="${not empty deJson.img_type_2 }">
					<c:forEach items="${deJson.img_type_2 }" var="swfImgList"  varStatus="foreach">
                      <div class="albCt" id="swfImgSn${foreach.index}">
                          <img width="120" height="120" src="${dfn:getThumbImgUrl(swfImgList['img'])}"><div style="margin-top:10px">注释：<input type="text" class="swfPicInfo" value="${swfImgList.info}" name="picinfo[${foreach.index}]"><input type="hidden" value="${swfImgList.img}" name="swfimglist[${foreach.index}]"></div><input type="hidden" class="swfUrlInfo" value="2" name="swfimgtype[${foreach.index}]"></br><a onClick="javascript:delPic('swfImgSn${foreach.index}')" href="javascript:;">[删除]</a><a onClick="javascript:leftPic('swfImgSn${foreach.index}')" href="javascript:;">[前移]</a><a onClick="javascript:rightPic('swfImgSn${foreach.index}')" href="javascript:;">[后移]</a>
                      </div>				
                      <c:if test="${foreach.last}"><script type="text/javascript">mysn2=${foreach.index+1000};</script></c:if>
					</c:forEach>
				</c:if>
                                            </div>
                                            
										</td>
									</tr>
								</table>
							</div>

						</div>




						<div class="form-actions">
							<button type="submit"
								class="btn btn-primary btn_submit  J_ajax_submit_btn">修改</button>
							&nbsp;&nbsp;<a class="btn" href="javascript:;"	onClick="window.history.back(-1);return false;">返回</a>
						</div>

					</div>
				</div>
			</fieldset>
		</form>
	</div>
<script type="text/javascript">
function _beforeGetValue(){
	$.each(_editorAll,function(k,v){
		v.sync();
	})
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
var mysn=0;
var _swfUploadSuccess=function(data){
	var imgType = $("input[name='imgType']:checked").val();
	if(data.status=="success"){
		if(imgType==1){
			mysn1++;
			mysn=mysn1;
		}else if(imgType==2){
			mysn2++;
			mysn=mysn2;
		}
		var addStr = '';
		var newImgDiv = document.createElement("div");
		var thisId = 'swfImgSn'+mysn;
		var imgName = data.oldName.split(".");
		newImgDiv.className = 'albCt';
		newImgDiv.id = thisId;
		$("#img_type_"+imgType).find('.thumbnails').get(0).appendChild(newImgDiv);
		var htmlImg = '<img src="'+GV.WEB_ROOT+getImgThumb(data.data)+'" width="120px" height="120px" /><input type="hidden" name="swfimglist['+mysn+']" value="'+data.data+'" /><input type="hidden" name="swfimgtype['+mysn+']" value="'+imgType+'" />';
		var htmlInfo = '<div style="margin-top:10px">说明：<input type="text" name="picinfo['+mysn+']" value="'+imgName[0]+'" class="swfPicInfo" /></div>';
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




	