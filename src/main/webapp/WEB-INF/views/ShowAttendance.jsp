<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">
	<tr>
		<th>Students</th>
		<th>Attendance</th>
	</tr>
	
	<c:forEach var="att" items="${attribute}">
			<tr>
				<td>${att.student.fname }</td>
				<td>
					<c:choose>
					 	<c:when test="${att.status=true}">
					 		<button class = "btn-sm btn-success disabled">Present</button>
					 	</c:when>
					 	<c:otherwise >
					 		<button class = "btn-sm btn-danger disabled">Absent</button>
					 	</c:otherwise>
					</c:choose>
				
				
				</td>
			</tr>
	</c:forEach>
	
</table>