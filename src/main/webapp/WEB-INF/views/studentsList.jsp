<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estudiantes</title>
    <%@ include file="css-proyect.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <main class="container my-4 content">
        <h1>Listado de estudiantes</h1>
        <c:if test="${not empty mensaje}">
            <div class="alert alert-success" role="status"><c:out value="${mensaje}"/></div>
        </c:if>
        <sec:authorize access="hasRole('ADMIN')">
            <a class="btn btn-primary mb-3" href="<c:url value='/estudiantes/nuevo'/>">Crear estudiante</a>
        </sec:authorize>
        <c:choose>
            <c:when test="${empty students}">
                <p class="alert alert-info">No hay estudiantes registrados.</p>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Correo</th>
                                <th>RUT</th>
                                <th>Edad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${students}" var="student">
                                <tr>
                                    <td><c:out value="${student.name}"/></td>
                                    <td><c:out value="${student.lastName}"/></td>
                                    <td><c:out value="${student.email}"/></td>
                                    <td><c:out value="${student.rut}"/></td>
                                    <td><c:out value="${student.age}"/></td>
                                    <td>
                                        <a class="btn btn-outline-primary btn-sm"
                                           href="<c:url value='/estudiantes/${student.id}'/>">Ver</a>
                                        <sec:authorize access="hasRole('ADMIN')">
                                            <a class="btn btn-outline-secondary btn-sm"
                                               href="<c:url value='/estudiantes/${student.id}/editar'/>">Editar</a>
                                            <form class="d-inline"
                                                  action="<c:url value='/estudiantes/${student.id}/eliminar'/>"
                                                  method="post">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                <button class="btn btn-outline-danger btn-sm" type="submit">Eliminar</button>
                                            </form>
                                        </sec:authorize>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>
