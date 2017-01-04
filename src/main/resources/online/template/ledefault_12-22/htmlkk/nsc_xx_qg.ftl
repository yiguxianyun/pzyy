<div class="" style="text-align: center; margin:10px">
	<div class="col-xs-1">
		<b>K</b>
		<input id="k" type="text" class="form-control text-center"  value="" >
	</div>
	<div class="col-xs-1" style="padding-right:0px">			   
		<b>Q测</b>
		<input id="Q测1" type="text" class="form-control text-center"  value="" > 
		<input id="Q测2" type="text" class="form-control text-center"  value="" >    
	</div>
	<div class="col-xs-1" style="padding-left:0px">
		<b>H测</b>
		<input id="H测1" type="text" class="form-control text-center"  value="" > 
		<input id="H测2" type="text" class="form-control text-center"  value="" >    
	</div>
	<div class="col-xs-1" style="padding-left:0px">
		<div class="input-group">
	            <span class="input-group-addon"><b>a</b></span>
	            <input type="text" id="a" class="form-control">
	    </div>
	    <div class="input-group">        
	            <span class="input-group-addon"><b>b</b></span>
	            <input type="text" id="b" class="form-control">
	    </div>
	    <div class="input-group">        
	            <span class="input-group-addon"><b>c</b></span>
	            <input type="text" id="c" class="form-control">
	    </div>		
	</div>
	<div class="col-xs-1" style="padding-right:0px">			   
		<b>Q切</b>
		<input id="Q切" type="text" class="form-control text-center"  value="" > 
	</div>
	<div class="col-xs-1" style="padding-left:0px">
		<b>H切</b>
		<input id="H切" type="text" class="form-control text-center"  value="" > 
	</div>
	<div class="col-xs-1">
		<b>Q需/Q切</b>
		<input id="qiegeBL" type="text" class="form-control text-center"  value="" >
	</div>
	<div class="col-xs-1" style="padding-right:0px">
		<b>原叶轮直径</b>
		<input id="yuanZJ" type="text" class="form-control text-center"  value="" >
		<b>原效率</b>
		<input id="yuanXL" type="text" class="form-control text-center"  value="" >
	</div>
	<div class="col-xs-1" style="padding-left:0px">
		<b>切割后直径</b>
		<input id="qieZJ" type="text" class="form-control text-center"  value="" >
		<b>切割后效率</b>
		<input id="qieXL" type="text" class="form-control text-center"  value="" >
	</div>

	
	<div class="col-xs-2 col-xs-offset-1" style="clear:both;">
		<textarea id="ceshisj"  class="form-control" rows="2" placeholder="在这里粘贴两个测试点数据，或者在上方单个输入！"></textarea>
	</div>	
</div>
<script type="text/javascript">
$(function(){
	$("#k,#a,#b,#c,#Q切,#H切,#qiegeBL,#qieZJ,#qieXL").attr({"readonly":true,"style":"background-color:#dddddd"});
});
$("#ceshisj").change(function(){
	var reg=/[\s]+/g;					
	var arr=$("#ceshisj").val().split(reg);
	$("#Q测1").val(arr[0]);
	$("#H测1").val(arr[1]);
	$("#Q测2").val(arr[2]);
	$("#H测2").val(arr[3]);
	jisuanQGD();

});
$("#H测2,#yuanZJ,#yuanXL").change(function(){
	jisuanQGD();

});
function jisuanQGD(){
	$("#k,#a,#b,#c,#Q切,#H切,#qiegeBL").val("");
	var k=$("#h").val()/Math.pow($("#q").val(),2);
	$("#k").val(k);
	var Q测1=$("#Q测1").val();var H测1=$("#H测1").val();
	var Q测2=$("#Q测2").val();var H测2=$("#H测2").val();
	var a=k*(Q测2-Q测1);var b=(H测1-H测2);var c=Q测1*(H测2-H测1)-H测1*(Q测2-Q测1);
	$("#a").val(a);$("#b").val(b);$("#c").val(c);
	var Q切=$("#Q切").val();var H切=$("#H切").val();
	Q切=(-b+Math.pow((b*b-4*a*c),0.5))/(2*a);
	$("#Q切").val(Q切.toFixed(1));
	$("#H切").val((Q切*Q切*k).toFixed(1));
	var qiegeBL=$("#q").val()/Q切;
	$("#qiegeBL").val(qiegeBL.toFixed(2));
	
	var qieZJ=$("#yuanZJ").val()*qiegeBL;
	$("#qieZJ").val(qieZJ.toFixed(1));
	var qieXL=$("#yuanXL").val()*Math.pow(qiegeBL,3);
	$("#qieXL").val(qieXL.toFixed(1));
	
}

















</script>  
