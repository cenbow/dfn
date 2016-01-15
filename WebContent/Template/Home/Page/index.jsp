<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%><head>
<title>安全保障-${_siteInfo_.siteName}</title>
<link rel="stylesheet" type="text/css" href="${HomeStatics}/css/category.css">
<script type="text/javascript" src="${HomeStatics}/js/tab.js"></script>
<%@ include file="../Common/headerBody.jsp"%>
<script type="text/javascript">
var lhash=location.hash;
var tabindex = parseInt(lhash.substr(-1));
$(function(){
	if(!isNaN(tabindex)){
		$("#b_xxk li").eq((tabindex-1)).addClass("thistab").siblings("li").removeClass("thistab");
		$("#b_jkk>li").eq((tabindex-1)).show().siblings("li").hide();
	}
})
</script>
<!-- 网站头部  end-->
 <div class="topimg">
   <img src="${HomeStatics}/imgs/gsjianjie2_02.jpg" width="2000" height="366" />
 </div>
<div class="xmxqbottom">
 <div class="gsjjk">
  <ul id="b_xxk" class="b_xxk clearfix">
   <li class="thistab gsjjmar">公司简介</li>
   <li>管理团队</li>
   <li><a href="${dfn:U('home/category/index')}?id=427" onclick="window.location.href=$(this).attr('href');">官方公告</a></li>
   <li><a href="${dfn:U('home/category/index')}?id=377" onclick="window.location.href=$(this).attr('href');">新闻资讯</a></li>
   <li>合作伙伴</li>
   <li>联系我们</li>
  </ul>
 </div>
  <ul id="b_jkk" class="b_jkk clearfix">
    <li>
      <div class="gsjianjie_1_left">
	     <div class="gsjianjie_1_left_1">
		    <h2 class="gsjianjie_1_left_p">公司简介</h2>
			<p class="gsjianjie_1_left_p2">	大博鑫财富隶属于大博鑫集团，专注于为小微企业及中小企业提供规范化、专业化的投融资咨询综合管理服务。公司坐落于美丽的湖滨之畔—光谷金融港，国家自主创新金融示范区—武汉东湖新技术开发区（武汉•中国光谷）的核心地段。作为国内领先的从事信用贷款咨询与管理的专业性服务机构，大博鑫财富依托国际先进的微小企业个体分析技术，集合国内成熟的企业融资风控模式，以银行微贷外包，P2P贷款融资、投资理财咨询为核心业务模式，依托长三角经济圈及光谷高新开发区资源，在湖北重点中心城区设立分支机构和业务团队，在金融服务领域合作广泛，与多家银行建立了战略伙伴关系，致力于成为微型金融服务领域的领军人。</p>
		 </div>
		 
		 <div class="gsjianjie_1_left_1">
		    <p class="gsjianjie_1_left_p">公司愿景</p>
			<p class="gsjianjie_1_left_p2">	打造中国卓越的金融服务品牌</p>
		 </div>
		 
		 <div class="gsjianjie_1_left_1">
		     <p class="gsjianjie_1_left_p">公司使命</p>
			 <p class="gsjianjie_1_left_p2">	与客户共创财富人生</p>
		 </div>
		 
		 <div class="gsjianjie_1_left_1">
		    <p class="gsjianjie_1_left_p">核心价值</p>
			<p class="gsjianjie_1_left_p2">	诚信&nbsp;专业&nbsp;价值&nbsp;合力</p>
		 </div>
		 <div class="gsjianjie_1_left_1">
		    <p class="gsjianjie_1_left_p">服务宗旨</p>
			<p class="gsjianjie_1_left_p2">	大博鑫财富对每一个项目与投资都力求完美
			</p>
            <p class="gsjianjie_1_left_p2">	大博鑫财富对每一个项目与投资都全力以赴
			</p>
            <p class="gsjianjie_1_left_p2">	我们追求对方案每一个细节的准确把握和落实            </p>
            <p class="gsjianjie_1_left_p2">	我们追求对执行每一个细节的精准实施和评估            </p>
		 </div>
		 
	   </div>
	   <div class="gsjianjie_1_right">
        
	     <img src="${HomeStatics}/imgs/gsjiejian3_03.jpg" width="390" height="222" />
	   </div>
    </li>
    <li>
        <div class="gsjianjie">
	   <ul class="lindao clearfix">
	     <li class="lindao_li1"><img src="${HomeStatics}/imgs/guanli5_03.jpg" /></li>
		 <li class="lindao_li2">
		  <h3 class="lindao_li2_p"><span>联合创始人& 董事长</span>邹昌波</h3>
		  <p >大博鑫控股集团创始人，2014年创立大博鑫财富。在国际金融投资领域拥有超过10年的跨国工作经验，网络信贷的业务模式创新、信用评价模型和风险管理体系建设有独到的见解和实践经验，并在企业管理和运营上有着丰富的经验。</p></li>
	   </ul>
	   <ul class="lindao clearfix">
	     <li class="lindao_li1"><img src="${HomeStatics}/imgs/guanli3_03.jpg" /></li>
		 <li class="lindao_li2">
		  <h3 class="lindao_li2_p"><span>联合创始人 & 总裁</span>徐晟</h3>
		  <p >毕业于中南财经政法大学金融学院，获博士研究生学位。长期在银行任信贷部经理，并在中南财大就职金融系主任和教授工作。亲历了国内小企业信贷业务从无到有、从小到大的整个发展历程，并在此过程中担任了风险管理相关的多个重要岗位。有丰富的市场风险管理经验。了解国内外债务市场，对信用风险评估和定价机制有深入研究。</p></li>
	   </ul>
	   <ul class="lindao clearfix">
	     <li class="lindao_li1"><img src="${HomeStatics}/imgs/guanli4_03.jpg"/></li>
		 <li class="lindao_li2">
		  <h3 class="lindao_li2_p"><span>联合创始 人& 副总裁</span>周才炎</h3>
		  <p >公司联合创始人，早年担任银行高管，九十年代中期进入国内资本市场，对宏观经济与微观经济有着全面而透彻的理解，在投资与私募投资方面具有丰富经验。<br />
