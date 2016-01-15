<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>资产统计_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
	<!--df_member_content_r  START-->
			<div class="df_member_content_r">
				<div class="clearFix">
					<div class="df_member_content_r_title">资产统计</div>
					<div class="df_member_content_box">
						<div class="df_member_content_box_title">
							资产总计：<span class="yellow_3">${userMoney.all_money}</span>元
						</div>

						<div class="df_member_moneyBox">
							<div class="df_member_moneyBox_left" style="width:315px">
								<ul class="df_member_moneyBox_ul">
									<li >
										<dl>
											<dt>
												<img src="${MemberStatics}/images/icon_1.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney.account_money}元 </span> <span> 可用余额
												</span>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/icon_2.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney.collect_interest}元 </span> <span> 应收利息
												</span>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/icon_3.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney.collect_capital}元 </span> <span> 待收本金
												</span>
											</dd>
										</dl>
									</li>
									<!--<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/icon_4.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney.reward_money}元 </span> <span> 奖励金 </span>
											</dd>
										</dl>
									</li>-->
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/icon_5.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney.money_freeze}元 </span> <span> 冻结资金
												</span>
											</dd>
										</dl>
									</li>
								</ul>
							</div>

							<div class="df_member_moneyBox_right">
	    	   	            <div id="main" style="height:220px;width:330px;">
	    	   	            	  
	    	   	            </div>
	    	   	            <script type="text/javascript" src="${SiteStatics}/Common/js/echarts-all.js"></script>
	    	   	            <script type="text/javascript">
                                 var myChart = echarts.init(document.getElementById('main'));
                                 var option = {
									    tooltip : {
									        trigger: 'item',
									        formatter: "{a} <br/>{b} : {c} ({d}%)"
									    },
									    legend: {
									        orient : 'vertical',
									        x : 'right',
									        y : 'center',
									        itemGap:15,
									        data:['可用余额','应收利息','待收本金','冻结资金']
									    },
									    
									    calculable : true,
									    series : [
									        {
									            name:'资产统计',
									            type:'pie',
									            radius : ['60%', "80%"],
                                                center:['40%',"50%"],
									            itemStyle : {
									                normal : {
									                    label : {
									                        show : false
									                    },
									                    labelLine : {
									                        show : false
									                    }
									                },
									                emphasis : {
									                    label : {
									                        show : true,
									                        position : 'center',
									                        textStyle : {
									                            fontSize : '16',
									                            fontWeight : 'bold'
									                        }
									                    }
									                }
									            },
									            data:[
									                {value:${userMoney.account_money}, name:'可用余额'},
									                {value:${userMoney.collect_interest}, name:'应收利息'},
									                {value:${userMoney.collect_capital}, name:'待收本金'},
									             
									                {value:${userMoney.money_freeze}, name:'冻结资金'},
									               
									            ]
									        }
									    ]
									};

							        // 为echarts对象加载数据 
							        myChart.setOption(option);	 	
	    	   	            </script>
							</div>
						</div>
					</div>
				</div>
				<div class="clearFix">
					<div class="df_member_content_r_title">资产统计</div>
					<div class="df_member_content_box">
						<div class="df_member_content_box_title">
							累计盈亏总额：<span class="yellow_3">${dfn:getFloatValue(userMoney['10']-userMoney['11']-userMoney['recharge_fee']-userMoney['withdraw_fee']-userMoney['11']*(-1))}</span>元
						</div>

						<div class="df_member_moneyBox">
							<div class="df_member_moneyBox_left">
								<ul class="df_member_moneyBox_ul">
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/bookmark.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${dfn:getFloatValue(userMoney['10']-userMoney['11'])}元 </span> <span> 净赚利息
												</span>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/bookmark.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${dfn:defaultValue(userMoney['recharge_fee'],"0.00")}元 </span> <span> 累计提充值费
												</span>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/bookmark.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${dfn:defaultValue(userMoney['withdraw_fee'],"0.00")}元 </span> <span> 累计提现费
												</span>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<img src="${MemberStatics}/images/bookmark.png" />
											</dt>
											<dd>
												<span class="df_member_s"> ${userMoney['11']*(-1)}元 </span> <span> 利息管理费
												</span>
											</dd>
										</dl>
									</li>
								</ul>
							</div>

							<div class="df_member_moneyBox_right">
								<img src="${MemberStatics}/images/chart_pic1.png" />
							</div>
						</div>
					</div>

				</div>

			</div>
			<!--df_member_content_r  END-->

<%@ include file="../Common/footer.jsp"%>
