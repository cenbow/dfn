<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>我的消息_${_siteInfo_.siteName}</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
	<!--df_member_main  START-->
	<%@ include file="../Common/left.jsp"%>
     <!--df_member_content_r  START-->       
          <div class="df_member_content_r">
          	      <h2 class="df_member_jfh2">
                      我的消息 
                  </h2>
                  <div class="df_member_jfactive">
                        <ul class="df_member_jfacul">
                             <li>
                                 <span data="all" class="df_member_jfaccur">全部</span>
                             </li>
                              <li>
                                 <span data ="0" >未读</span>
                             </li>
                              <li>
                                 <span data ="1" >已读</span>
                             </li>
                             <li>
                                 <a href="javascript:markAll();">全部标记为已读</a>
                             </li>
                        </ul>
                  </div>
                  <!--  -->
                  <div id="include_page" >
						<jsp:include page="list_page.jsp"/>
				</div>
                  <!--  -->
  <script type="text/javascript">
   	
   	$(".df_member_jfacul li span[data]").click(function(){
   		
   		var data = $(this).attr("data");
   		data = (data == "all")?"":data;
   		var p = {};
   		p["has_read"]= data;
   		$(this).parent("li").siblings("li").find("span[data]").removeClass("df_member_jfaccur");
   		$(this).addClass("df_member_jfaccur");
   		var time1 = new Date().getTime();
   		$("#include_page").html(loadingPageHtml);
   		getData("${dfn:U('member/Sitemsg/list_page')}",function(backHtml){
   			var time2 = new Date().getTime();
   			if((time2-time1)<500)  setTimeout(function(){$("#include_page").html(backHtml);},500);
   		},p,"html");
   	}); 
   	
   	function markAll()
   	{
   		getData("${dfn:U('member/Sitemsg/markAll')}",function(backHtml){
   			alert(backHtml.status);
   			if(backHtml.status == "1")
   				{
			   		alert("全部已设为'已读'！")			
   					location.reload();
   				}
   		},{},	"json")
   	}
   	
   </script>         
                  
              
          
          
          </div>  
     <!--df_member_content_r  END-->       
            
       

<!--df_member_main  END-->
<!-- 弹出框开始 -->
<div  class="df_member_ztckcon" style="display:none;" id="df_member_msgDiv">
       <h2>
           Bie整没有的，4张加息券直达你账户，最高1%加息<span id="msgShut">x
           </span>
       </h2>
       <h4>
        双11过后也有狂欢，0.4%-1%加息券直接送到你帐号，国有担保项目专享，投资10000元及以上可用。
       </h4>
       <p>
           活动说明：
       </p>
       <P>
           1.活动时间为2014年11月14日20:00:00-11月30日23:59:59
       </P>
       <p>
           2.共4张加息券将自动发放到您积木盒子的帐号中，可以去“我的账户-p2p账户-优惠券”中查看，请在投资项目时勾选相应的加息券，以便获得奖励
       </p>
       <p>
           3.加息券仅限国有担保项目使用（不含债权转让），需在活动期间使用，不限使用次数
       </p>
       <p>
           4.你同加息券的使用说明详见优惠券
       </p>
       <p>
           5.奖励将以现金券形式，按月随息发放，请及时兑换现金券
       </p>
       <p>
           6.该加息券不可与其他加息券奖励同时使用
       </p>
       <p>
           7.本活动遵循积木盒子法律声明，规则解释权归积木盒子所有
       </p>
       <h6>2014-11-17 11:17:46</h6>
</div>
</body>

<div id="df_member_bgDiv"></div>
<script type="text/javascript">
 
function showDetail() { 
//背景
  var bgObj=document.getElementById("df_member_bgDiv");
  bgObj.style.width = document.body.offsetWidth + "px";
  bgObj.style.height = screen.height + "px";

//定义窗口
  var msgObj=document.getElementById("df_member_msgDiv");
  msgObj.style.marginTop = -75 +  document.documentElement.scrollTop + "px";

//关闭
  document.getElementById("msgShut").onclick = function(){
  bgObj.style.display = msgObj.style.display = "none";
  }
  msgObj.style.display = bgObj.style.display = "block";
  msgDetail.innerHTML="111"
}

</script>
 
<%@ include file="../Common/footer.jsp"%>
