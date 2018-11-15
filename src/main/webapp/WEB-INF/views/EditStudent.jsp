<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="text-center">
	<h3>Edit Student</h3>
</div>

<br>
<div class="col-md-12">
	<sf:form modelAttribute="student" class="form-horizontal" method="POST" action = "${SITE_URL}/admin/student/add">

		<div class="row">
			<div class="form-group col-md-3">
				<label class="label-control">Roll No</label>
				<sf:input type="text" path="rollNo" class="form-control" />
			</div>
			<div class="form-group col-md-3">
				<label class="label-control">First Name</label>
				<sf:input type="text" path="fname" class="form-control" />
			</div>
			<div class="form-group col-md-3">
				<label class="label-control">Last Name</label>
				<sf:input type="text" path="lname" class="form-control" />
			</div>
			<div class="form-group col-md-3">
				<label class="label-control">Father's Name</label>
				<sf:input type="text" path="fatherName" class="form-control" />
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-3">
				<label class="label-control ">Mother's Name</label>
				<sf:input type="text" path="motherName" class="form-control" />
			</div>
			<div class="form-group col-md-3">
				<label class="label-control ">Number</label>
				<sf:input type="text" path="number" class="form-control" />
			</div>

			<div class="form-group col-md-3">
				<label class="label-control ">Temporary Address</label>
				<sf:input type="text" path="tempAddress" class="form-control" />
			</div>
			<div class="form-group col-md-3">
				<label class="label-control ">Permanent Address</label>
				<sf:input type="text" path="permAddress" class="form-control" />
			</div>
		</div>
		<div class="row">
			<div class="form-group  col-md-3">
				<label class="label-control">Local Guardian</label>
				<sf:input type="text" path="localGuardian" class="form-control" />
			</div>
			<div class="form-group  col-md-3">
				<label class="label-control">Local Guardian Number</label>
				<sf:input type="text" path="localNumber" class="form-control" />
			</div>

			<div class="form-group  col-md-1">
				<label class="label-control">Class</label>
				<sf:input type="number" path="classId" class="form-control" />
			</div>
		</div>
		
		<sf:input type = "hidden" path = "id"/>
		<div class="form-group">
			<a  class="btn btn-primary fa fa-caret-left" href = "${SITE_URL }/admin/student/${student.classId}/get"> Back</a>
	
			<button type="submit" class="btn btn-danger fa fa-save"> Save</button>
		</div>

	</sf:form>
</div>