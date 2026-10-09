<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bienvenido a Soecsa</title>
    <!-- CSS del proyecto -->
<%@ include file='css-proyect.jsp'%>
</head>
<body>
<!-- Incluyendo navbar menu -->
	<c:set var="navItem" value="Noticias" />
	<!-- Menu activo -->
	<c:set var="navText" value="Estudiantes" />
	<!-- Texto Listar -->
	<%@ include file='navbar.jsp'%>
    <main class="container my-4 content">
        <h1>Noticias SOECSA</h1>
        <c:if test="${not empty mensaje}">
            <div class="alert alert-success" role="status"><c:out value="${mensaje}"/></div>
        </c:if>
        <sec:authorize access="hasRole('ADMIN')">
            <a class="btn btn-primary mb-3" href="<c:url value='/post/nuevo'/>">Publicar noticia</a>
        </sec:authorize>
        <c:choose>
            <c:when test="${empty posts}">
                <p class="alert alert-info">No hay noticias publicadas por el momento.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${posts}" var="post">
                    <article class="card mb-3">
                        <c:if test="${not empty post.imageUrl}">
                            <img class="card-img-top" src="<c:out value='${post.imageUrl}'/>"
                                 alt="<c:out value='${post.title}'/>">
                        </c:if>
                        <div class="card-body">
                            <h2 class="card-title">
                                <a href="<c:url value='/post/noticia/${post.id}'/>"><c:out value="${post.title}"/></a>
                            </h2>
                            <c:if test="${not empty post.publicationDate}">
                                <p class="text-muted"><c:out value="${post.publicationDate}"/></p>
                            </c:if>
                            <p class="card-text"><c:out value="${post.text}"/></p>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a class="btn btn-outline-secondary btn-sm"
                                   href="<c:url value='/post/${post.id}/editar'/>">Editar</a>
                                <form class="d-inline" action="<c:url value='/post/${post.id}/eliminar'/>" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <button class="btn btn-outline-danger btn-sm" type="submit">Eliminar</button>
                                </form>
                            </sec:authorize>
                        </div>
                    </article>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </main>
    <%@ include file='footer.jsp'%>
</body>
</html>
