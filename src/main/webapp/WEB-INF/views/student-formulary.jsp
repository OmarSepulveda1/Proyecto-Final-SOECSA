<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="ISO-8859-1">
<title>Crear Estudiante</title>
<!-- Incluyendo estilos -->
<%@include file="css-proyect.jsp"%>
</head>
<body class="d-flex flex-column h-100">
	<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="Crear" />
	<!-- Menu activo -->
	<c:set var="navText" value="Estudiante" />
	<!-- Texto Crear -->
	<%@include file="navbar.jsp"%>

	<main class="flex-shrink-0 content">
		<div
			class="container d-flex justify-content-center align-items-center mt-4">
			<!-- Formulario para crear estudiante -->
			<div class="card" style="width: 50%;">
				<!-- Agregar la variable booleana  -->
				<c:set var="mostrarAlert" value="${mostrarAlert}" />
				<c:set var="mensaje" value="${mensaje}" />

				<!-- Utilizar la etiqueta 'c:if' para mostrar el alert solo cuando 'mostrarAlert' sea verdadero -->
				<c:if test="${mostrarAlert}">
					<div class="alert alert-info" style="text-align: center"
						role="alert">${mensaje}</div>
				</c:if>
				<div class="card-header bg-dark text-white">
					<h2 class="card-title d-flex justify-content-center">Crear
						Estudiante</h2>
				</div>
				<div class="card-body">
					<form action="saveStudent" class="row" method="post">
						<div class="col-md-6 mb-2">
							<label for="name" class="form-label">Nombre</label> <input
								type="text" class="form-control" name="name" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="lastName" class="form-label">Apellido</label> <input
								type="text" class="form-control" name="lastName" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" name="email" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="rut" class="form-label">RUT</label> <input
								type="text" class="form-control" name="rut" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="age" class="form-label">Edad</label> <input
								type="number" class="form-control" name="age" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="lastGradeStudied" class="form-label">Último
								Grado Estudiado</label> <input type="text" class="form-control"
								name="lastGradeStudied" required>
						</div>
						<div class="col-md-6 mb-2">
							<label for="phoneNumber" class="form-label">Número de
								Teléfono</label> <input type="tel" class="form-control"
								name="phoneNumber" required>
						</div>
						<div class="col-md-12">
							<button type="submit" class="btn btn-secondary w-100 mt-4">Crear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file='footer.jsp'%>
	<!-- Script Validaciones del formulario -->
	<script src="<c:url value="/res/js/formularioEstudiante.js" />"></script>
	<!-- JavaScript Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- Footer -->
</body>
</html>
