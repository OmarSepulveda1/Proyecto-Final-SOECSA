<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SOECSA Ltda. | Completa tu enseñanza media</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main>
        <section class="container py-4">
            <div class="hero-banner">
                <img src="<c:url value='/res/img/Big_2.jpg'/>" alt="Birretes de graduación lanzados al aire">
                <div class="hero-copy">
                    <p class="text-uppercase fw-semibold mb-2">SOECSA Ltda.</p>
                    <h1>Tu próximo paso empieza aquí</h1>
                    <p class="fs-5">Completa tu enseñanza media y avanza hacia tus metas.</p>
                    <a class="btn btn-accent btn-lg mt-2" href="<c:url value='/goRegistration'/>">Quiero postular</a>
                </div>
            </div>
            <div class="hero-intro">
                <h2 class="h3 fw-bold">Una nueva oportunidad para seguir creciendo</h2>
                <p class="mt-3">En SOECSA acompañamos a personas que desean completar su enseñanza media. Conoce las novedades o inicia tu postulación.</p>
                <a class="btn btn-outline-primary mt-2" href="<c:url value='/post/noticias'/>">Ver noticias</a>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
