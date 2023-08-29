<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="ISO-8859-1">
    <title>Bienvenido a Soecsa</title>
    <!-- CSS del proyecto -->
<%@ include file='css-proyect.jsp'%>
</head>
<body>
<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="Noticias" />
	<!-- Menu activo -->
	<c:set var="navText" value="Estudiantes" />
	<!-- Texto Listar -->
	<%@ include file='navbar.jsp'%>
    <h1>Bienvenido a Soecsa</h1>
    
    <p>Acá destacamos las ultimas noticias.</p>
    
    <p>Por favor, seleccione una de las siguientes opciones:</p>
    
    <ul>
        <li><a href="<c:url value='/post/noticias'/>">Ver Noticias</a></li>
        <!-- Agrega más enlaces aquí según tu aplicación -->
    </ul>
    <%@ include file='footer.jsp'%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
