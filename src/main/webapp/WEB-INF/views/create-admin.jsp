<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="ISO-8859-1">
    <title>Administrador</title>
    <!-- CSS del proyecto -->
<%@ include file='css-proyect.jsp'%>
</head>
<body>
<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="Listar" />
	<!-- Menu activo -->
	<c:set var="navText" value="Estudiantes" />
	<!-- Texto Listar -->
	<%@ include file='navbar.jsp'%>
	
    <h1>Administrador</h1>
    
    <h2>Detalles del Administrador</h2>
    <c:if test="${admin ne null}">
        <p>ID: ${admin.id}</p>
        <p>Nombre: ${admin.name}</p>
        <p>Apellido: ${admin.lastName}</p>
    </c:if>
    
    <h2>Crear Nuevo Administrador</h2>
    <form action="${pageContext.request.contextPath}/admin/crear-admin" method="post">
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="lastName">Apellido:</label>
        <input type="text" id="lastName" name="lastName" required><br>
        <input type="submit" value="Guardar">
    </form>
    <%@ include file='footer.jsp'%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
