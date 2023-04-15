<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
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
<title>FunSports | Check-in</title>
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
					<li><a href="register.jsp" ID="HyperLink4"> <i
							class="now-ui-icons users_single-02"></i>
							<p>Customer Registration</p>
					</a></li>
					<li class="active"><a href="Check-in.jsp" ID="HyperLink10">
							<i class="now-ui-icons ui-1_simple-add"></i>
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
						<a ID="HyperLink5" class="navbar-brand" href="Check-in.jsp">Check-In</a>
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
			<nav class="navbar navbar-expand-lg bg-primary">
				<div class="container">
					<div class="navbar-translate">
						<form class="form-inline ml-auto">
						<div class="form-group no-border">
                                <input type="email" class="form-control" name="search"
									placeholder="Enter email address" required="required">
                            </div>
                            <button type="submit" name="btnsearch" class="btn btn-neutral btn-icon btn-round">
                                <i class="now-ui-icons ui-1_zoom-bold"></i>
                            </button>
						</form>
					</div>
				</div>
			</nav>
			<div class="content">
				<div class="row mt-3">
					<div class="col-md-12">
						<div class="card card-plain">
							<div class="card-header">
								<h4 class="card-title">Customer Details</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class="text-primary">
											<td>First name</td>
											<td>Last name</td>
											<td>Address</td>
											<td>Landmark</td>
											<td>Area</td>
											<td>Postal code</td>
											<td>Gender</td>
											<td>Contact No.</td>
											<td>Email</td>
											<td>Action</td>
										</thead>
										<tbody>
											<%
											try {
												if (request.getParameter("btnsearch") != null) {
													Class.forName("com.mysql.jdbc.Driver");
													String url = "jdbc:mysql://localhost:33060/stm";
													String username = "root";
													String password = "root";
													Connection con = DriverManager.getConnection(url, username, password);
													if (con != null) {
												Statement st = con.createStatement();
												String query = "select * from customer where email = '" + request.getParameter("search") + "'";
												ResultSet rs = st.executeQuery(query);
												int count = 0;
												while (rs.next()) {
													count++;
												}
												if (count == 0) {
											%>
											<tr>
												<td colspan="9">No data Available</td>
											</tr>
											<%
											} else {
											Statement s = con.createStatement();
											String ret = "select * from customer where email = '" + request.getParameter("search") + "'";
											ResultSet res = s.executeQuery(query);
											while (res.next()) {
												session.setAttribute("searchinemail", res.getString("email"));
											%>
											<tr>
												<td><%out.println(res.getString("fname")); %></td>
												<td><%out.println(res.getString("lname")); %></td>
												<td><%out.println(res.getString("address")); %></td>
												<td><%out.println(res.getString("landmark")); %></td>
												<td><%out.println(res.getString("area")); %></td>
												<td><%out.println(res.getString("postalcode")); %></td>
												<td><%out.println(res.getString("gender")); %></td>
												<td><%out.println(res.getString("contactno")); %></td>
												<td><%out.println(res.getString("email")); %></td>
												<td><a ID="HyperLink7"
													class="text-decoration-none text-info"
													href="checkindetails.jsp">Select</a></td>
											</tr>
											<%
											}
											}
											} else {
											out.println("not connected");
											}
											}
											} catch (Exception e) {
											out.println(e);
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/now-ui-dashboard.min.js?v=1.5.0"
		type="text/javascript"></script>
</body>
</html>

