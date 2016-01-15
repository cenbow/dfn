<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
		</div>
</div>
<!--df_member_main  END-->
<script type="text/javascript">
$(".ajaxpagebar a").live("click",function() {
    var url = $(this).attr("href");
    $.get(url, function(data) {
        $("#include_page").html(data);
    });
    return false;
});
</script>
<%@ include file="../../Home/Common/footer_member.jsp"%>	