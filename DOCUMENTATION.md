# Documentación SOECSA - Portal Estudiantil

## Descripción General
SOECSA (Sociedad Educacional SOECSA Ltda.) es un portal web educativo diseñado para la gestión de estudiantes y administración de contenido educativo. El sistema está enfocado en la nivelación de estudios para adultos, proporcionando una plataforma integral para la gestión de información académica y comunicación.

## Tecnologías Utilizadas

### Backend
- Java 25 (JDK probado: Temurin 25); Maven mantiene `source` y `target` en Java 8 para generar bytecode compatible
- Spring Framework 5.2.8
  - Spring MVC
  - Spring Security
  - Spring Data JPA
- Hibernate 5.4.20
- MySQL (Base de datos)

### Frontend
- JSP (JavaServer Pages)
- Bootstrap 5.3
- Bootstrap se incluye mediante WebJars y se sirve desde la propia aplicación
- HTML5/CSS3
- JavaScript

### Herramientas de Construcción
- Maven
- Log4j2 (Sistema de logging)

## Estructura del Proyecto

```
src/
├── main/
│   ├── java/
│   │   └── cl/Main/Soecsa/Ltda/
│   │       ├── controller/     # Controladores MVC
│   │       ├── entity/         # Entidades JPA
│   │       ├── repository/     # Repositorios JPA
│   │       └── service/        # Servicios
│   ├── resources/
│   │   └── log4j2.xml         # Configuración de logging
│   └── webapp/
│       ├── resources/         # Recursos estáticos (CSS, JS, imágenes)
│       └── WEB-INF/
│           ├── views/         # Vistas JSP
│           └── spring/        # Configuración de Spring
```

## Módulos Principales

### 1. Sistema de Autenticación y Autorización
- Implementado con Spring Security
- Roles de usuario: Admin y Student
- Login y registro de usuarios
- Gestión de sesiones
- El administrador inicial usa el usuario `admin` y la variable `SOECSA_ADMIN_PASSWORD`
- Las cuentas adicionales se almacenan en MySQL con contraseñas BCrypt

### 2. Gestión de Estudiantes
- CRUD completo de estudiantes
- Campos gestionados:
  - Nombre y apellido
  - Email
  - RUT
  - Edad
  - Último grado estudiado
  - Número de teléfono
- Validaciones de datos
- Listado y búsqueda de estudiantes

### 3. Sistema de Noticias
- Gestión de publicaciones
- Atributos de las publicaciones:
  - Título
  - Fecha de publicación
  - Imagen
  - Contenido
- Visualización en formato blog

### 4. Interfaz de Usuario
- Diseño responsivo
- Componentes principales:
  - Navbar de navegación
  - Carrusel de imágenes en home
  - Galería multimedia
  - Formularios de gestión
  - Footer con redes sociales
  - Newsletter

## Base de Datos

### Estructura de Tablas

#### users
- id (PK)
- user_name
- password
- user_rol
- email

#### student
- id (PK)
- name
- last_name
- email
- rut
- age
- last_grade_studied
- phone_number

#### admin
- id (PK)
- name
- last_name

#### post
- id (PK)
- title
- publication_date
- image_url
- text

## Configuración del Proyecto

### Requisitos Previos
- JDK 25 para compilar y ejecutar la versión probada
- MySQL 8.0 o posterior (probado localmente con MySQL 9.4)
- Maven

### Pasos de Instalación
1. Clonar el repositorio
2. Configurar la base de datos MySQL
   - Crear base de datos "soecsa"
   - Crear el esquema siguiendo la configuración de base de datos del proyecto. `Soecsa.sql` es un dump heredado que contiene instrucciones `DROP TABLE`; no lo importes sobre una base con datos que deban conservarse.
3. Configurar las variables de entorno `SOECSA_DB_URL`, `SOECSA_DB_USERNAME` y `SOECSA_DB_PASSWORD`
4. Ejecutar una vez la migración `database/migrations/V20261009_01__student_rut_to_varchar.sql` sobre la base de datos existente para almacenar el RUT completo. Los RUT históricos guardados solo como números no tienen dígito verificador y deben corregirse con el dato real.
5. Ejecutar `mvn clean install`
6. Desplegar el WAR generado en un servidor de aplicaciones

## Seguridad y rutas

Spring Security se registra mediante `DelegatingFilterProxy`. Los formularios que modifican datos usan POST y token CSRF. El acceso al listado, edición y eliminación de estudiantes y a las operaciones de administración de noticias requiere el rol `ADMIN`.

Para habilitar el administrador inicial, define `SOECSA_ADMIN_PASSWORD` antes de iniciar el servidor. El nombre de usuario es `admin`. Las cuentas nuevas se crean desde `/admin/crear-admin` por un administrador autenticado, se guardan con contraseña BCrypt y también pueden iniciar sesión. Las contraseñas nuevas deben tener al menos 12 caracteres. El acceso inicial por variable de entorno sigue disponible.

Bootstrap 5.3.0 se empaqueta localmente como WebJar; los recursos CSS y JavaScript no dependen de una CDN ni de acceso a internet después de construir el WAR.

Rutas principales:

| Método | Ruta | Acceso | Función |
|---|---|---|---|
| GET | `/` o `/goHome` | Público | Inicio |
| GET | `/goRegistration` | Público | Formulario de postulación |
| POST | `/estudiantes/registro` | Público + CSRF | Enviar postulación |
| GET | `/admin/crear-admin` | Administrador | Formulario para crear otro administrador |
| POST | `/admin/crear-admin` | Administrador + CSRF | Crear un administrador |
| GET | `/post/noticias` | Público | Listado de noticias |
| GET | `/post/noticia/{id}` | Público | Detalle de noticia |
| GET | `/estudiantes` | Administrador | Listado de estudiantes |
| GET | `/estudiantes/nuevo` | Administrador | Formulario de estudiante |
| POST | `/estudiantes` | Administrador + CSRF | Crear estudiante |
| GET | `/estudiantes/{id}` | Administrador | Detalle de estudiante |
| GET | `/estudiantes/{id}/editar` | Administrador | Formulario de edición |
| POST | `/estudiantes/{id}` | Administrador + CSRF | Actualizar estudiante |
| POST | `/estudiantes/{id}/eliminar` | Administrador + CSRF | Eliminar estudiante |
| GET | `/post/nuevo` | Administrador | Formulario de noticia |
| POST | `/post` | Administrador + CSRF | Crear noticia |
| GET | `/post/{id}/editar` | Administrador | Formulario de edición |
| POST | `/post/{id}` | Administrador + CSRF | Actualizar noticia |
| POST | `/post/{id}/eliminar` | Administrador + CSRF | Eliminar noticia |

## Sistema de Logging
- Implementado con Log4j2
- Niveles de log configurables
- Rotación de archivos de log
- Separación por tipos:
  - Aplicación
  - Framework
  - Errores

## Validaciones
- Validación de formularios client-side y server-side
- Validación server-side del dígito verificador RUT chileno; se almacenan RUT normalizados como `12345678-5`
- Validación de rangos de edad
- Validación de formatos de email y teléfono
- Manejo de errores y mensajes de usuario

## Mantenimiento

### Respaldos
- Respaldo periódico de base de datos
- Logs de actividad
- Control de versiones con Git

### Monitoreo
- Logs de aplicación
- Logs de errores
- Registros de acceso

## Futuras Mejoras Sugeridas
1. Implementación de API REST
2. Sistema de notificaciones por email
3. Panel de estadísticas
4. Integración con servicios de almacenamiento en la nube
5. Sistema de mensajería interna
6. Exportación de datos en diferentes formatos