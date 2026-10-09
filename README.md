# SOECSA Ltda.

Portal web de SOECSA Ltda. para personas que desean completar su enseñanza
media. Presenta información institucional y noticias, recibe postulaciones y
ofrece herramientas administrativas para gestionar estudiantes y publicaciones.

## Funcionalidades

- Página de inicio, galería y noticias públicas.
- Formulario público de postulación con validación del RUT chileno.
- Administración autenticada de estudiantes y noticias: crear, consultar,
  editar y eliminar.
- Creación de cuentas administrativas desde la aplicación.
- Bootstrap servido localmente, sin dependencia de una CDN en ejecución.

## Tecnologías

- Java 25 para compilar y ejecutar (JDK probado: Temurin 25).
- Spring MVC y Spring Security, JSP/JSTL, Spring Data JPA e Hibernate.
- MySQL y Maven.
- WAR desplegable en Apache Tomcat 9.

El proyecto conserva `source` y `target` de Java 8 en Maven para generar
bytecode compatible; esto no impide ejecutar la aplicación con Java 25.

## Compilar

Con JDK 25 y Maven instalados:

```powershell
mvn clean verify
```

El WAR se genera en `target/Soecsa.Ltda-0.0.1-SNAPSHOT.war`. Despliégalo en
Tomcat 9, compatible con las APIs `javax.*` usadas por la aplicación.

## Configuración y despliegue

Configura `SOECSA_DB_URL`, `SOECSA_DB_USERNAME`, `SOECSA_DB_PASSWORD` y
`SOECSA_ADMIN_PASSWORD` en el entorno del servidor. El usuario inicial es
`admin`; usa una contraseña administrativa distinta de la contraseña de MySQL.

Antes de guardar RUT completos en una base existente, ejecuta la migración
[`database/migrations/V20261009_01__student_rut_to_varchar.sql`](database/migrations/V20261009_01__student_rut_to_varchar.sql).
No importes `Soecsa.sql` sobre una base con datos que deban conservarse: es un
dump heredado que contiene instrucciones `DROP TABLE`.

Consulta [DOCUMENTATION.md](DOCUMENTATION.md) para los pasos detallados de
configuración, rutas y base de datos.
