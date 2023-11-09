
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Blog by Djole - ${tagName}</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom icon font-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/fontastic.css">
<!-- Google fonts - Open Sans-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<!-- Fancybox-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/favicon.png">
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
					<a href="${pageContext.request.contextPath}/index"
						class="navbar-brand">Blog by Djole</a>
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
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/index" class="nav-link">Home</a>
						</li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/blog"
							class="nav-link active">Blog</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/contact"
							class="nav-link">Contact</a></li>
					</ul>
					<div class="navbar-text">
						<a href="#" class="search-btn"><i class="icon-search-1"></i></a>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="container">
		<div class="row">



			<main class="posts-listing col-lg-8">
				<h2 class="mb-3">
					Tag "${tagName}"
				</h2>
				<div class="container">
					<div class="row">
						<!-- Display search results -->

						<c:if test="${not empty tagList}">
							<c:forEach var="post" items="${postList}">
								<div class="post col-xl-6">
									<div class="post-thumbnail">
										<a
											href="${pageContext.request.contextPath}/post/${post.urlTitle}">
											<img src="<c:out value="${post.image}" />" alt="..."
											class="img-fluid">
										</a>
									</div>
									<div class="post-details">
										<div class="post-meta d-flex justify-content-between">
											<div class="date meta-last">
												<c:out value="${post.formattedDate}" />
											</div>
											<div class="category">

												<c:choose>
													<c:when test="${post.category eq 'Uncategorized'}">
														<a href="#" onclick="return false;"> <c:out
																value="${post.category}" /></a>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/category-page/${post.category.urlTitle}">
															<c:out value="${post.category}" />
														</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<a
											href="${pageContext.request.contextPath}/post/${post.urlTitle}">
											<h3 class="h4">
												<c:out value="${post.title}" />
											</h3>
										</a>
										<p class="text-muted">
											<c:out value="${post.description}" />
										</p>
										<footer class="post-footer d-flex align-items-center">
											<a
												href="${pageContext.request.contextPath}/author/${post.user.urlTitle}"
												class="author d-flex align-items-center flex-wrap">
												<div class="avatar">
													<img
														src="<c:out value="${pageContext.request.contextPath}/${post.user.image}" />"
														alt="..." class="img-fluid">
												</div>
												<div class="title">
													<span><c:out value="${post.user.name}" /></span>
												</div>
											</a>
											<div class="date">
												<i class="icon-clock"></i>
												<c:out value="${post.timePassed}" />
											</div>
											<div class="comments meta-last">
												<i class="icon-comment"></i>
												<c:out value="${post.comments}" />
											</div>
										</footer>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<!-- If no category results found -->
						<c:if test="${empty tagList}">
							<div class="col-md-12 text-center">
								<h3>No posts found</h3>
							</div>
						</c:if>
					</div>
				</div>
			</main>




			<aside class="col-lg-4">
				<!-- Widget [Search Bar Widget]-->
				<div class="widget search">
					<header>
						<h3 class="h6">Search the blog</h3>
					</header>
					<form action="${pageContext.request.contextPath}/search-posts"
						class="search-form" method="get">
						<div class="form-group">
							<input type="search" placeholder="What are you looking for?"
								name="searchTerm">
							<button type="submit" class="submit">
								<i class="icon-search"></i>
							</button>
						</div>
					</form>
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
											<img src="${postListForLatestWidget[i].image}" alt="..."
											class="img-fluid">
										</a>
									</div>
									<a
										href="${pageContext.request.contextPath}/post/${postList[i].urlTitle}">
										<div class="title">
											<strong>${postListForLatestWidget[i].title}</strong>
									</a>

									<div class="d-flex align-items-center">
										<div class="views">
											<i class="icon-eye"></i> ${postListForLatestWidget[i].views}
										</div>
										<div class="comments">
											<i class="icon-comment"></i>${postListForLatestWidget[i].comments}</div>

									</div>
								</div>
						</div>
						</a>
				</div>

				</c:forEach>
		</div>
		<!-- Widget [Categories Widget]-->
		<div class="widget categories">
			<header>
				<h3 class="h6">Categories</h3>
			</header>

			<c:forEach var="category" items="${categoryList}">
				<div class="item d-flex justify-content-between">
					<a
						href="${pageContext.request.contextPath}/category-page/${category.urlTitle}">${category.name}</a><span>${category.count}</span>
				</div>
			</c:forEach>
		</div>
		<!-- Widget [Tags Cloud Widget]-->
		<div class="widget tags">
			<header>
				<h3 class="h6">Tags</h3>
			</header>



			<ul class="list-inline">

				<c:forEach var="tag" items="${tagList}">
					<li class="list-inline-item"><a
						href="${pageContext.request.contextPath}/tag-page/${tag.urlTitle}"
						class="tag">#${tag.name}</a></li>
				</c:forEach>

			</ul>


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
							<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
							<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
							<li><a href="${pageContext.request.contextPath}/loginPage">Login</a></li>
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