<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>�xito</title>
<!-- Incluyendo estilos -->
<%@include file="css-proyect.jsp"%>

</head>
<body>

	<!-- Incluyendo navbar menu -->
	<%@ include file='navbar.jsp'%>
	
	<!-- Mensaje de exito -->
	<div class="container  content">
    	<div class="alert alert-info mt-4">
	    	<h4 class="alert-heading text-center fs-1">��xito!</h4>
			<p class="text-center">${mensaje}  
			<!-- Validacion del mensaje --> 
				<c:choose>
				    <c:when test="${mensaje eq 'El Estudiante se ha agregado correctamente.'}">
				        <a href="mostrarListaStudents" class="alert-link">Listar Estudiantes</a>
				    </c:when>
				</c:choose>
				<c:choose>
				    <c:when test="${mensaje eq 'Usuario creado correctamente'}">
				        <a href="ListadoUsuarios" class="alert-link">Listar Usuarios</a>
				    </c:when>
				</c:choose>
								<c:choose>
				    <c:when test="${mensaje eq 'Usuario modificado correctamente'}">
				        <a href="ListadoUsuarios" class="alert-link">Listar Usuarios</a>
				    </c:when>
				</c:choose>
			</p>
		</div>
	</div>

	<!-- JavaScript Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>