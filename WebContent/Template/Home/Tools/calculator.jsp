<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>计算工具</title>
<%@ include file="../Common/headerBody.jsp"%>
<div class="calculator_con_wper pb30">
	  <div class="calculator_con px1000" style="position:relative;">
	  	     <div class="cal_curpage">
	  	     	 <a href="">首页</a>
	  	     	 <span>></span>
	  	     	 <a href="">我要投资</a>
	  	     	 <span>></span>
	  	     	 <a href="">收益计算器</a>
	  	     </div>
	  	     <!-- end curpage -->
	  	     <div class="cal_text pb30">
	  	     	    <h2 class="cal_text_tit">投资利息计算器</h2>
	  	     	    <form style="width:370px; margin:0 auto">
	  	     	    	  <fieldset>
	  	     	    	  	   <p class="mt20"><label>投资金额</label><input type="text" id="borrow_money" placeholder="金额"  class="cal_inputbg1" /></p>
	  	     	    	  	   <p class="mt20"><label>投资期限</label><input type="text" id="borrow_duration" placeholder="期限"  class="cal_inputbg3" /></p>
	  	     	    	  	   <p class="mt20"><label>年化利率</label><input type="text" id="borrow_interest_rate" placeholder="利率"  class="cal_inputbg2" /></p>
	  	     	    	  	   <p style="color:#9a9a9a;font-size:12px;padding-left:85px;">（*利率范围：不超过中国人民银行基准利率的4倍）</p>
	  	     	    	  	   <p class="cal_select mt20">
	  	     	    	  	   	 <label >还款方式</label>
                                 ${dfForm:select("repayment_type",repaymentType,"2","x_select","",'style="border:1px solid #ebebeb"')}
	  	     	    	  	   </p>
	  	     	    	  	   <p style="margin-top:50px;">
	  	     	    	  	   	 <label></label>
	  	     	    	  	   	 <a href="javascript:;" class="cal_btn showbomb" onclick="getRes();">开始计算</a>
	  	     	    	  	   </p>
	  	     	    	  </fieldset>
	  	     	    </form>


           	 <div class="calculator_res" style="margin-top:20px">
                   <div class="bombbox">
                   <h2 class="bombbox_tit clearfix"><span class="fl"><img src="${HomeStatics}/images/cal_icon01.png" alt=""  class="mr5" />计算结果</span></h2>
                   
                   <div id="calculator_content">
                   <p class="bombbox_ul">
                     <span class="mr30">投资总额: <strong>--.--</strong> 元</span><span>到期本利和: <strong>--.--</strong> 元</span>
                   </p>
                   <h3 style="color:#555;font-size:16px;line-height:30px;text-indent:30px;">计算结果</h3>
                   <table class="bombbox_table" style="width:100%">
                       <tr class="firsttr">
                          <th>期数</th>
                          <th>每月还款金额</th>
                          <th>每月还款本</th>
                          <th>每月还款利息</th>
                          <th>剩余还款金额</th>
                       </tr>
                       <tr>
                           <td>1/1</td>
                           <td>--.--</td>
                           <td>--.--</td>
                           <td>--.--</td>
                           <td>--.--</td>
                       </tr>
                   </table>
                   </div>
                   
                   </div>             
             </div>


	  	     </div>
  	       <!-- end  -->
           
           
	  </div> 
</div>
<script type="text/javascript">
function getRes(){
	var p=makevar(['borrow_money','borrow_duration','borrow_interest_rate','repayment_type']);
	getData("${dfn:SU(_thisUrl_,'calculator_res_ajax')}",function(html){
		$("#calculator_content").html(html);
	},p,"html");
}
</script>

<%@ include file="../Common/footer.jsp"%>