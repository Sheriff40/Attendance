<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- Button trigger modal -->
<div class="text-right">
	<button type="button" class=" btn btn-danger fa fa-user-plus "
		data-toggle="modal" style = "border-radius:10px;" data-target="#myModal">Add Student</button>

</div>

<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">

				<h4 class="modal-title">Add Form</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<sf:form method="POST" id="stdForm" modelAttribute="student"
					class="form-horizontal" action="${SITE_URL}/admin/student/add">
					<div class="form-group">
						<label class="label-control">Roll No</label>
						<sf:input type="text" path="rollNo" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">First Name</label>
						<sf:input type="text" path="fname" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Last Name</label>
						<sf:input type="text" path="lname" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Father's Name</label>
						<sf:input type="text" path="fatherName" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Mother's Name</label>
						<sf:input type="text" path="motherName" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Number</label>
						<sf:input type="text" path="number" class="form-control" />
					</div>
					
					<div class="form-group">
						<label class="label-control">Temporary Address</label>
						<sf:input type="text" path="tempAddress" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Permanent Address</label>
						<sf:input type="text" path="permAddress" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Local Guardian</label>
						<sf:input type="text" path="localGuardian" class="form-control" />
					</div>
					<div class="form-group">
						<label class="label-control">Local Guardian Number</label>
						<sf:input type="text" path="localNumber" class="form-control" />
					</div>
					
					<div class="form-group">
						<label class="label-control">Class</label>
						<sf:input type="number" path="classId" class="form-control" value = "${id}"/>
					</div>
					<sf:input type = "hidden" path = "id" value = "0"/>
					<div class="form-group">
						<button type="submit" class="btn btn-danger fa fa-save"> Save</button>
						
					</div>
				</sf:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div class="text-center">
	<h3>Class - ${id}</h3>
</div>

<br>
<hr>
<table class="table table-striped" id="viewClass">
	<thead class="thead-dark">
		<tr>
			<th>Roll No</th>
			<th>Name</th>
			<th>Address</th>
			<th>Actions</th>
			
		</tr>
	</thead>
</table>