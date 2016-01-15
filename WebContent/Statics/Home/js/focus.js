$(function()
  {
	  var page=0;
	  var CParent=$("#focus");
	  var CList=$("#focus li");
	  var CLength=CList.length;var btn="<ul class='cwhUl'>";
	  for(i=0;i<CLength;i++){btn+="<li></li>"}btn+="</ul>";
	  CParent.append(btn);var CCurrent=$(".cwhUl");
	  var CActive=CCurrent.find("li");
	  CParent.hover(function(){clearInterval(picTimer)},function(){if(!CActive.hasClass("active")){CActive.eq(page).addClass("active")}picTimer=setInterval(function(){CActive.eq(page).addClass("active").siblings().removeClass("active");
	  showPic(page);page++;
	  if(page==CLength){page=0}},3000)}).trigger("mouseleave");
	  CActive.click(function(){$(this).addClass("active").siblings().removeClass("active");
	  page=$(this).index();showPic(page)});function showPic(page){CList.eq(page).fadeIn("fast").siblings().fadeOut("fast")}});
// JavaScript Document