<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<form method="post" action="${dfn:U('home/loan/addLoan') }">
     	 	<dfTag:token />
		        <ul>
		            <li class="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*姓名：&nbsp; <input id="name" class="frame" name="name" type="text" />
		           	</li>
		          <li class="call">*联系电话：&nbsp; <input class="frame" id="phone" name="phone" type="text" /></li>
		          <li class="add">*所在地区：&nbsp; 
                  <select class="_SELECT_ myselect" style="width:100px;" name="area" id="area" onchange="showCity();">
                  <option value="">请选择省</option>
				<option value="北京">北京市</option>
				<option value="福建省">福建省</option>
				<option value="山东省">山东省</option>
				<option value="河南省">河南省</option>
				<option value="内蒙古">内蒙古</option>
				<option value="河北省">河北省</option>
				<option value="江苏省">江苏省</option>
                  </select>
                  <select class="_SELECT_ myselect" style="width:100px;" name="city" id="city">
                  <option value="">请选择市</option>
                  </select>
		          </li>
                  <script type="text/javascript">
				  var selectOption={
					  	"北京":["北京"],
						"福建省":["南平市","三明市","福州市"],
						"山东省":["德州市","临沂市","威海市","枣庄市"],
						"河南省":["信阳市"],
						"内蒙古":["呼和浩特市","赤峰市","包头市","通辽市"],
						"河北省":["衡水市"],
						"江苏省":["苏州市"]
				  }

				  function showCity(){
					  var ct=$("#area option:selected").val();
					  var htmlString="";
					  if(typeof selectOption[ct]!="undefined"){
						  $.each(selectOption[ct],function(k,v){
						  	htmlString+="<option value='"+v+"'>"+v+"</option>";
						  })
					  }else{
					  	htmlString="<option value=''>请先选择省</option>";
					  }
					  $("#city").html(htmlString);
				  }
				  </script>
                  
                  
		          <li class="product">*金融产品：&nbsp;
		          		<input type="hidden" id="product" name="product" value="${thisType }" />
						<c:choose>
						<c:when test="${thisType eq '经营借款'}">经营借款
				  </li>
				  <li class="money" style="margin-top:-7px;">&nbsp;产品类型：&nbsp;&nbsp;短期周转&nbsp;扩大经营&nbsp;设备采购&nbsp;其他用途
					</li>
						</c:when>
	<c:when test="${thisType eq '创业贷'}">YOO校园
	</li>
	</c:when>
						<c:otherwise>一般借款
					</li>
					<li class="money" style="margin-top:-7px;height:45px;">&nbsp;产品类型：&nbsp;&nbsp;个人消费&nbsp;家庭装修&nbsp;买房置业&nbsp;买车置业<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教育进修&nbsp;兼职创业&nbsp;其他用途

					</li>
						</c:otherwise>
						</c:choose>
		          <li class="money">*借款金额：&nbsp; &nbsp;<input id="amount_borrowed" class="frame_2" name="amount_borrowed" type="text" />&nbsp;&nbsp;万元</li>
		          <li class="money">*借款周期：&nbsp; &nbsp;<input id="expired_borrowed" class="frame_2" name="expired_borrowed" type="text" />&nbsp;&nbsp;月</li>
		          <li class="money">*月均收入：&nbsp; &nbsp;<input id="monthly_averagy_revenue" class="frame_2" name="monthly_averagy_revenue" type="text" />&nbsp;&nbsp;万元</li>
		          <li class="money">*借款用途：&nbsp; &nbsp;<textarea id="purpose_borrowed" class="frame_3" name="purpose_borrowed" cols="" rows=""></textarea></li>
		          <li class="money" style="margin-top:10px;">                      
                         <label>*验 证 码：</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="frame_2" name="vcode" id="vcode"   style="width:100px"   /> 
                         &nbsp;&nbsp;
                         <img src="${dfn:U('home/login/verifyCode')}" height="30px" style="cursor:pointer" onclick="javascript:this.src='${dfn:U('home/login/verifyCode')}?time='+Math.random();void(0);"  />
					
				  </li>
		          <li><input name="agreement" type="checkbox" value="isRead" />&nbsp;我已阅读并同意<a style="color:#69c1ff" href="http://www.p2pok.com/article/index.do?id=676" target="_blank">《借款合同》</a><a style="color:#69c1ff;margin-left:-10px;" href="http://www.p2pok.com/article/index.do?id=684" target="_blank">《借款咨询与服务协议》</a></li>
		          <li class="apply">
		          
			          	<img  src="${HomeStatics}/Loan/images/loan_apply_btn.png" onclick="ajaxSubmit('${dfn:U('home/loan/addLoan') }');"/>
			          	<script type="text/javascript">
							
							
							function ajaxSubmit(url){
								var data=makevar(['vcode','loan_subject','name','phone','area','product','amount_borrowed','expired_borrowed','monthly_averagy_revenue','purpose_borrowed','city']);
								data['area'] = data['area']+'-'+data['city'];
								postData(url,data,function(da){
									if(da.status=="1"){
										Mix.msg("您的借款申请已提交，我们的客服人员会尽快与您取得联系！","success",3);
										setTimeout(function(){
											window.location.href="${_WEB_ROOT_}/";
										},2000)
									}else{
										Mix.alert(da.msg);
										Mix.msg(da.msg,"fail",3);
									} 
								},"json")}
						
					</script>
		          </li>
		         </ul>
        </form>