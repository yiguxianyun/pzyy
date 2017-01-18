;(function($, window, document,undefined) {
	$.getUrlParam = function (name){ 
		var reg = new RegExp("(^|&)" + name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var a=window.location.search.substr(1);
		var r =decodeURI(a).match(reg); //匹配目标参数
		if (r != null) {return decodeURI(r[2]);}else{return null; }
	}
	$.转速计算=function (极数,转速){
		var a={2:"2980",4:"1480",6:"990",8:"740",10:"590",12:"490",16:"370","不指定":0};
		$.each(a,function(k,o){
			极数.val()==k?转速.val(o):{};
		});
	}
	//样式设置
	$.fn.zhidu = function (){ 
		this.attr({"readonly":true});
		this.css({"background-color":"#dddddd"});
	}	
	$.zhidu = function (arr){ 
		$.each(arr, function(){
			this.attr({"readonly":true});
			this.css({"background-color":"#dddddd"});
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
	$.fn.加粗 = function (字高,字距,顶距){
		var style="font-size:"+字高+"px;font-weight:bold;letter-spacing:"+字距+"px;" +
				"text-align:center;margin-top:"+顶距+"px;";
		this.attr({"style":style});
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
	
	$.轴功率=function (q,h,xl,md) {
	 	var q=q/3600; 
	 	var zgl=q*h*9.8/xl*100*md;	 	
	 	return zgl.toFixed(1);
	 }
	$.增高=function(event){
		var a=event.target;
		var b=$(a).val().split("\n").length;
//     	alert (b+"=="+a.scrollHeight+"=="+$(a).css("height"));
    	$(a).attr("rows",b);
    }
	
	$.页面居中=function(){
		var a=$(window).width();
		var b=$("body").width();
		var c="0px "+(a-b)/2+"px 300px";
//		alert(a+"kk"+b);
		$("body").css("margin",c); 
	 }
	$.打印=function(){
		$("body").css("margin",0);
		$("#A4表头").A4表头清除();
//		$("#A4分页").A4分页();
		javascript:window.print();
		
		$.页面居中();
		$("#A4表头").A4表头();
	 }
	$.fn.A4表头 = function (){
		this.css({"position":"fixed","width":"210mm","z-index":"10"}); 
		var a=this.height();
		$("#A4正文").css({"padding-top":a,}); 
//		alert(a+"kk");
	}
	$.fn.A4表头清除 = function (){
		this.css({"position":"","width":"","z-index":""}); 
		var a=0;
		$("#A4正文").css({"padding-top":a,}); 
//		alert(a+"kk");
	}
	$.fn.A4分页 = function (){
		var a=$("#A4表头").height();
		this.css({"page-break-before":"always","padding-top":a,}); 		
	}

		
})(jQuery, window, document);










