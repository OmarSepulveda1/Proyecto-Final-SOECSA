<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100 translated-ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Soecsa Limitada</title>
<!-- CSS Proyecto -->
<%@include file="css-proyect.jsp"%>
<style>
/* Estilos personalizados */
body {
	background-color: #f8f9fa;
}

.container {
	padding-top: 20px;
}

h1 {
	color: #343a40;
}

h2 {
	color: #343a40;
	margin-top: 20px;
}

p {
	color: #6c757d;
	line-height: 1.6;
}
</style>
</head>
<body>
	<!-- Menu activo -->
	<c:set var="navItem" value="Index" />
	<!-- Incluyendo navbar menu -->
	<%@include file="navbar.jsp"%>
	<main class="flex-shrink-0 content">
		<div class="container">

			<!-- Carrusel de imagenes -->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" data-bs-interval="2000">
					<div class="carousel-item active">
						<img src="<c:url value="/res/img/Big_1.jpg" />"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 class="fondo">Tu futuro importa.</h5>
						</div>

					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="<c:url value="/res/img/Big_2.jpg" />"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 class="fondo">Profesores que Sí te ayudarán.</h5>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="<c:url value="/res/img/Big_3.jpg" />"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5 class="fondo">Años de experiencia en educación de adultos.</h5>
						</div>

					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- Pagina de inicio -->
		<div class="container">
			<section class="mt-5">
				<h1>Bienvenido a Soecsa</h1>
				
			</section>
		</div>
	</main>

	<!-- JavaScript Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<%@include file="footer.jsp"%>
</body>
</html>
