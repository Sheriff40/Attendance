<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="SITE_URL" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html>
<head>

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


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

	<c:forEach var="std" items="${studentList}">
		${std.id }
	</c:forEach>
	<div class="container">


		<c:if test="${not empty message}">
			<div class="alert alert-success">
				<button class="close" data-dismiss = "alert"> &cross; </button>
					${message}
			</div>
		</c:if>
		
		<c:if test="${UserClickClass == true}">

			<%@include file="ShowStudent.jsp"%>
			<script>
				window.className = '${name}';
				
			</script>

		</c:if>
		
		<c:if test="${UserClickAttendance == true}">

			<%@include file="TakeStudentAttendance.jsp"%>
		
		</c:if>
		<c:if test="${UserClickShowAttendance == true}">

			<%@include file="EditStudentAttendance.jsp"%>
		
		</c:if>
		<c:if test="${UserClickViewStudent == true}">

			<%@include file="ShowStudentDetail.jsp"%>
		
		</c:if>
		<c:if test="${UserClickTeacherAttendance == true}">

			<%@include file="ShowTeacher.jsp"%>
		
		</c:if>
		<c:if test="${UserClickTakeTeacherAttendance == true}">

			<%@include file="TakeTeacherAttendance.jsp"%>
		
		</c:if>
		<c:if test="${UserClickSearchTeacherAttendance == true}">

			<%@include file="EditTeacherAttendance.jsp"%>
		
		</c:if>
		
		<c:if test = "${EditStudentAttendance == true }">
			<%@include file="EditStudent.jsp"%>
		</c:if>
		
		<c:if test = "${UserClickTeacherEdit == true }">
			<%@include file="EditTeacher.jsp"%>
		</c:if>
		<c:if test = "${UserClickShowClasses == true }">
			<%@include file="ShowClasses.jsp"%>
		</c:if>
		<c:if test = "${UserClickEditClass == true }">
			<%@include file="EditClass.jsp"%>
		</c:if>
		<c:if test="${UserClickAddUser == true }">
			<%@include file = "addUserForm.jsp" %>
		</c:if>
		<c:if test="${UserClickProfile == true }">
			<%@include file = "showUser.jsp" %>
		</c:if>
		<c:if test="${UserClickChangePassword == true }">
			<%@include file = "changePassword.jsp" %>
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
<script type="text/javascript" src="${SITE_URL}/js/jspdf.min.js"></script>
<script type="text/javascript" src="${SITE_URL}/js/html2canvas.js"></script>
</html>