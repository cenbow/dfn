<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap" style="width: 600px">
		<div class="nav">
			<ul class="cc">
				<li class="current"><a href="javascript:;">${user.user_name}的详细资料</a></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab">个人资料</a></li>
			<li><a href="#B" data-toggle="tab">联系方式</a></li>
			<li><a href="#C" data-toggle="tab">单位资料</a></li>
			<li><a href="#D" data-toggle="tab">财务状况</a></li>
			<li><a href="#E" data-toggle="tab">房产资料</a></li>
			<li><a href="#F" data-toggle="tab">联保情况</a></li>
		</ul>
		<form class="form-horizontal J_ajaxForm" name="myform" id="myform"
			action="${dfn:U('admin/user_info/index')}" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">真实姓名： <input
											type="hidden" name="id" value="${data[id] }" />
										</th>
										<td>${dfForm:input( "real_name", data['real_name'], dfForm_class, dfForm_style,dfForm_others)}
											<span class="commonToolTip">还未进行实名认证</span>
										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">身份证号：</th>
										<td>${dfForm:input( "idcard", data['idcard'], dfForm_class,  dfForm_style,dfForm_others)}

											<span class="commonToolTip">还未进行实名认证</span>
										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">年龄：</th>
										<td>${dfForm:input( "age", data['age'], dfForm_class, dfForm_style,dfForm_others)}


										</td>
									</tr>
									<tr>
										<th class="control-label">籍贯：</th>
										<td>${dfForm:input( "province", data['province'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">当前居住城市：</th>
										<td>${dfForm:input( "city_now", data['city_now'], dfForm_class, dfForm_style,dfForm_others)}



										</td>
									</tr>
									<tr>
										<th class="control-label">手机号码：</th>
										<td>${dfForm:input( "user_phone",  data['user_phone'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">性别：</th>
										<td>${dfForm:input( "sex",  data['sex'], dfForm_class, dfForm_style,dfForm_others)}


										</td>
									</tr>
									<tr>
										<th class="control-label">婚姻状况：</th>
										<td>${dfForm:input( "marry",  data['marry'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">最高学历：</th>
										<td>${dfForm:input( "education",  data['education'], dfForm_class, dfForm_style,dfForm_others)}


										</td>
									</tr>
									<tr>
										<th class="control-label">月收入：</th>
										<td>${dfForm:input( "income", data['income'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">职业：</th>
										<td>${dfForm:input( "zy",  data['zy'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">个人描述：</th>
										<td>${dfForm:input( "info",  data['info'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>

						<div class="tab-pane " id="B">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">现居住地址： 
										</th>
										<td>${dfForm:input( "address", contact['address'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">住宅电话：</th>
										<td>${dfForm:input( "tel", contact['tel'], dfForm_class,  dfForm_style,dfForm_others)}

										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">第一联系人：</th>
										<td>${dfForm:input( "contact1",contact['contact1'], dfForm_class, dfForm_style,dfForm_others)}


										</td>
									</tr>
									<tr>
										<th class="control-label">关系：</th>
										<td>${dfForm:input( "contact1_re", contact['contact1_re'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">手机号码：</th>
										<td>${dfForm:input( "contact1_tel", contact['contact1_tel'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>

									<tr>
										<th class="control-label">其他：</th>
										<td>${dfForm:input( "contact1_other",  contact['contact1_other'], dfForm_class, dfForm_style,dfForm_others)}

											<span class="commonToolTip">如不修改则留空</span>
										</td>
									</tr>
									<tr>
										<th>第二联系人：</th>
										<td>${dfForm:input( "contact2",  contact['contact2'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th class="control-label">关系：</th>
										<td>${dfForm:input( "contact2_re",  contact['contact2_re'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">手机号码：</th>
										<td>${dfForm:input( "contact2_tel",  contact['contact2_tel'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">其他：</th>
										<td>${dfForm:input( "contact2_other",  contact['contact2_other'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">第三联系人：</th>
										<td>${dfForm:input( "contact3", contact['contact3'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">关系：</th>
										<td>${dfForm:input( "contact3_re",  contact['contact3_re'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">手机号码：</th>
										<td>${dfForm:input( "contact3_tel",  contact['contact3_tel'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">其他：</th>
										<td>${dfForm:input( "contact3_other",  contact['contact3_other'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>


						<div class="tab-pane " id="C">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">单位名称： <input
											type="hidden" name="id" value="${data.id }" />
										</th>
										<td>${dfForm:input( "department_name", department['department_name'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">电话：</th>
										<td>${dfForm:input( "department_tel", department['department_tel'], dfForm_class,  dfForm_style,dfForm_others)}


										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">地址：</th>
										<td>${dfForm:input( "department_address", department['department_address'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">工作年限：</th>
										<td>${dfForm:input( "department_year", department['department_year'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">证明人：</th>
										<td>${dfForm:input( "voucher_name",  department['voucher_name'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th class="control-label">证明人手机：</th>
										<td>${dfForm:input( "voucher_tel",  department['voucher_tel'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>


						<div class="tab-pane " id="D">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">月均收入： <input
											type="hidden" name="id" value="${data.id }" />
										</th>
										<td>${dfForm:input( "fin_monthin", financial['fin_monthin'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">收入构成描述：</th>
										<td>${dfForm:input( "fin_incomedes",financial ['fin_incomedes'], dfForm_class,  dfForm_style,dfForm_others)}


										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">月均支出：</th>
										<td>${dfForm:input( "fin_monthout", financial['fin_monthout'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th class="control-label">支出构成描述：</th>
										<td>${dfForm:input( "fin_outdes", financial['fin_outdes'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">住房条件：</th>
										<td>${dfForm:input( "fin_house",  financial['fin_house'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">房产价值：</th>
										<td>${dfForm:input( "fin_housevalue", financial['fin_housevalue'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">是否购车：</th>
										<td>${dfForm:input( "fin_car",  financial['fin_car'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">车辆价值：</th>
										<td>${dfForm:input( "fin_carvalue",  financial['fin_carvalue'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">参股企业名称：</th>
										<td>${dfForm:input( "fin_stockcompany",  financial['fin_stockcompany'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">参股企业出资额：</th>
										<td>${dfForm:input( "fin_stockcompanyvalue",  financial['fin_stockcompanyvalue'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">其他资产描述：</th>
										<td>${dfForm:input( "fin_otheremark",  financial['fin_otheremark'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>

						<div class="tab-pane " id="E">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">房产地址： <input
											type="hidden" name="id" value="${data.id }" />
										</th>
										<td>${dfForm:input( "house_dizhi", house['house_dizhi'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">建筑面积：</th>
										<td>${dfForm:input( "house_mianji", house['house_mianji'], dfForm_class,  dfForm_style,dfForm_others)}
										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">建筑年份：</th>
										<td>${dfForm:input( "house_nian", house['house_nian'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">供款状况：</th>
										<td>${dfForm:input( "house_gong", house['house_gong'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">当所有权人1：</th>
										<td>${dfForm:input( "house_suo1",  house['house_suo1'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>

										<th class="control-label">当产权份额：</th>
										<td>${dfForm:input( "house_feng1",  house['house_feng1'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th class="control-label">所有权人2：</th>
										<td>${dfForm:input( "house_suo2",  house['house_suo2'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>

										<th class="control-label">当产权份额：</th>
										<td>${dfForm:input( "house_feng2",  house['house_feng2'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr style="border-bottom: 1px solid #dedede;">
										<td class="tdTitle" colspan="2" style="text-align: left">
											若房产尚在按揭中, 请填写</td>

									</tr>
									<tr>
										<th class="control-label">贷款年限：</th>
										<td>${dfForm:input( "house_dai",  house['house_dai'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">每月供款：</th>
										<td>${dfForm:input( "house_yuegong",  house['house_yuegong'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">尚欠贷款余额：</th>
										<td>${dfForm:input( "house_shangxian",  house['house_shangxian'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
									<tr>
										<th class="control-label">按揭银行：</th>
										<td>${dfForm:input( "house_anjiebank",  house['house_anjiebank'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>

						<div class="tab-pane " id="F">
							<table class="table_form" cellpadding="2" cellspacing="2"
								width="100%">
								<table>
									<tr>
										<th width="200" class="control-label">第一联保人： <input
											type="hidden" name="id" value="${data.id }" />
										</th>
										<td>${dfForm:input( "ensuer1_name", ensure['ensuer1_name'], dfForm_class, dfForm_style,dfForm_others)}
											<!-- <input type="text"  name="m_type" > --> <!-- <a target="_blank"
									href="user.jsp">egspoon</a> -->
										</td>
									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">关系：</th>
										<td>${dfForm:input( "ensuer1_re", ensure['ensuer1_re'], dfForm_class,  dfForm_style,dfForm_others)}

										</td>

									</tr>
									<tr>
										<th width="200" height="40px" class="control-label">手机号码：</th>
										<td>${dfForm:input( "ensuer1_tel", ensure['ensuer1_tel'], dfForm_class, dfForm_style,dfForm_others)}


										</td>
									</tr>
									<tr>
										<th class="control-label">第二联保人：</th>
										<td>${dfForm:input( "ensuer2_name",ensure['ensuer2_name'], dfForm_class, dfForm_style,dfForm_others)}
									</tr>
									<tr>
										<th class="control-label">关系：</th>
										<td>${dfForm:input( "ensuer2_re",  ensure['ensuer2_re'], dfForm_class, dfForm_style,dfForm_others)}
										</td>
									</tr>
									<tr>
										<th class="control-label">手机号码：</th>
										<td>${dfForm:input( "ensuer2_tel",ensure['ensuer2_tel'], dfForm_class, dfForm_style,dfForm_others)}

										</td>
									</tr>
								</table>
							</table>
						</div>




					</div>
				</div>
			</fieldset>
		</form>
	</div>