<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	if(session.getAttribute("gender") != null)
	{
		out.println("<script>alert('Select Gender!!!!')</script>");
		session.removeAttribute("gender");
	}
	if(session.getAttribute("login") == null)
	{
		response.sendRedirect("index.jsp");
	} 
	else
	{
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>FunSports | Customer Registration</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
</head>
<body>
	<div class="wrapper ">
		<div class="sidebar" data-color="orange">
			<div class="logo">
				<a ID="HyperLink1" class="simple-text logo-mini"
					href="dashboard.jsp">FS</a> <a ID="HyperLink2"
					class="simple-text logo-normal" href="dashboard.jsp">FunSports</a>
			</div>
			<div class="sidebar-wrapper" id="sidebar-wrapper">
				<ul class="nav">
					<li><a ID="HyperLink3" class="simple-text logo-normal"
						href="dashboard.jsp"><i class="now-ui-icons design_app"></i>
							<p>Dashboard</p></a></li>
					<li class="active"><a href="register.jsp" ID="HyperLink4">
							<i class="now-ui-icons users_single-02"></i>
							<p>Customer Registration</p>
					</a></li>
					<li><a href="Check-in.jsp" ID="HyperLink10"> <i
							class="now-ui-icons ui-1_simple-add"></i>
							<p>Check-In</p>
					</a></li>
					<li><a href="Check-Out.jsp" ID="HyperLink11"> <i
							class="now-ui-icons ui-1_simple-delete"></i>
							<p>Check-Out</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent bg-primary navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a ID="HyperLink5" class="navbar-brand" href="register.jsp">Customer
							Registration</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" ID="navbarDropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i
									class="now-ui-icons users_single-02"></i>
									<p>
										<span class="d-lg-none d-md-block"></span>
									</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" ID="HyperLink6" href="logout.jsp">Logout</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<h5 class="title">Registration</h5>
							</div>
							<div class="card-body">
								<form action="regcheck.jsp">
									<div class="row">
										<div class="col-md-6 pr-1">
											<div class="form-group">
												<label>First Name</label> <input type="text" ID="txtFname" name="txtFname"
													class="form-control" required="required" pattern="[A-Za-z]+" placeholder="First Name">
											</div>
										</div>
										<div class="col-md-6 pl-1">
											<div class="form-group">
												<label>Last Name</label> <input type="text" ID="txtLname" name="txtLname"
													class="form-control" required="required" pattern="[A-Za-z]+" placeholder="Last Name">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Address</label> <input type="text" ID="txtAddress" name="txtAddress"
													class="form-control" required="required" placeholder="Home Address">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 pr-1">
											<div class="form-group">
												<label>Landmark</label> <input type="text" ID="txtLandmark" name="txtLandmark"
													class="form-control" required="required" pattern="[A-Za-z ]+" placeholder="Landmark">
											</div>
										</div>
										<div class="col-md-4 px-1">
											<div class="form-group">
												<label>Area</label> <input type="text" ID="txtArea" name="txtArea"
													class="form-control" required="required" pattern="[A-Za-z ]+" placeholder="Area">
											</div>
										</div>
										<div class="col-md-4 pl-1">
											<div class="form-group">
												<label>Postal Code</label> <input type="text"
													ID="txtPostalCode" name="txtPostalCode" required="required" pattern="[0-9]{6}" class="form-control"
													placeholder="Postal Code" MaxLength="6">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3 pr-1">
											<div class="form-group">
												<label for="gender">Select Gender</label> <select
													name="gender" ID="gender" class="form-control">
													<option value="1">Select Gender</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
												</select>
											</div>
										</div>
										<div class="col-md-4 px-1">
											<div class="form-group">
												<label>Contact No.</label> <input type="text"
													ID="txtMobileNum" name="txtMobileNum" class="form-control" pattern="[6789][0-9]{9}" required="required"
													placeholder="Contact No." maxlength="10">
											</div>
										</div>
										<div class="col-md-5 pl-1">
											<div class="form-group">
												<label for="exampleInputEmail1">Email address</label> <input
													type="email" ID="txtEmail" name="txtEmail" class="form-control" required="required"
													placeholder="Email">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<input type="submit" ID="btnRegister" name="btnRegister"
												class="btn btn-primary btn-round" value="Register">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid ">
					<nav>
						<ul>
							<li><a ID="HyperLink7">FunSports</a></li>
						</ul>
					</nav>
					<div class="copyright" id="copyright">
						&copy;
						<script>
							document.getElementById('copyright').appendChild(
									document.createTextNode(new Date()
											.getFullYear()))
						</script>
						, Designed by <a ID="HyperLink8" target="_blank"
							href="dashboard.jsp">Sahil Ladola</a> & Coded by <a
							ID="HyperLink9" target="_blank" href="dashboard.jsp">Sahil
							Ladola</a>.
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Notifictions Plugin    -->
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/now-ui-dashboard.min.js?v=1.5.0"
		type="text/javascript"></script>

</body>
</html>