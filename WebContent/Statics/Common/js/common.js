function round2(floatData,i){
	var i=i+1;
	var floatStr = (floatData)+"";
	var index = floatStr.indexOf(".");
	if(index!=-1){
			return floatStr.substring(0,(index+i));	
	}
	else
		return floatStr;
}


function makevar(v){
	var d={};
	for(i in v){
		var id = v[i];
		d[id] = $("#"+id).val();
		if(!d[id]) d[id] = $("input[name='"+id+"']:checked").val();
	}
	return d;
}

function postData(url,dataPost,callBack,Dtype){
	var Dtype=Dtype||"json";
	$.ajax({
		url: url,
		data: dataPost,
		timeout: 500000,
		cache: false,
		type: "post",
		dataType: Dtype,
		success: function (d, s, r) {
			if(d){
				callBack(d);
			}else{
				alert("获取数据出错","error");	
			}
		}
	});
}

function getData(url,callBack,dataSend,Dtype){
	var Dtype=Dtype||"html";
	var dataSend=dataSend||{};
	$.ajax({
		url: url,
		data: dataSend,
		timeout: 150000,
		cache: false,
		type: "get",
		dataType: Dtype,
		success: function (d, s, r) {
				alert(d)
			if(d){
				callBack(d);
			}else{
				Mix.alert("获取数据出错");	
			}
		}
	});
}

/**
根据某属性在数组中找元素,attribute为null时直接比较元素
**/
function IndexFromArray(array,attribute,value){
	if(!array)return -1;
	for(var i=0;i<array.length;i++){
		if(attribute!=null){
			if(array[i][attribute]==value)
				return i;
		}else{
			if(array[i]==value)
				return i;
		}
	}
	return -1;
}

/**
替换字符串中所有匹配的元素
**/
String.prototype.replaceAll = function(s1,s2){   
   return this.replace(new RegExp(s1,"gm"),s2);   
}
var _noSerialArray=["extend"];
/**
以json格式序列化js对象,obj为需要序列化的对象，noSerialArray为不需序列的属性
**/
function Serialize(obj){
	try{
	  var otype = typeof obj; 
	  if(otype=="null"||otype=="undefinded")
	  	return "null";
	  var objType = obj.constructor+"";
	  if(objType.indexOf("Object")!=-1){
	  	 var str = "{";
             for(var o in obj){
				if(IndexFromArray(_noSerialArray,null,(o+""))!=-1)
				 	continue;     
                 str += '"'+o+'"' + ":" + Serialize(obj[o]) +",";       
             }
			 
             if(str.substr(str.length-1) == ",")       
                str = str.substr(0,str.length -1);       
              return str + "}";     
	  }else if(objType.indexOf("Array")!=-1){
		   var str = "["; 
			  if(obj.length>0){      
				  for(var oIndex = 0;oIndex<obj.length;oIndex++){   
					  str += Serialize(obj[oIndex]) +",";       
				  }
				  if(str.substr(str.length-1) == ",")       
					  str = str.substr(0,str.length -1);
			  }
              return str + "]";       
	  
	  }else if(objType.indexOf("Boolean")!=-1){
		  return "" + obj + "";   
	  }else if(objType.indexOf("Date")!=-1){
	  	  return "\"" + obj + "\"";   
	  }else if(objType.indexOf("Function")!=-1){
	  	  return "";
	  }else if(objType.indexOf("Number")!=-1){
	  	  return "" + obj + "";   
	  }else if(objType.indexOf("String")!=-1){
	  	  	return "\"" + (obj+"").replaceAll("\\\\","\\").replaceAll("\\\\","\\\\").replaceAll("\"","\\\"").replaceAll("\n","\\\n").replaceAll("\r","\\\r") + "\"";    
	  }
	}
	catch(e){
		alert(e);
	}
}
