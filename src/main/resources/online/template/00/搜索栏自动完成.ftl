$("#${config_id}Listtb :input[id]").each(function(){
	  var 字段=$(this).attr("id"); 
	  $(this).autocomplete({
	      source: function( request, response ) {
	    	  $.post("自动完成.do?单字段",
	  				{term: request.term,表名:"${config_id}",字段:字段},
	  			function(data){
	  					data = $.parseJSON(data);
	  					response( $.map( data, function( item ) {
	  		            	return {label: item[字段],value: item[字段] }
	  		            }));
	  			});          
	        },
	        minLength: 0,
	        change:function(){
	        	${config_id}Listsearch();
	    	  }
	    }).focus(function(){$(this).autocomplete("search");});		  
}); 















