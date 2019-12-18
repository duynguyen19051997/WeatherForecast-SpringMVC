<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Weather Forecast</title>
		<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/publicUrl/images/logo.png">
		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/publicUrl/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/publicUrl/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/publicUrl/css/custom.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/publicUrl/css/bootstrap.min.css">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath}/publicUrl/js/jquery-1.11.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/publicUrl/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/publicUrl/js/jquery.custom.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/publicUrl/js/bootstrap.min.js"></script>
		
	</head>


	<body>
		
		<div class="site-content">
			<div class="site-header">
				<tiles:insertAttribute name="header"></tiles:insertAttribute>
			</div> <!-- .site-header -->
			<tiles:insertAttribute name="main"></tiles:insertAttribute>
			<footer class="site-footer">
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</footer> <!-- .site-footer -->
		</div>
		
		<script src="${pageContext.request.contextPath}/publicUrl/js/plugins.js"></script>
		<script src="${pageContext.request.contextPath}/publicUrl/js/app.js"></script>
		
	</body>

</html>