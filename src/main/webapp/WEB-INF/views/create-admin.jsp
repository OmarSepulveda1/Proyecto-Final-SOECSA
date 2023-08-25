<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Administrador</title>
</head>
<body>
    <h1>Administrador</h1>
    
    <h2>Detalles del Administrador</h2>
    <c:if test="${admin ne null}">
        <p>ID: ${admin.id}</p>
        <p>Nombre: ${admin.name}</p>
        <p>Apellido: ${admin.lastName}</p>
    </c:if>
    
    <h2>Crear Nuevo Administrador</h2>
    <form action="${pageContext.request.contextPath}/admin/crear-admin" method="post">
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="lastName">Apellido:</label>
        <input type="text" id="lastName" name="lastName" required><br>
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
