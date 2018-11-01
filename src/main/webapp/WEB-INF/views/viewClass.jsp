<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Add Student
</button>

<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title">Add Form</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <sf:form method="POST" modelAttribute="student" class="form-horizontal" action = "${SITE_URL}/admin/student/add">
        	<div class="form-group">
        		<label class="label-control">First Name</label>
        		<sf:input type = "text" path = "fname" class="form-control"/>
        	</div>
        	<div class="form-group">
        		<label class="label-control">Last Name</label>
        		<sf:input type = "text" path = "lname" class="form-control"/>
        	</div>
        	<div class="form-group">
        		<label class="label-control">Number</label>
        		<sf:input type = "text" path = "number" class="form-control"/>
        	</div>
        	<div class="form-group">
        		<label class="label-control">Class</label>
        		<sf:input type = "text" path = "classId" class="form-control"/>
        	</div>
        	<div class="form-group">
        		<button type="submit" class="btn btn-success">Save</button>
        	</div>
        </sf:form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<br>
<hr>
<table class="table table-striped" id = "viewClass">
<thead>
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Number</th>
		<th>Total Present</th>
		<th>Total Absent</th>
	</tr>
</thead>
</table>