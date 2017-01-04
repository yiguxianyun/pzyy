<script type="text/javascript">
$(document).ready(function(){
// 	 alert("kk");
//初始查询见电机-js
	
	$("#bxh,#djjs").change(function(){
		cxBJG();
	});	
	设置样式();
	//改变后填价格重新
	txJiaGCX();
	jsBZHJCX();
	cxFLJGCX();
	$(document.getElementById('nsc_sj_beng[0].f_czxs')).change(function(){
		jsFLXJ();
	});

	

});

var dataBJ;

function bbf找对象(){
	var 对象=new Array();
// 	对象['jgbh']=$(document.getElementById('nsc_sj_beng[0].jgbh'));
	<#list field['${sub}'].fieldNoAreaList as subTableField >
	<#assign zdmc=subTableField.field_name>					
	对象['${zdmc}']=$(document.getElementById('nsc_sj_beng[0].${zdmc}'));
	</#list>	
	return 对象;
}
//查询泵价格
function cxBJG() {
	var 对象=bbf找对象();
	对象['jgbh'].val($("#bxh").val()+'-'+$("#djjs").val());
	var jgbh=对象['jgbh'].val();
	$.post("选型报价.do?cxBJG",
			{jgbh:jgbh},
		function(data){		
			data = $.parseJSON(data);		
			dataBJ=data;
			txJiaG();
			cxFL();
		});
}
//填写价格
function txJiaG() {
	var 对象=bbf找对象();
	var arr1 = [对象['jg_bk'],对象['jg_zc'],对象['jg_jf'],对象['jg_zt'],对象['jg_mfh'],对象['jg_yl'],对象['z_bxl']
				,对象['z_bkzcjf'],对象['dz'],对象['dzzj']];
	$.each(arr1, function(){
		this.val("");
		});
	对象['jg_bk'].val(dataBJ[对象['cz_bk'].val()]);
	对象['jg_zc'].val(dataBJ[对象['cz_zc'].val()]);
	对象['jg_jf'].val(dataBJ[对象['cz_jf'].val()]);
	对象['jg_zt'].val(dataBJ[对象['cz_zt'].val()]);
	对象['jg_mfh'].val(dataBJ[对象['cz_mfh'].val()]);
	对象['jg_yl'].val(dataBJ[对象['cz_yl'].val()]);	
	var arr1 = [对象['jg_bk'],对象['jg_zc'],对象['jg_jf'],对象['jg_zt'],对象['jg_mfh'],对象['jg_yl'],对象['z_bxl'],对象['z_bkzcjf']];
	$.each(arr1, function(){
		this.val()==""?this.val(0):null;
		});
	var z_bkzcjf=parseFloat(对象['jg_bk'].val())+parseFloat(对象['jg_zc'].val())+parseFloat(对象['jg_jf'].val());
	对象['z_bkzcjf'].val(z_bkzcjf);	
	对象['z_bxl'].val(dataBJ['系列']);
	对象['dz'].val(dataBJ['底座']);
	var dzzj=对象['bjxs'].val()*dataBJ['底座'];
	对象['dzzj'].val(dzzj);
	
	cxCJXS(对象['z_btcz'].val(),对象['z_bxl'].val(),对象['z_cjxs'],z_bkzcjf,对象['z_btj']);
}
//查询差价系数
function cxCJXS(z_btcz,z_bxl,对象z_cjxs,z_bkzcjf,对象z_btj) {	
	$.ajax({  
        type : "post",  
        url : "选型报价.do?cxCJXS",  
        data : {z_btcz:z_btcz,z_bxl:z_bxl},  
        async : false,  
        success : function(data){  
	        data = $.parseJSON(data);  
	        对象z_cjxs.val("");
			对象z_cjxs.val(data['系数']);
			对象z_btj.val("");
			对象z_btj.val(z_bkzcjf*data['系数']);
			jsBZHJ();
        }  
   }); 
}
//计算泵折后价
function jsBZHJ() {
	var 对象=bbf找对象();
	var btzjzFS=0;
	var arr1 = [对象['jg_bk'],对象['jg_zc'],对象['jg_jf'],对象['jg_zt'],对象['jg_mfh'],对象['jg_yl']];
	$.each(arr1, function(){
		btzjzFS += parseFloat(this.val());
		});	
	对象['sjfs'].val()=="分项计算"?对象['btzjz'].val(btzjzFS):对象['btzjz'].val(对象['z_btj'].val());
	对象['btzhj'].val("");
	对象['btzhj'].val((对象['btzjz'].val()*对象['bjxs'].val()).toFixed());
	cxDJLS();
}
//查询地脚螺栓
function cxDJLS() {
	var 对象=bbf找对象();
	对象['djls'].val("");
	对象['btdj'].val("");
	var re=/\w+-\w+/;
	var bxh=re.exec($("#bxh").val());
// 	alert(bxh);	
	$.ajax({  
        type : "post",  
        url : "选型报价.do?cxDJLS",  
        data : {bxh:bxh[0]},  
        async : false,  
        success : function(data){  
	        data = $.parseJSON(data);  
	        对象['djls'].val(data['地脚价']);
			对象['btdj'].val(对象['btzhj'].val()*1+data['地脚价']*1);
			jsBBFJG();
        }  
   }); 
}
//查询法兰
function cxFL() {
	var 对象=bbf找对象();
	var arr1 = [对象['f_jkzj'],对象['f_jkjg'],对象['f_ckzj'],对象['f_ckjg'],对象['f_xj']];
	$.each(arr1, function(){
		this.val("");
		});
// 	alert(bxh);	
	$.ajax({  
         type : "post",  
         url : "选型报价.do?cxFL",  
         data : {动作:"查法兰",bxh:$("#bxh").val()},  
         async : false,  
         success : function(data){  
           data = $.parseJSON(data);  
           对象['f_jkzj'].val(data['进口直径']);
			对象['f_jkyl'].val(data['进口压力']);
			对象['f_ckzj'].val(data['出口直径']);
			对象['f_ckyl'].val(data['进口压力']);
			cxFLJG(data['进口直径'],data['进口压力'],对象['f_jkjg']);
			cxFLJG(data['出口直径'],data['出口压力'],对象['f_ckjg']);
			jsFLXJ();
         }  
    }); 
}
function cxFLJG(zj,yl,objGJ) {
	$.ajax({  
        type : "post",  
         url : "选型报价.do?cxFL",  
         data : {动作:"查价格",zj:zj,yl:yl},  
         async : false,  
         success : function(data){  
           data = $.parseJSON(data);  
           objGJ.val(data['价格']);  
         }  
    }); 
}
function jsFLXJ() {
	var 对象=bbf找对象();
	对象['f_xj'].val("")
	var xj1=对象['f_jkjg'].val()*1+对象['f_ckjg'].val()*1;
	var xj=xj1*对象['f_czxs'].val();
	对象['f_xj'].val(xj);
	jsBBFJG();

}
function jsBBFJG() {
	var 对象=bbf找对象();
	对象['bbfjg'].val("");
	var bbfjg=对象['btdj'].val()*1+对象['dzzj'].val()*1+对象['f_xj'].val()*1;
	对象['bbfjg'].val(bbfjg.toFixed());

}
//填价格重新
function txJiaGCX() {
	var 对象=bbf找对象();
	var arr1 = [对象['cz_bk'],对象['cz_zc'],对象['cz_jf'],对象['cz_zt'],对象['cz_mfh'],对象['cz_yl'],对象['z_btcz']];
	$.each(arr1, function(){
		this.change(function(){txJiaG();});
		});
}
function jsBZHJCX() {
	var 对象=bbf找对象();
	var arr1 = [对象['sjfs'],对象['bjxs'],对象['djls']];
	$.each(arr1, function(){
		this.change(function(){jsBZHJ();});
		});
}
function cxFLJGCX() {
	var 对象=bbf找对象();
	var arr1 = [对象['f_jkzj'],对象['f_ckzj'],对象['f_ckyl'],对象['f_jkyl'],对象['f_czxs']];
	$.each(arr1, function(){
// 		this.attr("id").indexOf("_jk")!=-1?
		this.change(function(){
// 			alert($(this).attr("id"));
			var objJK=对象['f_jkjg'];
			var objCK=对象['f_ckjg'];
			cxFLJG(对象['f_jkzj'].val(),对象['f_jkyl'].val(),objJK);
			cxFLJG(对象['f_ckzj'].val(),对象['f_ckyl'].val(),objCK);
			jsFLXJ();
			jsBBFJG();
			});
		});
}
function 设置样式() {
	var 对象=bbf找对象();
	var arr1 = [对象['jgbh'],对象['btzjz'],对象['dz'],对象['djls'],对象['btzhj']
				,对象['jg_bk'],对象['jg_zc'],对象['jg_jf'],对象['jg_zt'],对象['jg_mfh'],对象['jg_yl']
				,对象['z_bxl'],对象['z_bkzcjf'],对象['z_cjxs'],对象['z_btj'],对象['f_jkjg'],对象['f_ckjg']];
	$.each(arr1, function(){
		this.attr({"readonly":true,"style":"background-color:#dddddd"});
	});
	var arr1 = [对象['btdj'],对象['dzzj'],对象['f_xj'],对象['bbfjg']];
	$.each(arr1, function(){
		this.attr({"readonly":true,"style":"background-color:#C7EDCC"});
	});
	
	
	
	
	
}















</script>  

 