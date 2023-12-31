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

<title>Blog - Admin - Tags</title>

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
							<h1>Tags</h1>
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
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Tags</h3>
									<div class="card-tools">


										<a href="tag-form" class="btn btn-success"> <i
											class="fas fa-plus-square"></i> Add new tag
										</a>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>

												<th>Name</th>
												<th class="text-center">Actions</th>
											</tr>
										</thead>
										<tbody id="sort-list">

											<c:forEach var="tag" items="${tagList}">

												<tr>

													<td><strong>${tag.name}</strong></td>

													<td class="text-center">
														<div class="btn-group">
															<a href="tag-form-update?id=${tag.id}"
																class="btn btn-info"> <i class="fas fa-edit"></i>
															</a>
															<button type="button" class="btn btn-info"
																data-toggle="modal"
																data-target="#delete-modal-${tag.id}">
																<i class="fas fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>

												<div class="modal fade" id="delete-modal-${tag.id}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete tag</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete tag?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a href="tag-delete?id=${tag.id}" class="btn btn-danger">Delete
																</a>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
												<!-- /.modal -->
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix"></div>
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
