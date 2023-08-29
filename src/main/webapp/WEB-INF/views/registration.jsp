<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
    <meta charset="ISO-8859-1">
    <title>Registrar Usuario</title>
    <!-- Incluyendo estilos -->
    <%@include file="css-proyect.jsp"%>
</head>
<body class="d-flex flex-column h-100">
    <!-- Incluyendo navbar menu -->
    <c:set var="navItem" value="Registrar" />
    <!-- Menu activo -->
    <c:set var="navText" value="Usuario" />
    <!-- Texto Registrar -->
    <%@include file="navbar.jsp"%>

    <main class="flex-shrink-0 content">
        <div class="container d-flex justify-content-center align-items-center mt-4">
            <!-- Formulario para registrar usuario -->
            <div class="card" style="width: 50%;">
                <!-- Agregar la variable booleana  -->
                <c:set var="mostrarAlert" value="${mostrarAlert}" />
                <c:set var="mensaje" value="${mensaje}" />

                <!-- Utilizar la etiqueta 'c:if' para mostrar el alert solo cuando 'mostrarAlert' sea verdadero -->
                <c:if test="${mostrarAlert}">
                    <div class="alert alert-info" style="text-align: center" role="alert">${mensaje}</div>
                </c:if>
                <div class="card-header bg-dark text-white">
                    <h2 class="card-title d-flex justify-content-center">Registrar Usuario</h2>
                </div>
                <div class="card-body">
                    <form action="guardar-estudiantes" class="row" method="post">
                        <div class="col-md-6 mb-2">
                            <label for="username" class="form-label">Nombre de Usuario</label>
                            <input type="text" class="form-control" name="userName" required>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                                               
                        <div class="col-md-6 mb-2">
                            <label for="email" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="col-md-6 mb-2">
                         <c:if test="${userRol == 'Admin'}">
                            <label for="userRol" class="form-label">Rol de Usuario</label>
                            <select class="form-select" name="userRol" required>
                                <option value="Admin">Admin</option>
                                <option value="Student">Estudiante</option>
                            </select>
                             </c:if>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-secondary w-100 mt-4">Registrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- Script Validaciones del formulario -->
    <script src="<c:url value="/res/js/formularioUsuario.js" />"></script>
    <!-- JavaScript Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- Footer -->
        <%@ include file='footer.jsp'%>
</body>
</html>
