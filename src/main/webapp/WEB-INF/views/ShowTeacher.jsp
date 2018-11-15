<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="text-right">
	<button class = "btn btn-primary" style = "border-radius:20px;" id="add_teacher">Add Teacher</button>
</div>

<div class="row">
	<button id = "searchTeacherAttendance"  style = "border:1px solid black;color:white; border-radius: 20px;background: #34B48D;font-size:18px;">Search/Edit </button>
	&nbsp;
	<a class ="btn btn-danger" style = "border-radius:20px;border:1px solid black;" href = "${SITE_URL}/take/teacher/attendance">Take Attendance</a>
</div>
<br>


<div class="modal fade" id = "searchTeacher" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Search</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<form class='form-horizontal' action = "${SITE_URL}/search/teacher/attendance" method = "POST">
									<div class="form-group">
										<input class= "form-control" type='text' name = 'year' 
										placeholder = 'yyyy'/>
									</div>
									<div class="form-group">
									<input class= "form-control" type='text' name = 'month' 
										placeholder = 'mm'/>
									</div>
									<div class="form-group">
										<input class= "form-control" type='text' name = 'day' 
										placeholder = 'dd'/>
									</div>
								
									<button type="submit" class="btn btn-primary">Search</button>
									
								
								</form>

							</div>
							
						</div>
					</div>
				</div>

<script>
		var searchTeacherAttendance = $("#searchTeacherAttendance");
		searchTeacherAttendance.on('click',function(){
			$("#searchTeacher"). modal();
		});
</script>


<br>
<div class="modal fade" id="teacherModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Teacher</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      			<sf:form method = "POST" modelAttribute="teacher" id = "teacherForm" action = "${SITE_URL}/add/teacher">
      				<div class="form-group">
      					<label class="label-control">Id</label>
      					<sf:input path = 'staffId' type = "text" class="form-control" />
      				</div>
      				<div class="form-group">
      					<label class="label-control">Full Name</label>
      					<sf:input path = 'name' type = "text" class="form-control" />
      				</div>
      				<div class="form-group">
      					<label class="label-control">Address</label>
      					<sf:input path = 'address' type = "text" class="form-control" />
      				</div>
      				<div class="form-group">
      					<label class="label-control">Phone number</label>
      					<sf:input path = 'number' type = "text" class="form-control" />
      				</div>
      				<div class="form-group">
      					<label class="label-control">Subject</label>
      					<sf:input path = 'subject' type = "text" class="form-control" />
      				</div>
      				<div class = "form-group">
      					<button type = "submit" value = "submit" class="btn btn-success btn-sm">Submit</button>
      				</div>
      			</sf:form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$("#add_teacher").on('click',function(){
		$("#teacherModal").modal();
	});
</script>

<table class = "table " id = "teacherTable">
	<thead class="thead-dark">
		<tr>
		<th>Teacher Id</th>
		<th>Name</th>
		<th>Address</th>
		<th>Number</th>
		<th>Subject</th>
		</tr>
	</thead>	
</table>