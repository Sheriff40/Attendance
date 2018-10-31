<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="SITE_URL" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance - ${title}</title>
<link  rel = "stylesheet" type = "text/css" href = "${SITE_URL}/css/bootstrap.min.css"/>
</head>
<body>
<%@include file="shared/navbar.jsp"%>
	<div class="container">
		
		
		<c:if test="${UserClickClass == true}">
			<%@include file="viewClass.jsp" %>
		</c:if>
		
	</div>
</body>

<script type="text/javascript" src = "${SITE_URL}/js/code.jquery.com.js"></script>

<script type="text/javascript" src = "${SITE_URL}/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "${SITE_URL}/js/myApp.js"></script>

</html>