<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">
	<tr>
		<th>Students</th>
		<th>Attendance</th>
		<th>Action</th>
	</tr>
	
	<c:forEach var="att" items="${attribute}">
			<tr>
				<td>${att.student.fname }</td>
				<td>
					<c:choose>
					 	<c:when test="${att.status==true}">
					 		<button class = "btn-success disabled" style = "border-radius:20px" id = "btn_${att.id}">Present</button>
					 	</c:when>
					 	<c:otherwise >
					 		<button class = "btn-danger disabled" style = "border-radius:20px" id = "btn_${att.id}">Absent</button>
					 	</c:otherwise>
					</c:choose>
				
				
				</td>
				<td>
					<a href = "javascript:void(0)" id = "edit_${att.id}" class="fa fa-user-edit">Edit</a>
					<script>
						var edit = $('#edit_'+${att.id});
						
						edit.on('click',function(){
							var attId = ${att.id};
							var btn = $("#btn_"+attId);
							$.post( window.contextRoot + "/update/attendance/" + attId,function(data)
									{
										if(data == "present")
											{
											
														btn.removeClass("btn-danger");
														btn.addClass("btn-success");
														btn.text("Present");
														
												
											}
										else if(data == "absent")
											{
														btn.removeClass("btn-success");
														btn.addClass("btn-danger");
														btn.text("Absent");
											}
										
										
									})		
						});
						
					</script>
				</td>
			</tr>
	</c:forEach>
	
</table>