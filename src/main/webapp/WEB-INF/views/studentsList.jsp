<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lista de Estudiantes</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
  <style>
    body {
      background-color: #F0F1F2;
    }
    .actions {
      white-space: nowrap;
    }
  </style>
</head>
<body>
  <section class="section">
    <div class="container">
      <h1 class="title has-text-centered">Lista de Estudiantes</h1>
      <div class="columns is-centered">
        <div class="column is-centered">
          <div class="rectangle">
            <table class="table is-fullwidth">
              <thead>
                <tr>
                  <th>Nombres</th>
                  <th>Apellidos</th>
                  <th>Email</th>
                  <th>Rut</th>
                  <th>Edad</th>
                  <th>Último Año Aprobado</th>
                  <th>Teléfono</th>
                  <th class="actions">Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Nombre1</td>
                  <td>Apellido1</td>
                  <td>email1@example.com</td>
                  <td>12345678-9</td>
                  <td>20</td>
                  <td>2022</td>
                  <td>123456789</td>
                  <td class="actions">
                    <button class="button is-primary">Editar</button>
                    <button class="button is-danger">Eliminar</button>
                  </td>
                </tr>
                <!-- Repite la estructura para otros estudiantes -->
                <tr>
                  <td>Nombre2</td>
                  <td>Apellido2</td>
                  <td>email2@example.com</td>
                  <td>98765432-1</td>
                  <td>22</td>
                  <td>2020</td>
                  <td>987654321</td>
                  <td class="actions">
                    <button class="button is-primary">Editar</button>
                    <button class="button is-danger">Eliminar</button>
                  </td>
                </tr>
                <!-- Repite la estructura para más estudiantes -->
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>
