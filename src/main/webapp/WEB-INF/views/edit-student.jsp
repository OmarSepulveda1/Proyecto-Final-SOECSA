<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar estudiante</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <h1>Editar estudiante</h1>
        <form:form modelAttribute="student" action="${pageContext.request.contextPath}/estudiantes/${student.id}"
                   method="post" cssClass="row g-3">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="col-md-6">
                <label for="name" class="form-label">Nombre</label>
                <input id="name" name="name" type="text" class="form-control"
                       value="<c:out value='${student.name}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="lastName" class="form-label">Apellido</label>
                <input id="lastName" name="lastName" type="text" class="form-control"
                       value="<c:out value='${student.lastName}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="email" class="form-label">Correo electrónico</label>
                <input id="email" name="email" type="email" class="form-control"
                       value="<c:out value='${student.email}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="rut" class="form-label">RUT</label>
                <form:input path="rut" id="rut" type="text" inputmode="text" autocomplete="off"
                            maxlength="12" placeholder="12.345.678-5" cssClass="form-control" required="required"/>
                <form:errors path="rut" cssClass="text-danger small"/>
            </div>
            <div class="col-md-6">
                <label for="age" class="form-label">Edad</label>
                <input id="age" name="age" type="number" min="1" class="form-control"
                       value="<c:out value='${student.age}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="lastGradeStudied" class="form-label">Último grado estudiado</label>
                <input id="lastGradeStudied" name="lastGradeStudied" type="text" class="form-control"
                       value="<c:out value='${student.lastGradeStudied}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="phoneNumber" class="form-label">Teléfono</label>
                <input id="phoneNumber" name="phoneNumber" type="tel" class="form-control"
                       value="<c:out value='${student.phoneNumber}'/>" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Guardar cambios</button>
                <a class="btn btn-secondary" href="<c:url value='/estudiantes'/>">Cancelar</a>
            </div>
        </form:form>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
