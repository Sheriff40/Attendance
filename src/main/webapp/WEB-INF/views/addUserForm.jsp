
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
.control-label {
	font-size: 20px;
}
</style>

<h1 style="text-align: center;">Add User</h1>
<hr>
<div class="row">

	<div class="col-md-4">
		<sf:form modelAttribute="user" action="${SITE_URL}/admin/save/user"
			method="POST" style = "border:5px solid black; padding: 10px; border-radius : 10px;background:lightblue;">
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
			<div class="form-group">
				<label class="control-label">Password</label>
				<sf:input type="password" class="form-control" path="password"
					id="password" />
			</div>
			<div class="form-group">
				<label class="control-label">Role</label>
				<sf:select path="role" class="form-control">
					<option value="admin">Admin</option>
					<option value="user">User</option>
				</sf:select>
			</div>
			<sf:input type = "hidden" path="id" value = "0"/>
			<button type="submit" name="submit" class="btn btn-danger fa fa-save">
				Save</button>
		</sf:form>
	</div>
	<div class="col-md-8">
	<table class = "table table-striped">
		<thead class="thead-dark">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="user" items="${users}">
				<tr>
				<td>${user.fname}</td>
				<td>${user.email}</td>
				<td>
				<c:choose>
					<c:when test="${user.role == 'admin'}">
						<button class=" btn-info " disabled>Admin</button>
					</c:when>
					<c:otherwise>
							<button class="btn-info " disabled>User</button>
					</c:otherwise>
				</c:choose>
				
				</td>
				<td>
					<a href = "${SITE_URL}/admin/delete/user/${user.id}" class = "btn btn-danger fa fa-trash"> Delete</a>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>
	
</div>
