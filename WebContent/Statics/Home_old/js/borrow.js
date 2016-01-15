function checkday(){
	var is_check = $("#is_day").attr("checked");
	if(is_check){
		var option = $("#_day_option").html();
		$("#repayment_type option:eq(3)").attr('selected',true);
		$("#repayment_type").attr('disabled',true);
		$("#_day_rate").html("年利率：").css("color","red");
		$("input[name='borrow_interest_rate']").css("border","1px solid red");
		borrowInterest=dayRate;
	}
	else{
		var option = $("#_month_option").html();
		$("#repayment_type option:eq(1)").attr('selected',true);
		$("#repayment_type").attr('disabled',false);
		$("input[name='borrow_interest_rate']").removeAttr("style");
		$("#_day_rate").html("年利率：").removeAttr("style");
		borrowInterest=MonthRate;
	}
	$("#borrow_duration").empty();
	$(option).appendTo("#borrow_duration");
	changeInterestTip();
	NumberCheck($("#borrow_interest_rate").get(0),'rate');
}

function is_reward_do(){
	var is_check = $("#is_reward").attr("checked");
	if(is_check){
		$("#_is_reward").slideDown();
	}
	else{
		$("#_is_reward").slideUp();
	}
}

function is_reward_vouch_do(){
	var is_check = $("#is_reward_vouch").attr("checked");
	if(is_check){
		$("#_is_reward_vouch").slideDown();
	}
	else{
		$("#_is_reward_vouch").slideUp();
	}
}

function reward_type_do(id){
	$("#reward_type_"+id).attr("checked",true);
}

function test_duration(){
	var type = $("#repayment_type").val();
	var month = $("#borrow_duration").val();
	var is_day = $("#is_day").attr("checked");
	if(1==2&&type==3 && month%3!=0){
		alert("选择按季分期还款时，借款期限必须为3的整倍数，请重新填写借款期限或者选择别的还款方式");	
		$("#repayment_type option:eq(1)").attr("selected",true);
	}else if(type==4 && !is_day){
		$("#is_day").click();
		checkday();
		$("#repayment_type option:eq(0)").attr("selected",true);
	}
}
//返回数字
function NumberCheck(t,type,parm){
	var num = t.value;
	var re=/^\d+\.?\d*$/;
	if(!re.test(num)){
		var lastValue=isNaN(parseFloat(num))?0:parseFloat(num);
		t.value=lastValue;
	}else{
		lastValue = num;	
	}
	if(type=='rate'){
		parm = borrowInterest;
		lastValue=rand2(lastValue);
		t.value = lastValue;
		if(lastValue<parm[0] || lastValue>parm[1] || num<0){
			Mix.tip($(t),'借款利率应该在'+parm[0]+'%到'+parm[1]+'%之间',1,5);
			t.value=(lastValue<parm[0])?parm[0]:parm[1];
		}
	}else if(type=='borrow'){
		if(lastValue.toString().indexOf(".")!= -1){
			lastValue=parseInt(lastValue);
			t.value = lastValue;
		}
		if(lastValue<parm[0] || lastValue>parm[1] || num<=0){
			Mix.tip($(t),'借贷总金额应该在在'+parm[0]+'元到'+parm[1]+'元之间',1,5);
			t.value=(lastValue<parm[0])?parm[0]:parm[1];
		}
	}else if(type=='borrow_max'){
			lastValue=parseInt(lastValue);
			t.value = lastValue;
	}
	
}

function rand2(str){
	var index = str.toString().indexOf(".");
	if(index!= -1){
		return str.toString().substr(0,(index+3));
	}else return str;
}