<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>&Eacute;xito</title>
<!-- Incluyendo estilos -->
<%@include file="css-proyect.jsp"%>

</head>
<body>

	<!-- Incluyendo navbar menu -->
	<%@ include file='navbar.jsp'%>
	
	<!-- Mensaje de exito -->
	<div class="container  content">
    	<div class="alert alert-info mt-4">
		<h4 class="alert-heading text-center fs-1">&Eacute;xito!</h4>
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
</body>
</html>