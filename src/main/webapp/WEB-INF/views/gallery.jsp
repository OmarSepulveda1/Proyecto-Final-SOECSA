<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Galería | SOECSA</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <h1 class="page-heading">Galería SOECSA</h1>
        <figure class="card form-panel overflow-hidden">
            <img src="<c:url value='/res/img/Big_2.jpg'/>" class="img-fluid"
                 alt="Birretes de graduación lanzados al aire">
            <figcaption class="card-body">
                <h2 class="h5 card-title mb-0">Cada meta alcanzada abre nuevas oportunidades</h2>
            </figcaption>
        </figure>
        <p class="text-muted">Próximamente compartiremos más imágenes de las actividades de SOECSA.</p>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
