<%@ taglib uri="http://www.dfp2p.com" prefix="dfn"%>
<!DOCTYPE html>
<html>
<head>
	
<title>filetree</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	
		<script src="${SiteStatics}Common/js/common.js" type="text/javascript"></script>
		<script src="${SiteStatics}Common/js/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="${SiteStatics}Common/js/jquery.editable-1.3.3.js" type="text/javascript"></script>
		<script src="${SiteStatics}Common/FileTree/jquery.easing.js" type="text/javascript"></script>
		<script src="${SiteStatics}Common/FileTree/jqueryFileTree.js" type="text/javascript"></script>
		<link href="${SiteStatics}Common/FileTree/jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen" />
		<style type="text/css">
            .subCss{
                background:url(${SiteStatics}Common/images/indicator_tiny_red.gif) 100px center no-repeat;
            }
        </style>
</head>

<body>
${webroot}
		<div class="example">
			<h2>Default options</h2> 
			<div id="fileTreeDemo_1" class="FTPNAME"></div>
		</div>
        
        <select name="ftp" id="ftplist" onChange="changFtp()">
        	<option value="FM1">1号FTP</option>
        	<option value="FM2">2号FTP</option>
        </select>
        
        <div id="drop_area">将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/>将图片拖拽到此区域sssssssssssssssssssssssssssss<br/></div>
 		<div id="preview"></div>
 <script type="text/javascript">
 $(function(){ 
	    //阻止浏览器默认行。 
	    $(document).on({ 
	        dragleave:function(e){    //拖离 
	            e.preventDefault(); 
	        }, 
	        drop:function(e){  //拖后放 
	            e.preventDefault(); 
	        	uploadFile(e);
	        }, 
	        dragenter:function(e){    //拖进 
	            e.preventDefault(); 
	        }, 
	        dragover:function(e){    //拖来拖去 
	            e.preventDefault(); 
	        } 
	    }); 
	}); 
 	function uploadFile(e){
        var fileList = e.originalEvent.dataTransfer.files; //获取文件对象 
        //检测是否是拖拽文件到页面的操作 
        if(fileList.length == 0){ 
            return false; 
        } 
        //检测文件是不是图片 
        /*
        if(fileList[0].type.indexOf('image') === -1){ 
            alert("您拖的不是图片！"); 
            return false; 
        } 
         */
         alert(fileList[0]);
        //拖拉图片到浏览器，可以实现预览功能 
        var img = window.webkitURL.createObjectURL(fileList[0]); 
        var filename = fileList[0].name; //图片名称 
        var filesize = Math.floor((fileList[0].size)/1024);  
        if(filesize>500){ 
            alert("上传大小不能超过500K."); 
            return false; 
        } 
        var str = "<img src='"+img+"'><p>图片名称："+filename+"</p><p>大小："+filesize+"KB</p>"; 
        $("#preview").html(str); 
         
        //上传 
        xhr = new XMLHttpRequest(); 
        xhr.open("post", "upload.php", true); 
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest"); 
         
        var fd = new FormData(); 
        fd.append('mypic', fileList[0]); 
             
        xhr.send(fd); 		
 	}
 </script>       
        
        
        
        
		<script type="text/javascript">
			
			function changFtp(){
				var ftp=$("#ftplist").val();
				$('#fileTreeDemo_1').data("ftpSN",ftp).fileTree({ root: '/', script: '${dfn:U("home/ftp/getPathHtml")}?ftp='+ftp }, function(file) { 
					return true;
				},function(c){
					$(c).find("a").editable({editBy:"click.editable",editClass:'ipt',onSubmit:onSub});
					$(this).trigger("click.editable");
				});
			};
			function onSub(content){
				var ftp=$(this).parents(".FTPNAME").data("ftpSN");
				var t=this;
				t.addClass("subCss");
				if(content.current==content.previous){
					t.removeClass("subCss");
					return true;
				}else{
					var oldName=$(t).attr("rel");
					var newPath=oldName.split("/");
					var fileName=newPath.pop();
					var newName = newPath.join("/")+content.current;
					var pd={"oldName":oldName,"newName":newName};
					postData('${dfn:U("home/ftp/rename")}?ftp='+ftp,pd,function(d){
						t.removeClass("subCss");
						alert(d.status+"=="+d.msg);
					})
				}
			}
			</script>
</body>
</html>
