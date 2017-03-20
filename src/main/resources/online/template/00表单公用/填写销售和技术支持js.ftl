	$.ajax({  
        type : "post",  
        url : "通用.do?查用户&对象=实名",  
        data : {},  
        async : false,  
        success : function(data){  
        	data = $.parseJSON(data);
        	$("#销售人员").val(data);
        }  
	});
	
	$.ajax({  
        type : "post",  
        url : "通用.do?查技术支持",  
        data : {},  
        async : false,  
        success : function(data){  
        	data = $.parseJSON(data);
        	var 默认技术支持='';
        	$.each(data, function(k,o){
        		if ($.inArray(o.realname,["程彪","刘丁魁","刘玉明"])!=-1){
//        			$("#技术支持").val(o.username);
        			$("#技术支持").val(o.username);
        			默认技术支持='有';
        			return false
        		}        		
			});
        	if (默认技术支持==''){$("#技术支持").val(data[0].username);}
        }  
	});
	
	$("#技术支持").autocomplete({
	      source: function( request, response ) {
	    	  $.post("通用.do?查技术支持",
	  				{term: request.term},
	  			function(data){
	  					data = $.parseJSON(data);
	  					response( $.map( data, function( item ) {
	  		            	return {label: item.realname,value: item.username }
	  		            }));
	  			});          
	        },
	        minLength: 0,
	    }).focus(function(){$(this).autocomplete("search");});	
	
	
	
	
	
	
	
	