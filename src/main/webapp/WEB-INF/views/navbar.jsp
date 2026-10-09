<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/goHome'/>">SOECSA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/goRegistration'/>">Postulación</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/goGallery'/>">Galería</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/post/noticias'/>">Noticias</a>
                </li>
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/estudiantes'/>">Estudiantes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/admin/crear-admin'/>">Administradores</a>
                    </li>
                </sec:authorize>
            </ul>
            <ul class="navbar-nav">
                <sec:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/goLogin'/>">Ingresar</a>
                </li>
                </sec:authorize>
            </ul>
            <sec:authorize access="isAuthenticated()">
                <form action="<c:url value='/logout'/>" method="post" class="d-flex">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button class="btn btn-outline-secondary" type="submit">Cerrar sesión</button>
                </form>
            </sec:authorize>
        </div>
    </div>
</nav>
<script src="<c:url value='/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js'/>"></script>
