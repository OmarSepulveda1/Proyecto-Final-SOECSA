<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="ISO-8859-1">
<title>Lista de Estudiantes</title>
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

	<h1>Listado de Estudiantes</h1>
	<c:choose>
		<c:when test="${empty studentList}">
			<div class="alert alert-danger" style="text-align: center"
				role="alert">
				No hay registros de Estudiantes. <a href="CrearEstudiante"
					class="alert-link">Ir a crear Usuario</a>
			</div>
		</c:when>
		<c:otherwise>
			<!-- Agregar la variable booleana  -->
			<c:set var="mostrarAlert" value="${mostrarAlert}" />
			<c:set var="mensaje" value="${mensaje}" />

			<!-- Utilizar la etiqueta 'c:if' para mostrar el alert solo cuando 'mostrarAlert' sea verdadero -->
			<c:if test="${mostrarAlert}">
				<div class="alert alert-info" style="text-align: center"
					role="alert">${mensaje}</div>
			</c:if>

			<table class="table table-striped table-bordered">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Email</th>
						<th>RUT</th>
						<th>Edad</th>
						<th>Último Grado Estudiado</th>
						<th>Número de Teléfono</th>
						<th>Acciones</th>
					</tr>
					<c:forEach items="${students}" var="student">
						<tr>
							<td>${student.id}</td>
							<td>${student.name}</td>
							<td>${student.lastName}</td>
							<td>${student.email}</td>
							<td>${student.rut}</td>
							<td>${student.age}</td>
							<td>${student.lastGradeStudied}</td>
							<td>${student.phoneNumber}</td>
							<td>
								<!-- Enviar el ID del Estudiante al servlet EditarEstudiante al hacer clic en el botÃ³n "Editar" -->
								<form action="Editar${userRol.getUserRol()}" method="get">
									<input type="hidden" name="idRescatado" value="${student.getId()}">
									<button type="submit" class="btn btn-outline-dark btn-sm">
										<i class="bi bi-pencil-square"></i> Editar
									</button>
								</form>
							</td>
							<!-- boton modal -->
							<td>
								<button type="button"
									class="btn btn-outline-danger btn-sm eliminar-usuario-btn"
									data-user-id="${student.getId()}" data-bs-toggle="modal"
									data-bs-target="#eliminarModal">
									<i class="bi bi-trash"></i> Eliminar
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	</section>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="eliminarModal" tabindex="-1"
		aria-labelledby="eliminarModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eliminarModalLabel">Confirmar
						Eliminación</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Cerrar"></button>
				</div>
				<div class="modal-body">¿Estás seguro de que deseas eliminar
					este Estudiante?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<form id="eliminarUsuarioForm" action="EliminarUsuario"
						method="get">
						<input type="hidden" name="idRescatado" value="">
						<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>

	<%@ include file='footer.jsp'%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<!-- Script propio de la vista -->
	<script src="<c:url value="/res/js/eliminarEstudiante.js" />">
		
	</script>
</body>
</html>
