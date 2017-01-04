;(function($, window, document,undefined) {
	$.getUrlParam = function (name){ 
		var reg = new RegExp("(^|&)" + name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r =window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null) {return decodeURI(r[2]);}else{return null; }
	}
	
	//样式设置
	$.fn.zhidu = function (){ 
		this.attr({"readonly":true,"style":"background-color:#dddddd"});
	}	
	$.zhidu = function (arr){ 
		$.each(arr, function(){
			var style=this.attr("style")+";background-color:#dddddd";			
			this.attr({"readonly":true,"style":style});
			});
	}
	$.变绿 = function (arr){ 
		$.each(arr, function(){
			var style=this.attr("style")+";background-color:#C7EDCC";			
			this.attr({"readonly":true,"style":style});
			});
	}
	$.fn.juzhong = function (){ 
		this.attr({"style":"text-align:center"});
	}
	$.fn.jiacuP = function (){
		this.attr({"style":"font-size:120%;font-weight:bold;text-align:center;margin-bottom:-10px;"});
	}
	$.fn.jiahx = function (){//下方加横线
		this.after('<hr class="text-info" style="margin:-5px;border:1px dashed ;">');
	}

	
	//特殊id找对象：$(document.getElementById('nsc_sj_dj[0].glyl'))
	$.找对象 = function (ziduanMC,zibiaoMC){ 
		var 对象={};	
		$.each(ziduanMC, function(){
			var str=zibiaoMC+'.'+this;
//			alert(str);
			对象[this]=$(document.getElementById(str));
//			alert(对象[this].attr('name'));
			});
		return 对象;
	}
	
	
	
	
	
	
	
	
	
	
})(jQuery, window, document);