周才炎先生所担任社会职务有：汉口大冶商会党委书记，大冶市政府人大代表、中南民族大学经济与管理学院客座教授、武汉大学</p></li>
	   </ul>
	   <ul class="lindao clearfix">
	     <li class="lindao_li1"><img src="${HomeStatics}/imgs/guanli2_03.jpg"/></li>
		 <li class="lindao_li2">
		  <h3 class="lindao_li2_p"><span>首席风险官</span>徐若峰</h3>
		  <p >公司联合创始人，早年担任银行高管，九十年代中期进入国内资本市场，对宏观经济与微观经济有着全面而透彻的理解，在投资与私募投资方面具有丰富经验。
周才炎先生所担任社会职务有：汉口大冶商会党委书记，大冶市政府人大代表、中南民族大学经济与管理学院客座教授、武汉大学</p></li>
	   </ul>
	   <ul class="lindao clearfix">
	     <li class="lindao_li1"><img src="${HomeStatics}/imgs/guanli1_03.jpg"/></li>
		 <li class="lindao_li2">
		  <h3 class="lindao_li2_p"><span>财务总监</span>段婷</h3>
		  <p >毕业于华中师范大学会计学专业，从事财务工作12年，注册会计师、高级会计师职称。具备全面财务管理工作能力，较强的决策能力、分析判断能力、团队建设与领导力。在投资和融资等金融公司积累了丰富的财务工作经验，曾多次参与过重大投资项目和经营活动的财务风险评估以及审计工作。</p></li>
	   </ul>
  </div>

    </li>
    <li>
      <div class="not_main">
 	<div class="not_content">
       <dl>
       <dt>大博鑫财富618全民抢钱活动正式上线！</dt>
       <span>2015-07-15</span>
       <dd>一、大博鑫财富平台每周一至周五上午发布活动体验标，该体验标仅可用推荐人注册所奖励的推广体验金，不限金额。到期客户享有体验金的收益，本金返还公司。<br /><br />

