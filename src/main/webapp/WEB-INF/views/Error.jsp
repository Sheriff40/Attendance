<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>403 Unauthorized Access</title>
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	
</head>
<body>
	<nav class="navbar navbar-dark bg-dark ">

	<a class="navbar-brand" href="${SITE_URL}/home">Attendance</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	</nav>
	<div class="container">
		<h1>${heading }</h1>
		<hr>
		${message }
		<hr>
		<a class="btn btn-success fa fa-home" href = "${SITE_URL}/home"> Home</a>
	</div>
	
</body>
</html>