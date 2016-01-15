<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
   <!--借款计算机--> 

   <div class="loan_con_2_r fr">

      <h3><span><img src="${HomeStatics}/Loan/images/loan_tilte_3.png" /></span>借款计算器</h3>

      <ul>

         <li>申请金额&nbsp;&nbsp;<input class="frame_5" name="" type="text" placeholder="请输入借款金额" />&nbsp;&nbsp;元</li>

         <li>借款期限&nbsp;&nbsp;<input class="frame_5" name="" type="text" placeholder="请输入借款期限" />&nbsp;&nbsp;月</li>

         <li>借款利率&nbsp;&nbsp;<input class="frame_5" name="" type="text" placeholder="请输入借款利率" />&nbsp;&nbsp;%</li>

         <li>还款方式&nbsp;&nbsp;<select class="frame_6"><option value="等额本息还款">等额本息还款</option><option value="等本等息还款">等本等息还款</option><option value="按月付息到期还本">按月付息到期还本</option><option value="一次付息到期还本">一次付息到期还本</option></select> &nbsp;</li>

         <li class="loan_btn_2"><a href="${dfn:U('home/tools/calculator')}"><img src="${HomeStatics}/Loan/images/loan_btn_2.png" /></a><p style="color:#999999; font-size:12px; height:30px; line-height:30px;">*利率范围：不超过中国人民银行基准利率的4倍</p></li>



      </ul>

   </div>

   <!--借款计算机-->  

