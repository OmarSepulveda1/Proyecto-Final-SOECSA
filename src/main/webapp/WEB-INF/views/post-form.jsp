<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrar noticia</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <h1><c:choose><c:when test="${post.id ne null}">Editar noticia</c:when><c:otherwise>Crear noticia</c:otherwise></c:choose></h1>
        <form action="<c:url value='${formAction}'/>" method="post" class="row g-3">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="col-12">
                <label for="title" class="form-label">Título</label>
                <input id="title" name="title" type="text" class="form-control"
                       value="<c:out value='${post.title}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="publicationDate" class="form-label">Fecha de publicación</label>
                <input id="publicationDate" name="publicationDate" type="date" class="form-control"
                       value="<c:out value='${post.publicationDate}'/>" required>
            </div>
            <div class="col-md-6">
                <label for="imageUrl" class="form-label">URL de imagen (opcional)</label>
                <input id="imageUrl" name="imageUrl" type="url" class="form-control"
                       value="<c:out value='${post.imageUrl}'/>">
            </div>
            <div class="col-12">
                <label for="text" class="form-label">Contenido</label>
                <textarea id="text" name="text" rows="8" class="form-control" required><c:out value="${post.text}"/></textarea>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <a class="btn btn-secondary" href="<c:url value='/post/noticias'/>">Cancelar</a>
            </div>
        </form>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
