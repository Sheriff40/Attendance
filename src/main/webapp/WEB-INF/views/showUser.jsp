
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="text-center">
	<h1>${user.fname} ${user.lname}</h1>
</div>
<br>
<table class="table table-bordered">
	<thead class="thead-dark">
		<tr>
			<th colspan="3">Personal Information </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Email</td>
			<td>${user.email }</td>
			
			
			
		</tr>
		<tr>
			<td>Number</td>
			<td>${user.number}</td>
		</tr>
		<tr>
			<td>Password</td>
			<td>******** <button class="btn btn-default fa fa-exchange-alt" id = "btnChange"> Change</button></td>
		</tr>
	</tbody>
	
</table>
<button class="btn btn-danger fa fa-edit" id = "userEdit" > Edit</button>

<!-- Modal For adding new user -->
<div class="modal fade" id="userEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <sf:form modelAttribute="user" action="${SITE_URL}/user/save/user"
			method="POST" >
			<div class="form-group">
				<label class="control-label">Email</label>
				<sf:input type="email" class="form-control" path="email" id="email" />
			</div>
			<div class="form-group">
				<label class="control-label">First Name</label>
				<sf:input type="text" class="form-control" path="fname" id="fname" />
			</div>
			<div class="form-group">
				<label class="control-label">Last Name</label>
				<sf:input type="text" class="form-control" path="lname" id="lname" />
			</div>
			<div class="form-group">
				<label class="control-label">Number</label>
				<sf:input type="text" class="form-control" path="number" id="number" />
			</div>

			<sf:input type = "hidden" path="id" />
			<button type="submit" name="submit" class="btn btn-danger fa fa-save">
				Save</button>
		</sf:form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		var userEdit = $("#userEdit");
		userEdit.on('click',function(){
			$("#userEditModal").modal();
		})
		
		
	})
</script>


<!-- Modal For Confirm Password-->
<div class="modal fade" id="confirmPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${SITE_URL}/user/change-password"
			method="POST" >
			<div class="form-group">
				<label class="control-label">Old Password</label>
				<input type="password" class="form-control" name = "password" />
			</div>
			<button type="submit" name="submit" class="btn btn-danger">
				Send</button>
		</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
		$(document).ready(function(){
			var changeBtn = $("#btnChange");
			changeBtn.on('click',function(){
				$("#confirmPasswordModal").modal();
			})
		})
</script>