二、例：推荐注册成功5个人获得推广体验金5000
体验标投资1个月，年利率10%，到期利息收益41.67，5000体验金返还公司，41.67可提现至您个人账户。<br /><br />

三、注册所得的50元现金红包不可提现，只可用于网站真标投资，按投资金额的5%使用，不可单独投资。
投资本金1000元，即总投资金额为1000+（1000*5%）=1050<br /><br />

<h1><strong>活动说明</strong></h1>
1. 活动期间产生的提现等相关费用由用户自行承担<br />
2. 红包及推广体验金只有在大博鑫网站注册的账户通过实名认证、手机认证和邮箱认证后，方可领取<br />
3. 推广体验金仅用于活动体验标，不可与红包同时使用<br />
3. 活动时间：2015.06.18起<br />
4.本活动规则解释权归大博鑫所有，如有疑问请咨询客服或致电400-027-5368</dd>
       </dl>      
    </div>
    <div class="not_sider">
    <h1>公告列表</h1>
    <ul>
    <li><span>2015-07-15</span><a title="关于大博鑫财富系统调整后“可用余额”如何使用的官方公告" href="#">关于大博鑫财富系统调整后"可用余额"如何使用的官方公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富618活动正式上线啦！赶紧来领钱" href="#">大博鑫财富618活动正式上线啦！赶紧来领钱</a></li>
    <li><span>2015-07-15</span><a title="大博鑫线上活动公告" href="#">大博鑫线上活动公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富收费调整公告" href="#">大博鑫财富收费调整公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富调整利息公告" href="#">大博鑫财富调整利息公告</a></li>
 	<li><span>2015-07-15</span><a title="关于大博鑫财富系统调整后“可用余额”如何使用的官方公告" href="#">关于大博鑫财富系统调整后"可用余额"如何使用的官方公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富618活动正式上线啦！赶紧来领钱" href="#">大博鑫财富618活动正式上线啦！赶紧来领钱</a></li>
    <li><span>2015-07-15</span><a title="大博鑫线上活动公告" href="#">大博鑫线上活动公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富收费调整公告" href="#">大博鑫财富收费调整公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富调整利息公告" href="#">大博鑫财富调整利息公告</a></li>
    </ul>  
    <div class="ifenye clearfix">
 		 <span class="isj">上一页</span>
  		 <span class="ifocus">1</span>
  		 <a href="">2</a>
 		 <a href="">3</a>
  		<span class="islx">---</span>
 		 <a href="">30</a>
  		<a href="">下一页</a>
	</div> 
    </div>
 </div>
    </li>
    <li>
      <div class="not_main">
 	<div class="not_content">
       <dl>
       <dt>成功的理财投资 起码要避免这五个问题</dt>
       <span>2015-07-15</span>
       <dd>　　对于我们平时的生活投资理财，急躁、浮躁，赌性过大是不小的问题，常常会对我们的投资成功造成不小的危害。对此，理财师总结了一些投资方面需要避免的五个问题，望引以为戒。<br /><br />
