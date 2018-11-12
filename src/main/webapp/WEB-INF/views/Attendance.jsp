<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<hr>

	<script>
		window.id = ${id}
	</script>
	
	<div class="text-center"><strong>Date: </strong>  ${date}</div>
	
	<br>
		<table class="table table-hover" border = "1" id = "attendanceTable" width = "80%">
			<thead>
				<tr>
					<th>Id</th>
					<th>Student Name</th>
					<th>Number</th>
					<th>Attendance</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		
	
			
		<a type="Submit" href = "${SITE_URL}/home" class="btn btn-success">Save</a>
		
