

<script type="text/javascript" src="${SITE_URL}/js/code.jquery.com.js"></script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
				href="${SITE_URL}/home" id="home">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown" id="att_attendance"><a
				class="nav-link dropdown-toggle" href="#" id="att_attendance"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Attendance </a>
				<div class="dropdown-menu">

					<c:forEach var="item" items="${ClassList}">
						<a class="dropdown-item"
							href="${SITE_URL}/user/attendance/take?name=${item.name}">${item.name}</a>
					</c:forEach>

				</div></li>




			<li class="nav-item"><a class="nav-link"
				href="javascript:void(0)" id="searchBtn">Search</a>

				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header"
								style="background: black; color: white;">
								<h5 class="modal-title" id="exampleModalLabel">Search</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">


								<form class='form-horizontal'
									action="${SITE_URL}/user/show/attendace" method="POST">
									<div class="col-md-12">
										<div class="form-group">
											<input type="date" name="date" class="form-control" />
										</div>
									</div>

									<div class="col-md-4">


										<div class="form-group">

											<select name='classId' class="form-control">
												<c:forEach var="item" items="${ClassList}">
													<option value='${item.id}'>Class: ${item.name}</option>
												</c:forEach>
											</select>
										</div>
										<button type="submit" class="btn fa fa-search"
											style="border-radius: 50px; background: #34B48D; color: white;">
											Search</button>
									</div>




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
			<li class="nav-item"><a class="nav-link"
				href="${SITE_URL}/admin/show/teacher" id="att_teacher">Teacher
					Attendance</a></li>

		</ul>





		<ul class="navbar-nav pull right">

			<li class="nav-item dropdown pull-right"><a
				class="nav-link dropdown-toggle" href="#" id="att_class"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Class </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">

					<c:forEach var="item" items="${ClassList}">
						<a class="dropdown-item"
							href="${SITE_URL}/user/student/get?name=${item.name}">${item.name}</a>
					</c:forEach>

					<div class="dropdown-divider"></div>
					<a class="dropdown-item" id = "addClass" href = "${SITE_URL}/admin/show/classes">Show/Add New Class</a>
					
					
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