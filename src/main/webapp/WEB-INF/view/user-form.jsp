<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>Blog - Admin - Users</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
			</ul>


			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">

				<li><a class="nav-link" href="http://localhost:8081/Blog/index"
					role="button"> <i class="fas fa-th-large"> </i> &nbsp;Go to
						Blog
				</a></li>

				<sec:authorize access="hasRole('admin')">
					<li class="nav-item dropdown"><a class="nav-link"
						href="message-list"> <i class="far fa-comments"></i> <c:if
								test="${messagesCount == 0}">
								<span class="badge badge-danger navbar-badge"></span>
							</c:if> <c:if test="${messagesCount > 0}">
								<span class="badge badge-danger navbar-badge">${messagesCount}</span>
							</c:if>
					</a>
				</sec:authorize>

				<!--Messages Dropdown Menu-->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-user"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="user-edit-profile" class="dropdown-item"> <i
							class="fas fa-user">&nbsp</i>
						<sec:authentication property="principal.username"></sec:authentication>&nbsp(click
							to edit)
						</a>

						<div class="dropdown-divider"></div>
						<a href="user-change-password" class="dropdown-item"> Change
							password </a>
						<div class="dropdown-divider"></div>
						<a href="login.html" class="dropdown-item"> <form:form
								action="${pageContext.request.contextPath}/logout">

								<input type="submit" value="Log out">

							</form:form>


						</a>
					</div></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Product Logo -->
			<a href="post-list" class="brand-link"> <img
				src="${pageContext.request.contextPath}/dist/img/AdminLTELogo.png"
				alt="Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">Administration</span>
			</a>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->


					<sec:authorize access="hasRole('admin')">
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Users <i class="right fas fa-angle-left"></i>
								</p>
						</a>


							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="user-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>User list</p>
								</a></li>

								<li class="nav-item"><a href="user-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add user</p>
								</a></li>

							</ul></li>
					</sec:authorize>

					<sec:authorize access="hasRole('admin')">
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Slides <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="slide-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Slide list</p>
								</a></li>
								<li class="nav-item"><a href="slide-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add slide</p>
								</a></li>
							</ul></li>
					</sec:authorize>

					<li class="nav-item has-treeview"><a href="#" class="nav-link">
							<i class="nav-icon far fa-plus-square"></i>
							<p>
								Posts <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="post-list" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Post list</p>
							</a></li>
							<li class="nav-item"><a href="user-post-list"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>Your posts</p>
							</a></li>
							<li class="nav-item"><a href="post-form" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Add post</p>
							</a></li>
						</ul></li>

					<sec:authorize access="hasRole('admin')">
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Comments <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="comment-list"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Comment list</p>
								</a></li>
							</ul></li>

						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Categories <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="category-list"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Category list</p>
								</a></li>
								<li class="nav-item"><a href="category-form"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Add category</p>
								</a></li>
							</ul></li>

						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Tags <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="tag-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Tag list</p>
								</a></li>
								<li class="nav-item"><a href="tag-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add tag</p>
								</a></li>
							</ul></li>
					</sec:authorize>


				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Users</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">User Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form action="user-form-action" modelAttribute="user"
									role="form">
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Username</label>
													<form:input type="text" class="form-control"
														placeholder="Enter username" path="username" />
													<form:errors path="username" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Name</label>
													<form:textarea class="form-control" path="name"
														placeholder="Enter name" />
													<form:errors path="name" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Surname</label>
													<form:textarea class="form-control" path="surname"
														placeholder="Enter surname" />
													<form:errors path="surname" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Image</label>
													<form:textarea class="form-control" path="image"
														placeholder="Enter image url" />
													<form:errors path="image" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Phone</label>
													<form:textarea class="form-control" path="phone"
														placeholder="Enter phone number" />
													<form:errors path="phone" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Email</label>
													<form:textarea class="form-control" path="email"
														placeholder="Enter email address" />
													<form:errors path="email" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Password</label>
													<form:textarea class="form-control" path="password"
														placeholder="Enter password" />
													<form:errors path="password" cssClass="text-danger" />
												</div>

												<!--                       <div class="form-group"> -->
												<!--                         <label>Roles</label> -->

												<%--                         <form:select path="authorities" items="${roles }" itemLabel="authority" itemValue="authority" multiple="true" class="form-control"/> --%>

												<!--                       </div> -->




											</div>

										</div>

									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Save</button>
										<a href="user-list" class="btn btn-outline-secondary">Cancel</a>
									</div>
								</form:form>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->



		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="float-right d-none d-sm-inline">Blog</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2023 <a>Project by Đole</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
</body>
</html>
