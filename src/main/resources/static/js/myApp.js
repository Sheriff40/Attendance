$(document).ready(function(){
	
	var json =  window.contextRoot + '/json/'+ window.stdId +'/student';

	var table = $("#viewClass");
	if(table.length)
		{
			
			table.DataTable({
				
				ajax : 
					{
						url : json,
						dataSrc : ''
					},
				columns :
					[
						{
							data : 'id'
						},
						{
							
							data : 'fname'
						
						},
						{
							data : 'number'
						},
						{
							data : 'totalPresentDay'
						},
						{
							data : 'totalAbsentDay'
						}
					]
				
			});
			
		}
	
	
});