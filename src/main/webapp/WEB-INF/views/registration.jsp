<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro de Usuario</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
  <section class="section">
    <div class="container">
      <div class="columns is-centered">
        <div class="column is-one-third">
          <div class="box">
            <h1 class="title has-text-centered">Registro de Usuario</h1>
            <form>
              <div class="field">
                <label class="label">Rut</label>
                <div class="control">
                  <input class="input" type="text" placeholder="Ingrese su Rut">
                </div>
              </div>
              <div class="field">
                <label class="label">Contraseña</label>
                <div class="control">
                  <input class="input" type="password" placeholder="Ingrese su contraseña">
                </div>
              </div>
              <div class="field">
                <label class="label">Confirmar Contraseña</label>
                <div class="control">
                  <input class="input" type="password" placeholder="Confirme su contraseña">
                </div>
              </div>
              <div class="field is-grouped is-centered">
                <div class="control">
                  <button class="button is-primary">Registrarse</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>
