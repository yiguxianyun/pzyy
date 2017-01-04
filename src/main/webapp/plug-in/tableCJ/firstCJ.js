(function($){
	///copy by安卓无忧，更多例子http://android.myapp.com/myapp/detail.htm?apkName=com.shandong.mm.androidstudy
     var defaults={
	     cjtable:"cjtable",
		 cjtd:"cjtd"
	 };
	 //定义一个点对象
	 function Point(){
		   this.x=0;
		   this.y=0;
     }
	 
	  $.fn.selectTable=function(){	             
			 this.find("tbody tr td:gt(0)").each(function(){
					 var colIndex=$(this).index();
					   if(colIndex==0){
						return;
					 }					 
					 $(this).attr("isEdit",'no').addClass("selectClass").attr("startMouseDown","no");
			 });
	 }

	 ///初始化表格
	 $.fn.createEditTable=function(){
	     var tb=this;
		 this.addClass(defaults.cjtable);
		 this.find("td").addClass(defaults.cjtd);
		 $(document).bind("mousedown",docDownhandle);
		 //处理鼠标按下事件
         this.find("tbody tr td:gt(0)").mousedown(function(event){	
              event.stopPropagation();		 
			 if(event.button!=2){
			        var colIndex=$(this).index();
					if(colIndex==0){
					  return;
					}
					if($(this).find("input").get().length>0){
						  return;
					}
					endEdit();
					
				    tb.find("td").removeClass("selectClass").attr("startMouseDown","no");					
					$(this).attr("startMouseDown","yes");
					$(this).addClass("selectClass");				
					tb.find("tbody td").each(function(){
					     var colIndex=$(this).index();
							if(colIndex==0){
							  return;
							}
					     $(this).bind("mousemove",cellMove);
					});
					$(document).bind("mouseup",uphandle);	
					
				}			   		      	   
		   }).bind("dblclick",dblclick);	
        		   
		   $(document).bind("keydown",nt);
		   ///鼠标移动的处理事件
		    function cellMove(){			   
			    setSelectRegion.call(this);
	        }
			
			function docDownhandle(){
			    tb.find("td").removeClass("selectClass").attr("startMouseDown","no");
			    endEdit();
			}
			//鼠标抬起的处理事件
			 function uphandle(tempTd){
			      tb.find("tbody td").unbind("mousemove",cellMove);
				 // $(tempTd).parent().parent().find("td").unbind("mousemove",cellMove);
				  $(this).unbind("mouseup",uphandle);
					 // alert("up");
			  }
			  ///设置选中区域
			  function setSelectRegion(){
					var spoint=new Point();
					var epoint=new Point();
					 var startCells=$(this).parent().parent().find("td[startMouseDown='yes']").get();
					 if(startCells.length==0){
						 return ;
					 }
					 
					 var startCell=startCells[0];
					 endCell=this;
					 if(startCell==endCell){
						return;
					 }
					 $(this).parent().parent().find("td").removeClass("selectClass");
					spoint.x=$(startCell).index()<$(endCell).index()?$(startCell).index():$(endCell).index();
					spoint.y=$(startCell).parent().index()<$(endCell).parent().index()?$(startCell).parent().index():$(endCell).parent().index();
					epoint.x=$(startCell).index()>$(endCell).index()?$(startCell).index():$(endCell).index();
					epoint.y=$(startCell).parent().index()>$(endCell).parent().index()?$(startCell).parent().index():$(endCell).parent().index();
					for(var i=spoint.y;i<=epoint.y;i++){
					   for(var j=spoint.x;j<=epoint.x;j++){
						  tb.find("tbody tr").eq(i).children().eq(j).addClass("selectClass");					  
					   }
					}
					
			 }
			 ///从单元格中获取值
			 function getValueFromCell(){
					return $(this).text();
			 }
			 //处理双击编辑事件
			 function dblclick(event){    
				  startEdit.call(this);
			  }
			  ///开始编辑
			  function startEdit(startEditValue){
					if($(this).find("input").get().length>0){
					   return;
					}
					endEdit();
				   var inpwidth=$(this).css("width");
				   var inpheight=$(this).css("height");
				   
				   var cellValue=getValueFromCell.call(this);
				   if(startEditValue!=null){
				      cellValue=startEditValue;
				   }
				   $(this).attr("isEdit","yes");
				   $(this).parent().parent().find("td").removeClass("selectClass");		
				   ///控制input只允许输入数字和小数点
				   var inp;		   
				   inp=$("<input type='text' style='width:50px;height:30px'>"+"</input>");
				   
				   inp.on('keyup', function (event) {
						var $inp = $(this);
						//响应鼠标事件，允许左右方向键移动 
						event = window.event || event;
						if (event.keyCode == 37 | event.keyCode == 39) {
							return;
						}
						//先把非数字的都替换掉，除了数字和. 
						$inp.val($inp.val().replace(/[^\d.]/g, "").
							//只允许一个小数点              
							replace(/^\./g, "").replace(/\.{2,}/g, ".").
							//只能输入小数点后两位
							replace(".", "$#$").replace(/\./g, "").replace("$#$", ".").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));
				});
					inp.on('blur', function () {
						var $inp = $(this);
						$inp.val(($amountInput.val().replace(/\.$/g, "")));
                   });
				   
				   inp.val(cellValue);
				   inp.css("width",inpwidth);
				   inp.css("height",inpheight);			
				   $(this).html(inp);
				   $("#t1").focus();
				   inp.focus();												   
			 }
			 ///结束编辑
			 function endEdit(){ 
				var currentEditCells=tb.find("tbody td[isEdit='yes']").get();
				var currentEditCell;
				if(currentEditCells.length>0){
					currentEditCell=currentEditCells[0];
					if($(currentEditCell).find("input").get().length==0){
						  return;
					}
					 var ivalue=$(currentEditCell).find("input").val();
					 $(currentEditCell).html("");
					 $(currentEditCell).append(ivalue);
					 $(currentEditCell).attr("isEdit",'no');
				}		
			  }
			  ///先把要粘贴的数据放入textArea控件中
			  function dealwithData(event) { 
				var ss = document.getElementById("textArea"); 
				var reg=/[\s]+/g;					
				var arr=ss.value.split(reg);			         
				ss.blur(); 
				dealCtrlV(arr);
			  } 
			  //处理ctrl+v
			 function dealCtrlV(arr){
				   var arrtd=tb.find(".selectClass").get();
				   for(var i=0;i<arrtd.length;i++){
					   if(i<arr.length&&arr[i]!=""){
						  if(!isNaN(arr[i])){
							  	 $(arrtd[i]).html("");
					             $(arrtd[i]).append(arr[i]);
					            $(arrtd[i]).attr("isEdit",'no');
                          //     $(arrtd[i]).html(arr[i]);
                         }
  
					   }
					   
				   }
					
			}	
			///处理键盘上下左右移动
			function nt(event) { 
					if (event.ctrlKey && event.keyCode == 86) { 
						var ss = document.getElementById("textArea"); 
						$(ss).focus(); 
						$(ss).select(); 
						// 等50毫秒，keyPress事件发生了再去处理数据 
						setTimeout(dealwithData,50); 
					} else{
					    
					     var currentEditCells=tb.find("tbody td[isEdit='yes']").get();
						  var currentEditCell;
						 if(currentEditCells.length>0){
						    currentEditCell=currentEditCells[0];
						   
						 }
						
						 var arrtd=tb.find("tbody td.selectClass").get();						
						 if(arrtd.length==1||currentEditCell!=null){
								 var currentSelectCell;
								 if(currentEditCell!=null){
									currentSelectCell=currentEditCell;
								 }else{
									currentSelectCell=arrtd[0];
								 }
								  

								  var myColIndex=$(currentSelectCell).index();
								   var myRowIndex=$(currentSelectCell).parent().index();
								  
								if(event.keyCode == 37){//LEFT左
										event.stopPropagation();
										 event.preventDefault();
										endEdit.call(currentSelectCell);
										tb.find("td").removeClass('selectClass');
										if(myColIndex==1){
										   myColIndex=0;
										}
										$(currentSelectCell).parent().find('td:eq('+(--myColIndex)+')').addClass('selectClass');										                     
								}else if (event.keyCode == 39){//RIGHT右
										event.stopPropagation();
										 event.preventDefault();
										endEdit.call(currentSelectCell);
										tb.find("td").removeClass('selectClass');
										if($(currentSelectCell).parent().find('td:eq('+(++myColIndex)+')').get().length==0){
										   $(currentSelectCell).parent().find('td:eq(1)').addClass('selectClass');
										}else{
										   $(currentSelectCell).parent().find('td:eq('+(myColIndex)+')').addClass('selectClass');
										 }										
			   
								}else if (event.keyCode == 38){//UP上
									event.stopPropagation();
									 event.preventDefault();
									endEdit.call(currentSelectCell);
									tb.find("td").removeClass('selectClass');
								   $(currentSelectCell).parent().parent().find('tr:eq('+(myRowIndex-1)+')').find('td:eq('+(myColIndex)+')').addClass('selectClass');				
								}else if (event.keyCode == 40){//DOWN下
									event.stopPropagation();
									event.preventDefault();
									endEdit.call(currentSelectCell);
									tb.find("td").removeClass('selectClass');
									if($(currentSelectCell).parent().parent().find('tr:eq('+(myRowIndex+1)+')').get().length==0){
									   $(currentSelectCell).parent().parent().find('tr:eq(0)').find('td:eq('+(myColIndex)+')').addClass('selectClass');
									}else{
										$(currentSelectCell).parent().parent().find('tr:eq('+(myRowIndex+1)+')').find('td:eq('+(myColIndex)+')').addClass('selectClass');
									 }				
								}else {
									 var re=/[0-9,a-z,A-Z]$/; 
									 var str=String.fromCharCode(event.keyCode); 
									  if(re.test(str)){
										 if(currentEditCell==null&&currentSelectCell!=null){
										   startEdit.call(currentSelectCell,"");
											  //  alert(re.test(str));
										 }
											 
								   }
								   
								}
						 }
					}					
				 }
	 }
	
	

})(jQuery);
