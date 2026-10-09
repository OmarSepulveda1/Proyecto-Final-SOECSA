<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detalle del estudiante</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <h1>Detalle del estudiante</h1>
        <dl class="row">
            <dt class="col-sm-3">Nombre</dt><dd class="col-sm-9"><c:out value="${student.name}"/></dd>
            <dt class="col-sm-3">Apellido</dt><dd class="col-sm-9"><c:out value="${student.lastName}"/></dd>
            <dt class="col-sm-3">Correo</dt><dd class="col-sm-9"><c:out value="${student.email}"/></dd>
            <dt class="col-sm-3">RUT</dt><dd class="col-sm-9"><c:out value="${student.rut}"/></dd>
            <dt class="col-sm-3">Edad</dt><dd class="col-sm-9"><c:out value="${student.age}"/></dd>
            <dt class="col-sm-3">Último grado estudiado</dt><dd class="col-sm-9"><c:out value="${student.lastGradeStudied}"/></dd>
            <dt class="col-sm-3">Teléfono</dt><dd class="col-sm-9"><c:out value="${student.phoneNumber}"/></dd>
        </dl>
        <a class="btn btn-secondary" href="<c:url value='/estudiantes'/>">Volver al listado</a>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
