<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="text-center">
	<h3>Edit Teacher</h3>
</div>

<br>
<div class="col-md-6">
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
      				<sf:input type = "hidden" path = "id"/>
      				<div class = "form-group">
      				<a  class="btn btn-primary fa fa-caret-left" href = "${SITE_URL }/show/teacher"> Back</a>
      					<button type = "submit" value = "submit"  class="btn btn-danger fa fa-save"> Submit</button>
      					
      				</div>
      			</sf:form>
</div>