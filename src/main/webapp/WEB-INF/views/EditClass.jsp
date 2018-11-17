<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form class="form-horizontal" method="POST"
	action="${SITE_URL}/admin/save/class" modelAttribute="classes">
	<div class="col-md-4">
		<div class="form-group">


			<label class="control-label">Class Name</label>
			<sf:input type="text" path="name" class="form-control" />


			<sf:input type="hidden" path="id" />
		</div>
		<a class="btn btn-primary fa fa-caret-left"
			href="${SITE_URL}/admin/show/classes"> Back</a>
		<button class="btn btn-success fa fa-save" type="submit"
			value="submit"> Submit</button>
	</div>
</sf:form>