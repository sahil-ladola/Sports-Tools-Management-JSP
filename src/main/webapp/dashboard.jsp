<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
if (session.getAttribute("login") != "login") {
	response.sendRedirect("index.jsp");
} else {
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("remember") == "true") {
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		Cookie usercookie = new Cookie("username", username);
		Cookie passcookie = new Cookie("password", password);

		int expiry = 60 * 60 * 24 * 30;
		usercookie.setMaxAge(expiry);
		passcookie.setMaxAge(expiry);

		response.addCookie(usercookie);
		response.addCookie(passcookie);
	} else {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>FunSports | Dashboard</title>
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
<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="orange">
			<div class="logo">
				<a ID="HyperLink1" class="simple-text logo-mini"
					href="dashboard.jsp">FS</a> <a ID="HyperLink2"
					class="simple-text logo-normal" href="dashboard.jsp">FunSports</a>
			</div>
			<div class="sidebar-wrapper" id="sidebar-wrapper">
				<ul class="nav">
					<li class="active"><a ID="HyperLink3"
						class="simple-text logo-normal" href="dashboard.jsp"><i
							class="now-ui-icons design_app"></i>
							<p>Dashboard</p></a></li>
					<li><a href="register.jsp" ID="HyperLink4"> <i
							class="now-ui-icons users_single-02"></i>
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
						<a ID="HyperLink5" class="navbar-brand" href="dashboard.jsp">Dashboard</a>
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
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Customers details</h4>
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
										</thead>
										<tbody>
											<%
											try {
												Class.forName("com.mysql.jdbc.Driver");
												String url = "jdbc:mysql://localhost:33060/stm";
												String username = "root";
												String password = "root";
												Connection con = DriverManager.getConnection(url, username, password);
												if (con != null) {
													Statement st = con.createStatement();
													String query = "select * from customer";
													ResultSet rs = st.executeQuery(query);
													while (rs.next()) {
											%>
											<tr>
												<td>
													<%
													out.println(rs.getString("fname"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("lname"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("address"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("landmark"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("area"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("postalcode"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("gender"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("contactno"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("email"));
													%>
												</td>
											</tr>
											<%
											}
											} else {
											out.println("not connected");
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
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Available tools</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<td>Tools name</td>
											<td>Tools quantity</td>
											<td>On Rent tools quantity</td>
											<td class="text-right">Remaining tools quantity</td>
										</thead>
										<tbody>
											<%
											try {
												Class.forName("com.mysql.jdbc.Driver");
												String url = "jdbc:mysql://localhost:33060/stm";
												String username = "root";
												String password = "root";
												Connection con = DriverManager.getConnection(url, username, password);
												if (con != null) {
													Statement st = con.createStatement();
													String query = "select * from tools where remain_quantity != 0";
													ResultSet rs = st.executeQuery(query);
													while (rs.next()) {
											%>
											<tr>
												<td>
													<%
													out.println(rs.getString("t_name"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("quantity"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("on_rent"));
													%>
												</td>
												<td class="text-right">
													<%
													out.println(rs.getString("remain_quantity"));
													%>
												</td>
											</tr>
											<%
											}
											} else {
											out.println("not connected");
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
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Currently not available tools</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<td>Tools name</td>
											<td>Tools quantity</td>
											<td>On Rent tools quantity</td>
											<td class="text-right">Remaining tools quantity</td>
										</thead>
										<tbody>
											<%
											try {
												Class.forName("com.mysql.jdbc.Driver");
												String url = "jdbc:mysql://localhost:33060/stm";
												String username = "root";
												String password = "root";
												Connection con = DriverManager.getConnection(url, username, password);
												if (con != null) {
													Statement st = con.createStatement();
													String query = "select * from tools where remain_quantity = 0";
													ResultSet rs = st.executeQuery(query);
													while (rs.next()) {
											%>
											<tr>
												<td>
													<%
													out.println(rs.getString("t_name"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("quantity"));
													%>
												</td>
												<td>
													<%
													out.println(rs.getString("on_rent"));
													%>
												</td>
												<td class="text-right">
													<%
													out.println(rs.getString("remain_quantity"));
													%>
												</td>
											</tr>
											<%
											}
											} else {
											out.println("not connected");
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
								document
										.getElementById('copyright')
										.appendChild(
												document
														.createTextNode(new Date()
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
