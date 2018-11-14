<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="text-right">
	<button class ="btn btn-success" id="add_teacher">Add Teacher</button>
</div>
<div class="text-left">
	<a class ="btn btn-danger" id="add_teacher" href = "${SITE_URL}/take/teacher/attendance">Take Attendance</a>
</div>
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

<table class = "table table-striped" id = "teacherTable">
	<thead>
		<tr>
		<th>Teacher Id</th>
		<th>Name</th>
		<th>Address</th>
		<th>Number</th>
		<th>Subject</th>
		</tr>
	</thead>	
</table>