<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	if(session.getAttribute("searchoutemail") == null)
	{
		response.sendRedirect("Check-Out.jsp");
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
<title>FunSports | Check-out</title>
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
					<li><a href="Check-in.jsp" ID="HyperLink10"> <i
							class="now-ui-icons ui-1_simple-add"></i>
							<p>Check-In</p>
					</a></li>
					<li class="active"><a href="Check-Out.jsp" ID="HyperLink11">
							<i class="now-ui-icons ui-1_simple-delete"></i>
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
						<a ID="HyperLink5" class="navbar-brand" href="Check-Out.jsp">Check-Out</a>
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
				<div class="row mt-3">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Check-Out Details</h4>
							</div>
							<div class="card-body">
							<div class="table-responsive">
							<%
							if(request.getParameter("btnCheck") == null || request.getParameter("toolsname").equals("-1"))
							{
							%>
								<table class="table">
									<thead class="text-primary">
										<th>Select Tool :</th>
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
															String query = "select * from tools";
															ResultSet rs = st.executeQuery(query);
													
												%>
									<form>
									<tr>
										<td>
											<select name="toolsname" class="form-control"
														id="toolname">
															<option value="-1">Select tool</option>
															<%
															while (rs.next()) {
															%>
															<option value="<%=rs.getString("t_name")%>"><%=rs.getString("t_name")%></option>
															<% } %>
											</select>
										</td>
										<td>
											<button ID="btnCheck" class="btn btn-primary btn-round"
															value="Check" name="btnCheck">Check Availability</button>
										</td>
										
									</tr>
									</form>
										<%
														} else {
														out.println("not connected");
														}
														} catch (Exception e) {
														out.println(e);
														}
										%>
									</tbody>
								</table>
								<%
							}
								%>
							</div>
							<%
							if(request.getParameter("btnCheck") != null)
							{
								if(!request.getParameter("toolsname").equals("-1"))
								{
							%>
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<th>Email</th>
											<th>Tools name</th>
											<th>Available quantity</th>
											<th class="text-right">Quantity needed</th>
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
												%> 
											<form action="checkout.jsp">
												<tr>
													<td>
														<% out.println(session.getAttribute("searchoutemail")); %>
													</td>
													<td>
													<input type="hidden" name="toolname" value="<% out.println(request.getParameter("toolsname")); %>">
														<% out.println(request.getParameter("toolsname")); %>
													</td>
													
														<%
															if(request.getParameter("toolsname") != null)
															{
																String remain = "select remain_quantity from tools where t_name = '" + request.getParameter("toolsname") + "';";
																ResultSet rs = st.executeQuery(remain);
																while (rs.next()) {
														%>
													<td>
														<% 
														out.println(rs.getString("remain_quantity"));
														%>
													</td>
														<%
																}
															}
															else
															{
																out.println("<td></td>");
															}
														%>
													<td><input type="text" ID="txtneedquan"
														name="needquan" class="form-control" pattern="[0-9]+" required="required"></td>
												</tr>
												<%
														}
														else
														{
															out.println("not connected");
														}
													} catch (Exception e) {
														out.println(e);
													}
												%>
												<tr>
													<td>
														<button type="submit" ID="btnsubmit" class="btn btn-primary btn-round"
															value="Checkout" name="btnCheckout">Submit</button>
													</td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</form>
										</tbody>
									</table>
								</div>
								<%
								} else {
									out.println("<script>alert('select tool');</script>");
								}
							}
								%>
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