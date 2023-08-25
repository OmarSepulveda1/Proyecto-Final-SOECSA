<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Estudiante</title>
</head>
<body>
    <h1>Crear Estudiante</h1>
    <form action="${pageContext.request.contextPath}/students/guardar" method="post">
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="lastName">Apellido:</label>
        <input type="text" id="lastName" name="lastName" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="rut">RUT:</label>
        <input type="text" id="rut" name="rut" required><br>
        <label for="age">Edad:</label>
        <input type="text" id="age" name="age" required><br>
        <label for="lastGradeStudied">Último Grado Estudiado:</label>
        <input type="text" id="lastGradeStudied" name="lastGradeStudied" required><br>
        <label for="phoneNumber">Número de Teléfono:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required><br>
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
