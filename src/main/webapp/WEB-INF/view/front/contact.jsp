<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Blog - Project by Djole - Contact</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom icon font-->
<link rel="stylesheet" href="css/fontastic.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<!-- Fancybox-->
<link rel="stylesheet"
	href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
	<header class="header">
		<!-- Main Navbar-->
		<nav class="navbar navbar-expand-lg">
			<div class="search-area">
				<div
					class="search-area-inner d-flex align-items-center justify-content-center">
					<div class="close-btn">
						<i class="icon-close"></i>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-md-8">
							<form action="search-posts">
								<div class="form-group">
									<input type="search" name="searchTerm" id="search"
										placeholder="What are you looking for?">
									<button type="submit" class="submit">
										<i class="icon-search-1"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<!-- Navbar Brand -->
				<div
					class="navbar-header d-flex align-items-center justify-content-between">
					<!-- Navbar Brand -->
					<a href="index.html" class="navbar-brand">Blog by Djole</a>
					<!-- Toggle Button-->
					<button type="button" data-toggle="collapse"
						data-target="#navbarcollapse" aria-controls="navbarcollapse"
						aria-expanded="false" aria-label="Toggle navigation"
						class="navbar-toggler">
						<span></span><span></span><span></span>
					</button>
				</div>
				<!-- Navbar Menu -->
				<div id="navbarcollapse" class="collapse navbar-collapse">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a href="index" class="nav-link">Home</a>
						</li>
						<li class="nav-item"><a href="blog" class="nav-link">Blog</a>
						</li>
						<li class="nav-item"><a href="contact"
							class="nav-link active">Contact</a></li>
					</ul>
					<div class="navbar-text">
						<a href="#" class="search-btn"><i class="icon-search-1"></i></a>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- Hero Section -->
	<section
		style="background: url(img/hero.jpg); background-size: cover; background-position: center center"
		class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Have an interesting news or idea? Don't hesitate to
						contact us!</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row">
			<!-- Latest Posts -->
			<main class="col-lg-8">
				<div class="container">

					<form:form action="message-save" modelAttribute="message"
						role="form" class="commenting-form">

						<div class="row">
							<div class="form-group col-md-6">
								<form:textarea path="name" placeholder="Your Name"
									class="form-control" />
							</div>
							<div class="form-group col-md-6">
								<form:textarea path="email"
									placeholder="Email Address (will not be published)"
									class="form-control" />
							</div>
							<div class="form-group col-md-12">
								<form:textarea path="content" placeholder="Type your message"
									class="form-control" rows="20" />
							</div>
							<div class="form-group col-md-12">
								<button type="submit" class="btn btn-secondary">Submit
									Your Message</button>
							</div>
						</div>

					</form:form>

					<c:if test="${not empty messageSent}">
						<div class="alert alert-success">${messageSent}</div>
					</c:if>

				</div>
			</main>
			<aside class="col-lg-4">
				<!-- Widget [Contact Widget]-->
				<div class="widget categories">
					<header>
						<h3 class="h6">Contact Info</h3>
						<div class="item d-flex justify-content-between">
							<span>15 Yemen Road, Yemen</span> <span><i
								class="fa fa-map-marker"></i></span>
						</div>
						<div class="item d-flex justify-content-between">
							<span>(020) 123 456 789</span> <span><i
								class="fa fa-phone"></i></span>
						</div>
						<div class="item d-flex justify-content-between">
							<span>info@blogbydjole.com</span> <span><i
								class="fa fa-envelope"></i></span>
						</div>
					</header>

				</div>

				<!-- Widget [Latest Posts Widget] -->
				<div class="widget latest-posts">
					<header>
						<h3 class="h6">Latest Posts</h3>
					</header>

					<c:forEach var="i" begin="0" end="2">
						<div class="blog-posts">
							<a href="blog-post.html">
								<div class="item d-flex align-items-center">
									<div class="image">
										<a
											href="${pageContext.request.contextPath}/post/${postList[i].urlTitle}">
											<img src="${postList[i].image}" alt="..." class="img-fluid">
										</a>
									</div>
									<a
										href="${pageContext.request.contextPath}/post/${postList[i].urlTitle}">
										<div class="title">
											<strong>${postList[i].title}</strong>
									</a>

									<div class="d-flex align-items-center">
										<div class="views">
											<i class="icon-eye"></i> ${postList[i].views}
										</div>
										<div class="comments">
											<i class="icon-comment"></i>${postList[i].comments}</div>

									</div>
								</div>
						</div>
						</a>
				</div>

				</c:forEach>
		</div>

		</aside>
	</div>
	</div>
	<!-- Page Footer-->
	<footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="logo">
						<h6 class="text-white">Info</h6>
					</div>
					<div class="contact-details">
						<p>53 Broadway, Broklyn, NY 11249</p>
						<p>Phone: (020) 123 456 789</p>
						<p>
							Email: <a href="mailto:Info@blogbydjole">Info@blogbydjole.com</a>
						</p>
						<ul class="social-menu">
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-facebook"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-behance"></i></a></li>
							<li class="list-inline-item"><a href="#"><i
									class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="menus d-flex">
						<ul class="list-unstyled">
							<li><a href="index">Home</a></li>
							<li><a href="blog">Blog</a></li>
							<li><a href="contact">Contact</a></li>
							<li><a href="loginPage">Login</a></li>
						</ul>

						<ul class="list-unstyled">
							<c:forEach var="i" begin="0" end="3">
								<li><a
									href="${pageContext.request.contextPath}/category-page/${categoryList[i].urlTitle}">${categoryList[i].name}</a></li>
							</c:forEach>
						</ul>

					</div>
				</div>

				<div class="col-md-4">
					<c:forEach var="i" begin="0" end="2">
						<div class="latest-posts">
							<a
								href="${pageContext.request.contextPath}/post/${footerPosts[i].urlTitle}">
								<div class="post d-flex align-items-center">
									<div class="image">
										<img src="${footerPosts[i].image}" alt="..."
											class="img-fluid">
									</div>
									<div class="title">
										<strong>${footerPosts[i].title}</strong><span
											class="date last-meta">${footerPosts[i].formattedDate}</span>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>


			</div>
		</div>
		<div class="copyrights">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<p>&copy; 2023. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-right">
						<p>
							Blog by <a>Djole</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
	<script src="js/front.js"></script>
</body>
</html>