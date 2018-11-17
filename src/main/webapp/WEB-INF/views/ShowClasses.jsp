<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="text-right">
	<button class="btn btn-success" id = "addClassBtn" style = "border-radius:20px;border:1px solid black;">Add Class</button>
</div>


<br>
<div class="modal fade" tabindex="-1" role="dialog" id="addClassModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">

				<h4 class="modal-title">Add Class</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<sf:form method="POST" id="stdForm" modelAttribute="classes"
					class="form-horizontal" action="${SITE_URL}/admin/save/class">
					<div class="form-group">
						<label class="label-control">Name</label>
						<sf:input type="text" path="name" class="form-control" />
					</div>
					<sf:input path="id" type="hidden" value = "0"/>
					<div class="form-group">
						<button type="submit" class="btn btn-danger fa fa-save">
							Save</button>

					</div>
				</sf:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script type="text/javascript">
	var addClassBtn = $("#addClassBtn");
	addClassBtn.on('click',function(){
		$("#addClassModal").modal();
	})
</script>

<table class="table" id="classesTable">
	<thead class="thead-dark">
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
	</thead>
	
</table>