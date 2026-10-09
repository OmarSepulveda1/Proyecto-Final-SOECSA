<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Crear administrador | SOECSA</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <div class="card form-panel mx-auto" style="max-width: 42rem;">
            <div class="card-body p-4">
                <h1 class="h3 mb-3">Crear administrador</h1>
                <p class="text-muted">La nueva cuenta podrá administrar estudiantes y noticias.</p>
                <c:if test="${not empty mensaje}">
                    <div class="alert alert-success" role="status"><c:out value="${mensaje}"/></div>
                </c:if>
                <form:form modelAttribute="adminForm" action="${pageContext.request.contextPath}/admin/crear-admin"
                           method="post" class="row g-3">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <div class="col-md-6">
                        <label for="name" class="form-label">Nombre</label>
                        <form:input path="name" id="name" cssClass="form-control" required="required" maxlength="255"/>
                        <form:errors path="name" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Apellido</label>
                        <form:input path="lastName" id="lastName" cssClass="form-control" required="required" maxlength="255"/>
                        <form:errors path="lastName" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="userName" class="form-label">Nombre de usuario</label>
                        <form:input path="userName" id="userName" cssClass="form-control" required="required"
                                    minlength="3" maxlength="50" autocomplete="username"/>
                        <form:errors path="userName" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Correo electrónico</label>
                        <form:input path="email" id="email" type="email" cssClass="form-control"
                                    required="required" maxlength="100" autocomplete="email"/>
                        <form:errors path="email" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="password" class="form-label">Contraseña</label>
                        <form:password path="password" id="password" cssClass="form-control"
                                       required="required" minlength="12" autocomplete="new-password"/>
                        <form:errors path="password" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="confirmPassword" class="form-label">Confirmar contraseña</label>
                        <form:password path="confirmPassword" id="confirmPassword" cssClass="form-control"
                                       required="required" minlength="12" autocomplete="new-password"/>
                        <form:errors path="confirmPassword" cssClass="text-danger small"/>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Crear administrador</button>
                    </div>
                </form:form>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
