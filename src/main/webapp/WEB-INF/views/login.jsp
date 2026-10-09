<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Iniciar sesión | SOECSA</title>
<!-- CSS del proyecto -->
<%@ include file='css-proyect.jsp'%>
</head>
<body>

	<!-- Incluyendo navbar -->
	<c:set var="navItem" value="Login" />
	<!-- Menu activo -->
	<%@ include file='navbar.jsp'%>

	<main class="flex-shrink-0 content">
		<div class="container py-4">
			<!-- Formulario de acceso -->
			<div class="row justify-content-center">
				<div class="col-lg-4 col-md-6">
					<div class="card login-card">
						<div class="card-body">
							<c:choose>
								<c:when test="${param.error}">
									<div class="alert alert-danger" style="text-align: center"
										role="alert">No se pudo iniciar sesión. Verifica tus datos e inténtalo nuevamente.</div>
								</c:when>
								<c:when test="${param.logout}">
									<div class="alert alert-warning" style="text-align: center"
										role="status">Sesión cerrada correctamente.</div>
								</c:when>
							</c:choose>
							<h1 class="card-title text-center h3 mb-4">Iniciar sesión</h1>
							<div class="row justify-content-center mb-4">
								<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16" aria-hidden="true">
	  							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
	  							<path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
							</svg>
							</div>
							<form action="<c:url value='/login'/>" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<div class="mb-3">
									<label for="usuario" class="form-label">Usuario</label> <input
										type="text" class="form-control" id="usuario" name="username"
											placeholder="Usuario" autocomplete="username" required>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label">Contraseña</label> <input
										type="password" class="form-control" id="password"
										name="password" autocomplete="current-password" required>
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input" id="rememberMe"
										name="rememberMe"> <label class="form-check-label"
										for="rememberMe">Recordarme</label>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-secondary w-75">Iniciar
										Sesión</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- JavaScript Bootstrap -->
</body>
</html>