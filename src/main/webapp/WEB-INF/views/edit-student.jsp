<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Estudiante</title>
<!-- CSS del proyecto -->
<link rel="stylesheet" href="../css/estilos.css">
<!-- CSS Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
</head>
<body>

	<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="ModificarEstudiante" />
	<!-- Menu activo -->
	<c:set var="navText" value="Estudiante" />
	<!-- Texto Crear -->
	<%@ include file='navbar.jsp'%>

	<div
		class="container d-flex justify-content-center align-items-center mt-4  content">
		<!-- Formulario para modificar un Estudiante -->
		<div class="card" style="width: 50%;">
			<div class="card-header bg-dark text-white">
			<c:set var="student" value="${student}" />
				<h2 class="card-title d-flex justify-content-center">Modificar ${student.getRol()}</h2>
			</div>
			
			<div class="card-body">
				<form action="EditarEstudiante" class="row" method="post">
					<div class="col-md-5 mb-3">
						<label for="name" class="form-label">Nombre</label> 
						<input value="${student.getName()}" type="text" class="form-control" name="name" required>
					</div>
					<div class="col-md-5 mb-3">
						<<label for="lastName" class="form-label">Apellido</label> 
						<input value="${student.getLastName()}" type="text" class="form-control" name="lastName" required>
					</div>
					<div class="col-md-2 mb-3">
						<label for="email" class="form-label">Email</label> 
						<input value="${student.getEmail()}" type="text" class="form-control" name="email" required>
					</div>
					<div class="col-md-3 mb-3">
						<label for="rut" class="form-label">RUT</label>
						<input value="${student.getRut()}" type="text"class="form-control" name="rut" required>
					</div>
					<div class="col-md-3 mb-3">
						<label for="age" class="form-label">Edad</label>
						<input value="${student.getAge()}" type="text" class="form-control" name="age" required>
					</div>
					<div class="col-md-3 mb-3">
						<label for="lastGradeStudied" class="form-label">Último Grado Estudiado</label> 
						<input value="${student.getLastGradeStudied()}" type="text" class="form-control" name="lastGradeStudied" required>
					</div>
					<div class="col-md-3 mb-3">
						<label for="phoneNumber" class="form-label">Número de Teléfono</label> 
						<input value="${student.getPhoneNumber()}" type="text" class="form-control" name="phoneNumber" required>
					</div>

					<div class="col-md-12">
						<input type="hidden" name="idStudent" value="${student.getId()}">
						<button type="submit" class="btn btn-secondary w-100 mt-4">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- JavaScript Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>