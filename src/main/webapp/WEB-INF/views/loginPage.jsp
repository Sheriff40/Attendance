<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="SITE_URL" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${SITE_URL}/css/loginCSS.css" />
</head>
<body style="background: purple;">
	<div class="container">

		<c:if test="${success == false }">
			<div class="alert alert-danger alert-dismissible"
				style="margin: 20px;">
				<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Incorrect Username or Password
			</div>
		</c:if>

		<c:if test="${not empty logout}">
			<div class="alert alert-success alert-dismissible"
				style="margin: 20px;">
				<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${logout }
			</div>
		</c:if>

		<div id="login-row"
			class="row justify-content-center align-items-center">
			<div id="login-column" class="col-md-6">

				<div class="box">
					<div class="text-center"></div>
					<div class="shape1"></div>
					<div class="shape2"></div>
					<div class="shape3"></div>
					<div class="shape4"></div>
					<div class="shape5"></div>
					<div class="shape6"></div>
					<div class="shape7"></div>
					<div class="float">
						<form class="form" action="${SITE_URL}/login" method="POST">
							<div class="form-group">
								<label for="username" class="text-white">Email:</label><br>
								<input type="text" name="email" id="email"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="text-white">Password:</label><br>
								<input type="password" name="password" id="password"
									class="form-control">
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-group">
								<input type="submit" name="submit" class="btn btn-default"
									value="Submit">
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		<security:csrfInput/>
	</div>
	
	<script type="text/javascript" src="${SITE_URL}/js/code.jquery.com.js"></script>
	<script type="text/javascript" src="${SITE_URL}/js/bootstrap.min.js"></script>
</body>
</html>