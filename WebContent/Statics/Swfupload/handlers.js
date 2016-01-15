/**
 * 
 * @version        $Id: handlers.js 1 22:28 2010年7月20日Z tianya $
 * @package        DedeCMS.Administrator
 * @copyright      Copyright (c) 2007 - 2010, DesDev, Inc.
 * @license        http://help.dedecms.com/usersguide/license.html
 * @link           http://www.dedecms.com
 */

//---事件句并------------------------------
function fileQueueError(file, errorCode, message){
    try {
        var imageName = "error.gif";
		var errorName = "";
		if (errorCode === SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
			errorName = "你添加的文件超过了限制！";
		}

		if (errorName !== "") {
			alert(errorName);
			return;
		}
		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			imageName = "zerobyte.gif";
			break;
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			imageName = "toobig.gif";
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
		case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
			alert('上传数量超过最大限制');
			break;
		default:
			alert(errorCode);
			break;
		}
		//addImage("images/" + imageName, 0);
	} catch (ex) {
		this.debug(ex);
	}

}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
	try {
		if (numFilesQueued > 0) {
			this.startUpload();
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadProgress(file, bytesLoaded) {
	try {
		var percent = Math.ceil((bytesLoaded / file.size) * 100);
		var progress = new FileProgress(file,  this.customSettings.upload_target);
		progress.setProgress(percent);
		if (percent === 100) {
			progress.setStatus("创建缩略图...");
			progress.toggleCancel(false, this);
		} else {
			progress.setStatus("上传中...");
			progress.toggleCancel(true, this);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccess(file, serverData) {
	jsonData = eval("("+serverData+")");
	try {
		var progress = new FileProgress(file,  this.customSettings.upload_target);
		if (typeof(jsonData)!="undefined") {
			if(typeof _swfUploadSuccess=="function") _swfUploadSuccess(jsonData);
			progress.setStatus("获取缩略图...");
			progress.toggleCancel(false);
		} else {
			if(typeof _swfUploadFail=="function") _swfUploadFail(jsonData);
			progress.setStatus("有错误！");
			progress.toggleCancel(false);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadComplete(file) {
	try {
		/*  I want the next upload to continue automatically so I'll call startUpload here */
		if (this.getStats().files_queued > 0) {
			this.startUpload();
		} else {
			var progress = new FileProgress(file,  this.customSettings.upload_target);
			progress.setComplete();
			progress.setStatus("所有图片上传完成...");
			progress.toggleCancel(false);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadError(file, errorCode, message) {
	var imageName =  "error.gif";
	var progress;
	try {
		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("Cancelled");
				progress.toggleCancel(false);
			}
			catch (ex1) {
				this.debug(ex1);
			}
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("Stopped");
				progress.toggleCancel(true);
			}
			catch (ex2) {
				this.debug(ex2);
			}
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			imageName = "uploadlimit.gif";
			break;
		default:
			alert(message);
			break;
		}

		//addImage("images/" + imageName, 0);

	} catch (ex3) {
		this.debug(ex3);
	}

}


/* ******************************************
 *	FileProgress Object
 *	Control object for displaying file info
 * ****************************************** */

function FileProgress(file, targetID) {
	this.fileProgressID = "divFileProgress";

	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "progressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;

		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "progressContainer";

		var progressCancel = document.createElement("a");
		progressCancel.className = "progressCancel";
		progressCancel.href = "javascript:;";
		progressCancel.id = "_swfUploadCancel_";
		progressCancel.style.visibility = "hidden";
		progressCancel.appendChild(document.createTextNode(" "));

		var progressText = document.createElement("div");
		progressText.className = "progressName";
		progressText.appendChild(document.createTextNode(file.name));

		//进度条
		var progressBarWrap = document.createElement("div");
		progressBarWrap.className = "progressBarInProgressWrap";

		var progressBar = document.createElement("div");
		progressBar.className = "progressBarInProgress";
		
		progressBarWrap.appendChild(progressBar);
		//进度条

		var progressStatus = document.createElement("div");
		progressStatus.className = "progressBarStatus";
		progressStatus.innerHTML = "&nbsp;";

		this.fileProgressElement.appendChild(progressCancel);
		this.fileProgressElement.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBarWrap);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);

		document.getElementById(targetID).appendChild(this.fileProgressWrapper);

	} else {
		this.fileProgressElement = this.fileProgressWrapper.firstChild;
		this.fileProgressElement.childNodes[1].firstChild.nodeValue = file.name;
	}

	this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
	this.fileProgressElement.className = "progressContainer blue";
	this.fileProgressElement.childNodes[3].childNodes[0].className = "progressBarInProgress";
	this.fileProgressElement.childNodes[3].childNodes[0].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
	this.fileProgressElement.className = "progressContainer green";
	this.fileProgressElement.childNodes[3].childNodes[0].className = "progressBarComplete";
	this.fileProgressElement.childNodes[3].childNodes[0].style.width = "";

};
FileProgress.prototype.setError = function () {
	this.fileProgressElement.className = "progressContainer red";
	this.fileProgressElement.childNodes[3].childNodes[0].className = "progressBarError";
	this.fileProgressElement.childNodes[3].childNodes[0].style.width = "";

};
FileProgress.prototype.setCancelled = function () {
	this.fileProgressElement.className = "progressContainer";
	this.fileProgressElement.childNodes[3].childNodes[0].className = "progressBarError";
	this.fileProgressElement.childNodes[3].childNodes[0].style.width = "";

};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.toggleCancel = function (show, swfuploadInstance) {
	this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
	if (swfuploadInstance) {
		var fileID = this.fileProgressID;
		this.fileProgressElement.childNodes[0].onclick = function () {
			cancelQueue(swfuploadInstance);
			//swfuploadInstance.cancelUpload(fileID);
			return false;
		};
	}
};

function cancelQueue(instance) {
	document.getElementById(instance.customSettings.cancelButtonId).disabled = true;
	instance.stopUpload();
	instance.cancelUpload();
}
/*
obj={
	"w":宽
	"h":高
	"showBar":显示工具栏，前后删,默认显示
	"showInfo":显示注释栏，默认显示
	"info":注册栏内容，默认为空
}
*/
function addImage(src,pid,obj,addStr){
	if(typeof _addImage=="function"){
		var resaddImg =  _addImage(src,pid,obj,addStr);
		if(resaddImg) return true;
	}

	var addStr=addStr||'';
	var hasObj = (typeof obj=="undefined")?false:true;
	try{
	var w=(hasObj && typeof obj.w!="undefined")?obj.w:120;
	var h=(hasObj && typeof obj.h!="undefined")?obj.h:120;
	var showBar=(hasObj && typeof obj.showBar!="undefined")?obj.showBar:true;
	var showInfo=(hasObj && typeof obj.showInfo!="undefined")?obj.showInfo:true;
	var Info=(hasObj && typeof obj.info!="undefined")?obj.info:'';
	var newImgDiv = document.createElement("div");
	var thisId = 'swfImgSn'+pid;
	newImgDiv.className = 'albCt';
	newImgDiv.id = thisId;
	document.getElementById("thumbnails").appendChild(newImgDiv);
	var htmlImg = '<img src="'+src+'" width="'+w+'" height="'+h+'" /><input type="hidden" name="swfimglist[]" value="'+src+'" />';
	var htmlInfo = '<div style="margin-top:10px">注释：<input type="text" name="picinfo[]" value="'+Info+'" class="swfPicInfo" /></div>';
	var htmlBar = '<a href="javascript:;" onclick="javascript:delPic(\''+thisId+'\')">[删除]</a><a href="javascript:;" onclick="javascript:leftPic(\''+thisId+'\')">[前移]</a><a href="javascript:;" onclick="javascript:rightPic(\''+thisId+'\')">[后移]</a>';
	newImgDiv.innerHTML = htmlImg;
	if(showInfo) newImgDiv.innerHTML += htmlInfo;
	newImgDiv.innerHTML += addStr;
	if(showBar) newImgDiv.innerHTML += htmlBar;
	}catch(e){}
}


//swf上传后排序
function rightPic(o){
	 var o = $("#"+o);
	 if( o.next().length > 0) {
		  var tmp = o.clone();
		  var oo = o.next();
		  o.remove();
		  oo.after(tmp);
	 }else{
		alert("已经是最后一个了"); 
	 }
}
//swf上传后排序
function leftPic(o){
	 var o = $("#"+o);
	 if( o.prev().length > 0) {
		  var tmp = o.clone();
		  var oo = o.prev();
		  o.remove();
		  oo.before(tmp);
	 }else{
		alert("已经是第一个了"); 
	 }
}
//swf上传后删除图片start
function delPic(id){
	if(typeof _delPic=="function"){
		var res =  _delPic(id);
		if(res) return true;
	}
	var imgdiv = $("#"+id);
		imgdiv.remove();
}
