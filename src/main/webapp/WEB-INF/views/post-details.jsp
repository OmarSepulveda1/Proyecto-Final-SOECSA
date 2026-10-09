<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><c:out value="${post.title}"/></title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <article>
            <h1><c:out value="${post.title}"/></h1>
            <c:if test="${not empty post.publicationDate}">
                <p class="text-muted"><c:out value="${post.publicationDate}"/></p>
            </c:if>
            <c:if test="${not empty post.imageUrl}">
                <img class="img-fluid mb-3" src="<c:out value='${post.imageUrl}'/>"
                     alt="<c:out value='${post.title}'/>">
            </c:if>
            <p><c:out value="${post.text}"/></p>
        </article>
        <a class="btn btn-secondary" href="<c:url value='/post/noticias'/>">Volver a noticias</a>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
