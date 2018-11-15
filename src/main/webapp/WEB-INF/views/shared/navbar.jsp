<script type="text/javascript" src="${SITE_URL}/js/code.jquery.com.js"></script>


<nav class="navbar navbar-expand-lg navbar-light bg-light">

	<a class="navbar-brand" href="${SITE_URL}/home">Attendance</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item "><a class="nav-link"
				href="${SITE_URL}/home" id = "home" >Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown" id = "att_attendance"><a
				class="nav-link dropdown-toggle" href="#" id="att_attendance" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Attendance
			</a>
				<div class="dropdown-menu" >
					<a class="dropdown-item" href="${SITE_URL}/attendance/take/8">Class
						8</a> <a class="dropdown-item" href="${SITE_URL}/attendance/take/9">Class
						9</a> <a class="dropdown-item" href="${SITE_URL}/attendance/take/10">Class
						10</a>
				</div></li>


			

			<li class="nav-item"><a class="nav-link"
				href="javascript:void(0)" id="searchBtn">Search</a>

				<div class="modal fade" id="exampleModal" tabindex="-1"
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
								
								
								<form class='form-horizontal' action = "${SITE_URL}/show/attendace">
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
									<div class="form-group">
									
									<select name = 'classId' class = "form-control" >
										<option value = '8'>Class 8 </option>
										<option value = '9'>Class 9 </option>
										<option value = '10'>Class 10 </option>
									</select>
									</div>
									<button type="submit" class="btn btn-primary">Search</button>
									
								
								</form>
								
								

							</div>
							
						</div>
					</div>
				</div> <script type="text/javascript">
					$(document).ready(function() {
						var searchBtn = $('#searchBtn');
						var exampleModal = $('#exampleModal');
						searchBtn.on('click', function() {
							exampleModal.modal();
						});
					});
				</script></li>
			<li class="nav-item"><a class="nav-link" href = "${SITE_URL}/show/teacher" id="att_teacher">Teacher Attendance</a></li>

		</ul>





		<ul class="navbar-nav pull right">

			<li class="nav-item dropdown pull-right"><a
				class="nav-link dropdown-toggle" href="#" id="att_class" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Class </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${SITE_URL}/admin/student/8/get">Class
						8</a> <a class="dropdown-item" href="${SITE_URL}/admin/student/9/get">Class
						9</a> <a class="dropdown-item" href="${SITE_URL}/admin/student/10/get">Class
						10</a>
					<div class="dropdown-divider"></div>
					<button class="dropdown-item disabled">Class</button>
				</div></li>
			<li class="nav-item dropdown pull-right"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> User Name </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Profile</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${SITE_URL}/logout">Logout</a>
				</div></li>
		</ul>
	</div>
</nav>
<br>