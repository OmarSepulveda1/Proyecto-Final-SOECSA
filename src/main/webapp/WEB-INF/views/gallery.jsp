<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="ISO-8859-1">
<title>Galeria</title>
<!-- CSS del proyecto -->
<%@ include file='css-proyect.jsp'%>
</head>
<body>
<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="Galeria" />
	<!-- Menu activo -->
	<c:set var="navText" value="" />
	<!-- Texto Listar -->
	<%@ include file='navbar.jsp'%>

 <%@ include file='footer.jsp'%>
	<%@ include file='footer.jsp'%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>