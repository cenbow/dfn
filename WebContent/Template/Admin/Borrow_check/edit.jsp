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
			<li class="active"><a href="#A" data-toggle="tab">标的信息</a></li>
			<li><a href="#B" data-toggle="tab">审核信息</a></li>
			<li><a href="#C" data-toggle="tab">图片资料</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform" action="${dfn:U('admin/borrow_check/do_edit')}" method="post">
        <input type="hidden" name="id" value="${data.id}"/>
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div >借款信息(公共信息,流转标和普通标都填这里)</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">标的ID：</th>
										<td>${data.id}</td>
									</tr>
									<tr>
									<th width="200" class="control-label">借款标题：</th>
									<td>${dfForm:input( "borrow_name", data['borrow_name'], dfForm_class, dfForm_style,dfForm_others)}</td>
								</tr>
								<tr>
									<th width="200" class="control-label">居间服务费率：</th>
									<td>${dfForm:input( "vouch_fee", data['vouch_fee'], dfForm_class, dfForm_style,dfForm_others)}%</td>
								</tr>
								<tr>
								<th width="200" class="control-label">可使用卡券：</th>
								<td> ${dfForm:select( "xtype",xtypeSelect, "0", dfForm_class, dfForm_style,dfForm_others)}</td>
							</tr>
                                    <tr>
                                      <th width="200" class="control-label">还款方式：</th>
                                      <td>${repaymentType[data['repayment_type']]}</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">借款标类型：</th>
                                      <td>${borrowType[data['borrow_type']]}</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">借款用途：</th>
                                      <td>${borrow_use[data['borrow_use']]}</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">年化利率：</th>
                                      <td>${data.borrow_interest_rate}%</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">借款期限：</th>
                                      <td>${data.borrow_duration}<c:choose><c:when test="${data.repayment_type == 4}">天</c:when><c:otherwise>个月</c:otherwise></c:choose></td>
                                    </tr>
									<tr>
										<th width="200" class="control-label">借款说明：</th>
										<td>${dfForm:editor("borrow_info",data['borrow_info'],"")}</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="tab-pane" id="B">
							<div >审核信息</div>
							<div class="table_full">
                                  <table width="100%" class="table_form ">
                                    <tr>
                                      <th width="200" class="control-label">是否允许自动投标：</th>
                                      <td>${dfForm:radio("can_auto",canAuto,"0","","","")}</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">合同ID：</th>
                                      <td>${dfForm:input( "investor_contract_id", "", dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">对应的文章ID</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">定向密码：</th>
                                      <td>${dfForm:input( "borrow_pass", "", dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">不修改则留空</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">借款金额：</th>
                                      <td>${dfForm:input( "borrow_money", data['borrow_money'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">不修改则留空</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">借款管理费：</th>
                                      <td>${dfForm:input( "borrow_fee", data['borrow_fee'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">当前值为按后台设置计算出来的，如果线下有协议或者算法有变动可自行修改</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">募集截止时间：</th>
                                      <td><input class="input Wdate" style="width: 200px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"	name="collect_time" value="${data.collect_time}" />在前台展示天数，如在担心在设定时间内不能募集完成，可修改延长</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">最多投标总额：</th>
                                      <td>${dfForm:input( "borrow_max", data['borrow_max'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">单人最多投标金额</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">最低投标金额：</th>
                                      <td>${dfForm:input( "borrow_min", data['borrow_min'], dfForm_class, dfForm_style,dfForm_others)}<span class="commonToolTip">最低投标金额</span></td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">是否通过：</th>
                                      <td>${dfForm:radio("borrow_status",borrowStatus,"2","","","")}</td>
                                    </tr>
                                    <tr>
                                      <th width="200" class="control-label">审核说明：</th>
                                      <td>${dfForm:text( "deal_info","", "", "","")}</td>
                                    </tr>
                                  </table>
							</div>

						</div>


						<div class="tab-pane" id="C">
							<div  >借款方图片资料</div>
							<div class="table_full">
								<table width="100%" class="table_form ">
									<tr>
										<th width="200" class="control-label">借款方图片：</th>
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




	