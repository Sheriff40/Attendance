<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="SITE_URL" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html>
<head>

<script>
	window.contextRoot = '${SITE_URL}';
	window.menu = '${title}';
</script>
<meta charset="ISO-8859-1">
<title>Attendance - ${title}</title>
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/datatables.css" />
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/myApp.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

</head>
<body>
	<%@include file="shared/navbar.jsp"%>


	<div class="container">


		<c:if test="${not empty message}">
			<div class="alert alert-success">
				<button class="close" data-dismiss = "alert"> &cross; </button>
					${message}
			</div>
		</c:if>
		`
		<c:if test="${UserClickClass == true}">

			<%@include file="viewClass.jsp"%>
			<script>
				window.stdId = '${id}';
			</script>

		</c:if>
		
		<c:if test="${UserClickAttendance == true}">

			<%@include file="Attendance.jsp"%>
		
		</c:if>
		<c:if test="${UserClickShowAttendance == true}">

			<%@include file="ShowAttendance.jsp"%>
		
		</c:if>
		<c:if test="${UserClickViewStudent == true}">

			<%@include file="ShowStudent.jsp"%>
		
		</c:if>

	</div>
	
	<div class = "footer">
		
		&copy; Mine
		
		
	</div>
</body>


<script type="text/javascript" src="${SITE_URL}/js/code.jquery.com.js"></script>
<script type="text/javascript" src="${SITE_URL}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${SITE_URL}/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${SITE_URL}/js/datatables.js"></script>
<script type="text/javascript" src="${SITE_URL}/js/myApp.js"></script>

<script type="text/javascript" src="${SITE_URL}/js/jquery.validate.js"></script>

</html>