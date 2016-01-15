<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/headerMeta.jsp"%>
<title>提示信息</title>
<!-- top start -->
<%@ include file="../Common/headerBody.jsp"%>
<style type="text/css">
.system-message{ height:400px; width:1000px; margin:0 auto; position:relative;}
.success{ width:600px;height:200px; position:absolute; top:50%; left:50%; margin-left:-200px; margin-top:-100px}
.success h1{height:50px; line-height:50px; font-size:30px; color:#090; font-family:微软雅黑;}
.jump{ font-family:微软雅黑; height:30px; line-height:30px; font-size:16px}
.jump a{text-decoration:underline}
.df_list_banner_wper{ height:45px;background: none;}
</style>
<include file="Common:_header_body" group="Home"/>

    <!--中部开始-->
        <div class="system-message">
            <div class="success">
                <h1>${msg}</h1>
                <p class="jump">
                页面自动 <a id="href" href="${jumpUrl}">跳转</a> 等待时间： <b id="wait">${showSecond}</b>秒
                </p>
            </div>
        </div>
        <script type="text/javascript">
        (function(){
        var wait = document.getElementById('wait'),href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                location.href = href;
                clearInterval(interval);
            };
        }, 1000);
        })();
        </script>
        
   <!--中部结束-->

<%@ include file="../Common/footer.jsp"%>