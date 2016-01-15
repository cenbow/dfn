<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>经营借款_融友网</title>
<link  href="${HomeStatics}/Loan/style/loan.css"  type="text/css" rel="stylesheet" />
<%@ include file="../Common/headerBody.jsp"%>
<!--当前位置显示-->
<!-- curpage start -->
<div class="hc_curpage_wper">
	   <div class="hc_curpage px1000 pt">
	   	      <a href="http://www.p2pok.com/"> 首页 </a><span>&gt;</span><a href="${_WEB_ROOT_}/loan/index.do"> 我要借款 </a><span>&gt;</span><a href="${_WEB_ROOT_}/loan/index.do"> 业务产品 </a><span>&gt;</span><a href="${_WEB_ROOT_}/loan/real_loan.do" class="curpage_ftcolor1"> 经营借款 </a>
	   </div>
</div>
<!-- end curpage -->


<!--流程条-->
<div class="loan_bar px1000">
   <ul>
      <li>填写借款申请</li>
      <li class="bar_two">贷款专员与您联系</li>
      <li class="bar_three">提交材料 审批放款</li>
      <li class="bar_frou">审批结束 放款成功</li>
   </ul>
</div>
<!--流程条 END-->


<!--banner-->
<div class="loan_banner">
  <div class="loan_banner_con px1000">
    <div class="loan_banner_con_l fl"></div>
      <div class="loan_banner_con_r fl">
      <%@ include file="loan_form.jsp"%>
     </div>
  </div>

</div>
<!--banner END-->

<div class="black20"></div>


<!--内容区（申请资格、额度期限、所需材料）-->
<div class="loan_con_1">
   <div class="loan_con_1_l fl">
      <h1><span>申请资格</span></h1>
      <ul>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>22-55周岁的中国公民</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>企业经营时间满一年 </li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>法人代表本人</li>
      </ul>
   </div>
   
   <div class="loan_con_1_c fl">
      <h1><span>额度期限</span></h1>
      <ul>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>借款额度：50000以上</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>借款年利率：10% - 18%</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>借款期限：3-12个月</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>管理费：0.330%/月</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>审核时间：1-3个工作日</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>还款方式：等额本息，先息后本</li>
      </ul>
   </div>
   
   <div class="loan_con_1_r fl">
      <h1><span>所需材料</span></h1>
      <ul>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>身份证</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>个人信用报告</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>经营证明</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>近6个月常用银行卡流水</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>相应价值抵押物</li>
         <!--<li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>申请人征信报告</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>个人住址证明类文件与单位工作证明类文件，与贷款相关的其他资料</li>-->
      </ul>
   </div>
</div>

<!--内容区（申请资格、额度期限、所需材料）-->
     
<div class="black10"></div>     
     
     
     
     
<!--内容区第二块--> 
<div class="loan_con_2">

   <!--产品优势-->
   <div class="loan_con_2_l fl">
      <h2><img src="${HomeStatics}/Loan/images/loan_tilte_2.png" /></h2>
       <ul>
         <li class="text">是指申请人以企业名下合法财产为保证措施，向投资者申请短期借贷的贷款业务。</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>资料简单，手续简便</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>贷款额度较高，价格评估合理</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>利率低</li>
         <!--<li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>购车发票或过户发票</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>车辆商业保险保单</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>申请人征信报告</li>
         <li><span><img src="${HomeStatics}/Loan/images/loan_stars.png" /></span>个人住址证明类文件与单位工作证明类文件，与贷款相关的其他资料</li>-->
      </ul>
   </div>
   <!--产品优势-->
<%@ include file="calculator_form.jsp"%> 
        
</div>
<!--内容区第二块--> 
    
<div class="black10"></div> 
     

<!--温馨提示--> 
<div class="loan_reminder">
   <h4><span>温馨提示</span></h4>
   <p>★  请提交完整的材料，以加快审核进度；</p>
   <!--<p>2、目前该业务仅支持部分地区</p>-->
</div>
  
<!--温馨提示-->    


<div class="black20"></div> 
<%@ include file="../Common/footer.jsp"%>