<h3>问题一、跟风投资</h3>
　　跟风投资，对于一部分人来说，可能是适合。一些人找对了最好的时间点，跟最领先的那部分人去做事情，结果容易赚钱。但是对于另外一部分，属于有点“后知后觉”的人群而言，跟风投资失败的几率是比较高的。最典型的莫过于2007年的股市，市场最后到达顶峰前吸引的那部分投资人，大部分就是属于“跟风”而进入股市投资，结果很多最后都亏得比较惨。<br /><br />
<h3>问题二、盲目投资</h3>
　　盲目投资也是投资的大忌。所谓盲目，指的是在介入一项投资前并没有做好相关的功课，且不说是否仔细阅读相关的投资说明、财务数据，有的甚至连投资原理都搞不清而投资，那无疑这类投资是比较盲目的，也容易失败。<br /><br />
<h3>问题三：投资不懂多元化</h3>
　　高收益通常和风险成一定的正比关系。有些投资，如股市，行情好的时候，收益固然佳，但坏的时候，大家也都不知道，跌起来又往往比较狠，割肉又舍不得，很多因此也是亏了钱。其实，嘉丰瑞德理财师建议，对于高收益投资，不是不可以投，而是应该多元化去进行投资，比如股市也配置，其他的基金、固定收益类理财等也配置。多元化的配置的好处是，避免一项投资出现大的风险而造成整体的损失。<br /><br />
<h3>问题四：一味追求高收益</h3>
　　比如在管理学上，有时候我们并不强调凡事都要“亲力亲为”，而是要懂得放权，给合适的人去做，充分发挥他的作用。对于投资来说，其实也是如此。每个人，不可能在方方面面都是行业精英、都是高手。因此在投资中还要懂得借力。比如在投资上，借道专业机构投资人去投资。在理财的疑问上，征询专业、可靠的第三方理财服务机构，获取投资建议。比如嘉丰瑞德这类理财服务机构，可以对各种投资进行比较，帮助投资者鉴别好的投资，配置最合适自身的投资类型。<br /><br />
　　总之，我们在投资生活当中，由于人性所限，总免不了出现些“问题”，但我们如果多一点谨慎，懂得需求合适的帮助的话，会对我们的投资成功产生好处。
</dd>
       </dl>      
    </div>
    <div class="not_sider">
    <h1>资讯列表</h1>
    <ul>
    <li><span>2015-07-15</span><a title="关于大博鑫财富系统调整后“可用余额”如何使用的官方公告" href="#">关于大博鑫财富系统调整后"可用余额"如何使用的官方公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富618活动正式上线啦！赶紧来领钱" href="#">大博鑫财富618活动正式上线啦！赶紧来领钱</a></li>
    <li><span>2015-07-15</span><a title="大博鑫线上活动公告" href="#">大博鑫线上活动公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富收费调整公告" href="#">大博鑫财富收费调整公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富调整利息公告" href="#">大博鑫财富调整利息公告</a></li>
 	<li><span>2015-07-15</span><a title="关于大博鑫财富系统调整后“可用余额”如何使用的官方公告" href="#">关于大博鑫财富系统调整后"可用余额"如何使用的官方公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富618活动正式上线啦！赶紧来领钱" href="#">大博鑫财富618活动正式上线啦！赶紧来领钱</a></li>
    <li><span>2015-07-15</span><a title="大博鑫线上活动公告" href="#">大博鑫线上活动公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富收费调整公告" href="#">大博鑫财富收费调整公告</a></li>
    <li><span>2015-07-15</span><a title="大博鑫财富调整利息公告" href="#">大博鑫财富调整利息公告</a></li>
    </ul>  
    <div class="ifenye clearfix">
 		 <span class="isj">上一页</span>
  		 <span class="ifocus">1</span>
  		 <a href="">2</a>
 		 <a href="">3</a>
  		<span class="islx">---</span>
 		 <a href="">30</a>
  		<a href="">下一页</a>
	</div> 
    </div>
 </div>
    </li>
    <li>
      	 <div class="hezuo">
	   <ul class=" clearfix">
	     <li class="hezuo_li1"  style="margin-top:20px;"><img src="${HomeStatics}/imgs/hezuo3_03.jpg" /></li>
		 <li class="hezuo_li2">
		  <p class="hezuo_li2_p">新浪支付</p>
		  <p >新浪作为全球领先的在线媒体及增值服务提供商具有深厚的互联网基因。而在时下最热门的互联网金融领域，新浪根据其自身的优势与能力，以其子公司新浪支付的业务为基础，深入学习研究国家对 P2P 行业的要求和相关政策，积极参与各部门相关会议，领会精神，确保让 P2P 平台回归线上撮合本质的，建立平台资金第三方托管机制，推出了针对 P2P 行业的一整套资金托管解决方案。新浪支付的合作伙伴能够顺应国家要求，在安全合规的模式下更快速有序的发展壮大自身业务，并最终实现多方共赢</p></li>
	   </ul>
	 </div>	 
	  <div class="hezuo">
	   <ul class=" clearfix">
	     <li class="hezuo_li1"><img src="${HomeStatics}/imgs/hezuo1_03.jpg" /></li>
		 <li class="hezuo_li2">
		  <p class="hezuo_li2_p">网贷之家</p>
		  <p >网贷之家于2011年10月上线，是中国有数的第三方网贷资讯平台，网贷之家是中国首家最大的网络借贷行业门户网站，提供全方位、权威的网贷数据，是您身边的网贷资讯专家，为您的网贷之路保驾护航。网贷之家是致力推动P2P网贷行业发展的资讯门户网站。</p></li>
	   </ul>
	 </div>	
	  <div class="hezuo">
	   <ul class=" clearfix">
	     <li class="hezuo_li1"><img src="${HomeStatics}/imgs/hezuo2_03.jpg"/></li>
		 <li class="hezuo_li2">
		  <p class="hezuo_li2_p">网贷天眼</p>
		  <p >创办于2012年3月28，目前国内网贷行业较为权威的第三方机构。自创立以来，以“正心、正念、正行”的理念服务广大P2P网贷投资者，受到了网贷投资者的推崇。经过多年的发展，已经成为以论坛为基础交流方式，综合提供网贷数据、网贷资讯、平台交流等一系列功能服务，并以监督P2P平台运营为目的的综合性虚拟社区和网络社交平台。</p></li>
	   </ul>
	 </div>	
    </li>
    <li>
       <div class="contact">
       <div class="address clearfix">
         <span class="dzxx">
           <h3>集团总部</h3>
           公司名称：大博鑫(湖北)资产管理有限公司<br/>
           公司网址：www.dbxhb.com<br/>
           企业邮箱：hubeidbx@163.com<br/>
           财富热线：027-86636027 / 027-86636072<br/>
           全国免费服务热线：400-027-5368<br/>
           详细地址：武汉市东湖高新技术开发区光谷大道77号光谷金融港B26栋3层
         </span>
         <img src="${HomeStatics}/imgs/lainxi1_03.jpg"/>
       </div>
       <div class="address addrfgs clearfix">
         <img src="${HomeStatics}/imgs/lianxi4_03.jpg" />
         <span class="dzxx dzfgs">
           <h3>汉口分公司</h3>
		   服务热线：027-85783766 / 027-86636027<br/>
		   详细地址：武汉市江汉区前进四路民间金融街15-23号
         </span>
       </div>
       <div class="address clearfix">
         <span class="dzxx fl">
          <h3>江夏分公司</h3>
          服务热线：027-87916928 / 027-87014557<br/>
          详细地址：武汉市江夏区龙头街18号高新创业服务中心大楼
         </span>
         <img src="${HomeStatics}/imgs/lianxi2_03.jpg" />
       </div>
       <div class="address addrfgs clearfix">
         <img src="${HomeStatics}/imgs/lianxi3_03.jpg" />
         <span class="dzxx dzfgs">
          <h3>咸宁分公司</h3>
          服务热线：0715-8123600 / 0715-8123700<br/>
          详细地址：咸宁市咸安区咸宁大道国际大厦A座4楼
         </span>
       </div>
       <div class="kfzx">
         <h3>客服中心</h3>
         如果您对大博鑫平台有任何疑问，或使用过程中遇到         任何问题，欢迎随时与我们的客服人员联系。<br/>
         在线咨询QQ：4000275368　　　官方QQ群号：293563662
       </div>
 </div>

    </li>
  </ul>
</div>
<!--网站底部-->
<%@ include file="../Common/footer.jsp"%>