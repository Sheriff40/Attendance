<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th>Teacher Id</th>
			<th>Name</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="teacher" items="${teachers}">
			<tr>
				<td>${teacher.teacher.staffId}</td>

				<td>${teacher.teacher.name}</td>
				<td><c:choose>
						<c:when test="${teacher.status}">
							<button id = "status_${teacher.id }" class="btn btn-success disabled"
								style="border-radius: 20px; border: 1px solid black; color: white;">
								Present</button>
						&nbsp;
					</c:when>
						<c:otherwise>
							<button id = "status_${teacher.id }" class="btn btn-danger disabled"
								style=" border-radius: 20px; border: 1px solid black;color: white;">
								Absent</button>

						</c:otherwise>
					</c:choose></td>
				<td>
					<button class="fa fa-user-edit " id="editTeacher_${teacher.id}" >Edit</button>
					<script >
						var editTeacher = $('#editTeacher_'+ ${teacher.id});
						
						
						editTeacher.on('click',function()
							{
								var statusBtn = $("#status_"+ ${teacher.id});
								$.post(window.contextRoot + "/update/teacher/attendance/" + ${teacher.id},function(data)
										{
											if(data == "present")
											{
												statusBtn.removeClass("btn btn-danger");
												statusBtn.addClass("btn btn-success");
												statusBtn.text("Present");
											}
											else if (data == "absent")
											{
												statusBtn.removeClass("btn btn-success");
												statusBtn.addClass("btn btn-danger");
												statusBtn.text("Absent");
											}
										})	
							})
					</script>
				</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>


