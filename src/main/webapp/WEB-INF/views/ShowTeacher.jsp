<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="text-right">
	<button class = "btn btn-primary fa fa-user-plus"  style = "border-radius:20px;" id="add_teacher"> Add Teacher</button>
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
							<div class="modal-header " style= "background:black;color:white;">
								<h5 class="modal-title" id="exampleModalLabel">Search</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<form class='form-horizontal' action = "${SITE_URL}/search/teacher/attendance" method = "POST">
									
									<div class="form-group">
										<input class = 'form-control' type='date' name = 'date'/>
										
									</div>
									<button type="submit" class="btn fa fa-search" style = "border-radius:50px;background:#34B48D;color:white;"> Search</button>
									
								
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
      				<sf:input type = "hidden" path="id" value = "0"/>
      				<div class = "form-group">
      					<button type = "submit" value = "submit" class="btn btn-danger fa fa-save"> Save</button>
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
		<th>Actions</th>
		</tr>
	</thead>	
</table>