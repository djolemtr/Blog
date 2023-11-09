
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Blog - Project by Djole</title>
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



<!-- owl carousel 2 stylesheet-->
<link rel="stylesheet"
	href="plugins/owl-carousel2/assets/owl.carousel.min.css"
	id="theme-stylesheet">
<link rel="stylesheet"
	href="plugins/owl-carousel2/assets/owl.theme.default.min.css"
	id="theme-stylesheet">
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
						<li class="nav-item"><a href="index.html"
							class="nav-link active">Home</a></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a>
						</li>
						<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a>
						</li>
					</ul>
					<div class="navbar-text">
						<a href="#" class="search-btn"><i class="icon-search-1"></i></a>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<!-- Hero Section-->


	<div id="index-slider" class="owl-carousel">

		<c:forEach var="slide" items="${slides}">
			<section
				style="background: url(${slide.image}); background-size: cover; background-position: center center"
				class="hero">
				<div class="container">
					<div class="row">
						<div class="col-lg-7">
							<h1>${slide.title}</h1>
							<a href="${slide.button_url}" class="hero-link">${slide.button_name}</a>
						</div>
					</div>
				</div>
			</section>
		</c:forEach>

	</div>
	<!-- Intro Section-->
	<section class="intro">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<h2 class="h3">Important posts</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- In the next section, every odd id # blog post will have its image placed before the content -->

	<c:forEach var="i" begin="0" end="${importantPosts.size()-1}">

		<c:if test="${i%2 == 1}">
			<section class="featured-posts no-padding-top">
				<div class="container">
					<!-- Post-->
					<div class="row d-flex align-items-stretch">
						<div class="text col-lg-7">
							<div class="text-inner d-flex align-items-center">
								<div class="content">
									<header class="post-header">

										<div class="category">

											<c:choose>
												<c:when
													test="${importantPosts[i].category eq 'Uncategorized'}">
													<a href="#" onclick="return false;"> <c:out
															value="${importantPosts[i].category}" /></a>
												</c:when>
												<c:otherwise>
													<a
														href="${pageContext.request.contextPath}/category-page/${importantPosts[i].category.urlTitle}">
														<c:out value="${importantPosts[i].category}" />
													</a>
												</c:otherwise>
											</c:choose>
										</div>



										<a
											href="${pageContext.request.contextPath}/post/${importantPosts[i].urlTitle}">
											<h2 class="h4">${importantPosts[i].title}</h2>
										</a>
									</header>
									<p>${importantPosts[i].description}</p>
									<footer class="post-footer d-flex align-items-center">
										<a
											href="${pageContext.request.contextPath}/author/${importantPosts[i].user.urlTitle}"
											class="author d-flex align-items-center flex-wrap">
											<div class="avatar">
												<img src="${importantPosts[i].user.image}" alt="..."
													class="img-fluid">
											</div>
											<div class="title">
												<span>${importantPosts[i].user.name}</span>
											</div>
										</a>
										<div class="date">
											<i class="icon-clock"></i> ${importantPosts[i].timePassed}
										</div>
										<div class="comments">
											<i class="icon-comment"></i>${importantPosts[i].comments}</div>
									</footer>
								</div>
							</div>
						</div>
						<div class="image col-lg-5">
							<img src="${importantPosts[i].image}" alt="...">
						</div>
					</div>
				</div>
			</section>
		</c:if>

		<c:if test="${i%2 == 0}">
			<section class="featured-posts no-padding-top">
				<div class="container">
					<!-- Post-->
					<div class="row d-flex align-items-stretch">
						<div class="image col-lg-5">
							<img src="${importantPosts[i].image}" alt="...">
						</div>
						<div class="text col-lg-7">
							<div class="text-inner d-flex align-items-center">
								<div class="content">
									<header class="post-header">


										<div class="category">

											<c:choose>
												<c:when
													test="${importantPosts[i].category eq 'Uncategorized'}">
													<a href="#" onclick="return false;"> <c:out
															value="${importantPosts[i].category}" /></a>
												</c:when>
												<c:otherwise>
													<a
														href="${pageContext.request.contextPath}/category-page/${importantPosts[i].category.urlTitle}">
														<c:out value="${importantPosts[i].category}" />
													</a>
												</c:otherwise>
											</c:choose>
										</div>


										<a
											href="${pageContext.request.contextPath}/post/${importantPosts[i].urlTitle}">
											<h2 class="h4">${importantPosts[i].title}</h2>
										</a>
									</header>
									<p>${importantPosts[i].description}</p>
									<footer class="post-footer d-flex align-items-center">
										<a
											href="${pageContext.request.contextPath}/author/${importantPosts[i].user.urlTitle}"
											class="author d-flex align-items-center flex-wrap">
											<div class="avatar">
												<img src="${importantPosts[i].user.image}" alt="..."
													class="img-fluid">
											</div>
											<div class="title">
												<span>${importantPosts[i].user.name}</span>
											</div>
										</a>
										<div class="date">
											<i class="icon-clock"></i> ${importantPosts[i].timePassed}
										</div>
										<div class="comments">
											<i class="icon-comment"></i>${importantPosts[i].comments}</div>
									</footer>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:if>

	</c:forEach>


	<!-- Divider Section-->
	<section
		style="background: url(img/divider-bg.jpg); background-size: cover; background-position: center bottom"
		class="divider">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h2>The most awesome blog ever on the Internet.</h2>
					<a href="contact.html" class="hero-link">Contact Us</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Posts -->
	<section class="latest-posts">
		<div class="container">
			<header>
				<h2>Latest from the blog</h2>
			</header>

			<div class="owl-carousel" id="latest-posts-slider">
				<c:forEach var="i" begin="0" end="${latestPosts.size()-1}" step="3">
					<div class="row">
						<c:forEach var="j" begin="${i}" end="${i + 2}">
							<c:if test="${j < latestPosts.size()}">
								<div class="post col-md-4">
									<div class="post-thumbnail">
										<a
											href="${pageContext.request.contextPath}/post/${latestPosts[j].urlTitle}"><img
											src="${latestPosts[j].image}" alt="..." class="img-fluid"></a>
									</div>
									<div class="post-details">
										<div class="post-meta d-flex justify-content-between">
											<div class="date">${latestPosts[j].formattedDate}</div>

											<div class="category">

												<c:choose>
													<c:when
														test="${latestPosts[j].category eq 'Uncategorized'}">
														<a href="#" onclick="return false;"> <c:out
																value="${latestPosts[j].category}" /></a>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/category-page/${latestPosts[j].category.urlTitle}">
															<c:out value="${latestPosts[j].category}" />
														</a>
													</c:otherwise>
												</c:choose>
											</div>


										</div>
										<a
											href="${pageContext.request.contextPath}/post/${latestPosts[j].urlTitle}">
											<h3 class="h4">${latestPosts[j].title}</h3>
										</a>
										<p class="text-muted">${latestPosts[j].description}</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


	<!-- Gallery Section-->
	<section class="gallery no-padding">
		<div class="row">
			<div class="mix col-lg-3 col-md-3 col-sm-6">
				<div class="item">
					<a href="img/gallery-1.jpg" data-fancybox="gallery" class="image">
						<img src="img/gallery-1.jpg" alt="gallery image alt 1"
						class="img-fluid" title="gallery image title 1">
						<div
							class="overlay d-flex align-items-center justify-content-center">
							<i class="icon-search"></i>
						</div>
					</a>
				</div>
			</div>
			<div class="mix col-lg-3 col-md-3 col-sm-6">
				<div class="item">
					<a href="img/gallery-2.jpg" data-fancybox="gallery" class="image">
						<img src="img/gallery-2.jpg" alt="gallery image alt 2"
						class="img-fluid" title="gallery image title 2">
						<div
							class="overlay d-flex align-items-center justify-content-center">
							<i class="icon-search"></i>
						</div>
					</a>
				</div>
			</div>
			<div class="mix col-lg-3 col-md-3 col-sm-6">
				<div class="item">
					<a href="img/gallery-3.jpg" data-fancybox="gallery" class="image">
						<img src="img/gallery-3.jpg" alt="gallery image alt 3"
						class="img-fluid" title="gallery image title 3">
						<div
							class="overlay d-flex align-items-center justify-content-center">
							<i class="icon-search"></i>
						</div>
					</a>
				</div>
			</div>
			<div class="mix col-lg-3 col-md-3 col-sm-6">
				<div class="item">
					<a href="img/gallery-4.jpg" data-fancybox="gallery" class="image">
						<img src="img/gallery-4.jpg" alt="gallery image alt 4"
						class="img-fluid" title="gallery image title 4">
						<div
							class="overlay d-flex align-items-center justify-content-center">
							<i class="icon-search"></i>
						</div>
					</a>
				</div>
			</div>

		</div>
	</section>
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


	<script src="plugins/owl-carousel2/owl.carousel.min.js"></script>
	<script>
		$("#index-slider").owlCarousel({
			"items" : 1,
			"loop" : true,
			"autoplay" : true,
			"autoplayHoverPause" : true
		});

		$("#latest-posts-slider").owlCarousel({
			"items" : 1,
			"loop" : true,
			"autoplay" : true,
			"autoplayHoverPause" : true
		});
	</script>

</body>
</html>