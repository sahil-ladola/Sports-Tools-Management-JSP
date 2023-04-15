<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	if(session.getAttribute("searchinemail") == null)
	{
		response.sendRedirect("Check-in.jsp");
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
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navigation"
							aria-controls="navigation-index" aria-expanded="false"
							aria-label="Toggle navigation">
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
									<h4 class="card-title">Check-in Details</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									<%
											try {
													Class.forName("com.mysql.jdbc.Driver");
													String url = "jdbc:mysql://localhost:33060/stm";
													String username = "root";
													String password = "root";
													Connection con = DriverManager.getConnection(url, username, password);
													if (con != null) {
												Statement st = con.createStatement(); %>
										<table class="table">
											<thead class=" text-primary">
												<th>Email</th>
												<th>Tools name</th>
												<th>Quantity customer have</th>
												<th>Return quantity</th>
												<th>Action</th>
											</thead>
									<% if(request.getParameter("btnedit") == null) { %>
											<tbody>
											<form>
												<%
												String query = "select transaction.trn_id ,transaction.email , transaction.quantity , tools.t_name from transaction join tools on transaction.tid = tools.tid where transaction.email ='" + session.getAttribute("searchinemail") + "' and transaction.status = '0'";
												ResultSet res = st.executeQuery(query);
												while (res.next()) {
												%>
												<tr>
													<td><% out.println(session.getAttribute("searchinemail")); %></td>
													<td><% out.println(res.getString("t_name")); %></td>
													<td><% out.println(res.getString("quantity")); %></td>
													<td><input type="text" name="returnquan" class="form-control" value="0" disabled="disabled"></td>
													<td>					
														<button type="submit" class="btn btn-primary btn-round" value="<% out.println(res.getString("trn_id")); %>" name="btnedit">Edit</button>
														<button type="submit" class="btn btn-secondary btn-round" value="<% out.println(res.getString("trn_id")); %>" name="btndelete">Delete</button>
													</td>
												</tr>
												<% } %>
												</form>
											</tbody>
										<%
									} else
									{
										%>
										<tbody>
											<form>
												<%
												String query = "select transaction.trn_id ,transaction.email , transaction.quantity , tools.t_name from transaction join tools on transaction.tid = tools.tid where transaction.trn_id ='" + request.getParameter("btnedit") + "' and transaction.status = '0'";
												ResultSet res = st.executeQuery(query);
												while (res.next()) {
												%>
												<tr>
													<td><% out.println(session.getAttribute("searchinemail")); %></td>
													<td><% out.println(res.getString("t_name")); %>
													<input type="hidden" value="<% out.println(res.getString("t_name")); %>" name="toolname">
													</td>
													<td><% out.println(res.getString("quantity")); %>
													<input type="hidden" value="<% out.println(res.getString("quantity")); %>" name="quanhave">
													</td>
													<td><input type="text" class="form-control" name="returnquan" value="0" pattern="[0-9]+" required="required"></td>
													<td>					
														<button type="submit" class="btn btn-primary btn-round" value="<% out.println(res.getString("trn_id")); %>" name="btnupdate">Update</button>
														<button type="submit" class="btn btn-secondary btn-round" value="<% out.println(res.getString("trn_id")); %>" name="btncancel">Cancel</button>
													</td>
												</tr>
												<% } %>
												</form>
											</tbody>
										<%
										}
										if(request.getParameter("btncancel") != null)
										{
											response.sendRedirect("checkindetails.jsp");
										}
										if(request.getParameter("btndelete") != null)
										{
											String select = "select * from transaction where trn_id = '" + request.getParameter("btndelete") + "'";
											ResultSet res = st.executeQuery(select);
											while (res.next()) {
												String update = "update transaction set quantity = '0' , status = '1' where trn_id='" + request.getParameter("btndelete") + "'";
												String tid = res.getString("tid");
												if(st.executeUpdate(update) != 0 )
												{
													Statement stat = con.createStatement();
													String ret = "select * from tools where tid = '" + tid + "'";
													ResultSet result = stat.executeQuery(ret);
													Integer onrent = 0;
													Integer remain = 0;
													while(result.next())
													{
														onrent = Integer.parseInt(result.getString("on_rent"));
														remain = Integer.parseInt(result.getString("remain_quantity"));
														remain = remain + onrent;
														String upt = "UPDATE `stm`.`tools` SET `remain_quantity` = '" + remain + "' , `on_rent` = '0' WHERE `tid` = '" + tid + "';";
														if(stat.executeUpdate(upt) != 0 )
														{
															response.sendRedirect("checkindetails.jsp");
														}
													}
													}
												}
											}
										if(request.getParameter("btnupdate") != null)
										{
											Integer quanhave = Integer.parseInt(request.getParameter("quanhave").trim());
											Integer returnquan = Integer.parseInt(request.getParameter("returnquan"));
											if(quanhave < returnquan)
											{
												out.println("<script>alert('Please !!!!! Check return quantity......')</script>");
											}
											else
											{
												if(quanhave == returnquan)
												{
													String select = "select * from transaction where trn_id = '" + request.getParameter("btnupdate") + "'";
													ResultSet res = st.executeQuery(select);
													while (res.next()) {
														Integer qu = Integer.parseInt(res.getString("quantity"));
							                            qu = qu - returnquan;
							                            String update = "update transaction set quantity = '" + qu + "' , status = '1' where trn_id='" + request.getParameter("btnupdate") + "'";
							                            if(st.executeUpdate(update) != 0)
							                            {
							                            	String ret = "select * from tools where t_name = '" + request.getParameter("toolname").trim() + "'";
							                            	ResultSet rs = st.executeQuery(select);
							                            	while(rs.next())
							                            	{
							                            		Integer onrent = Integer.parseInt(rs.getString("on_rent"));
							                            		Integer remain = Integer.parseInt(rs.getString("remain_quantity"));
							                            		
							                            		onrent = onrent - returnquan;
							                            		remain = remain + returnquan;
							                            		
							                            		String upt = "update tools set remain_quantity = '" + remain + "' , on_rent = '" + onrent + "' where t_name = '" + request.getParameter("toolname").trim() + "'";
							                            		if(st.executeUpdate(upt) != 0 )
							                            		{
							                            			response.sendRedirect("checkindetails.jsp");
							                            		}
							                            	}
							                            }
													}
												}
												else
												{
													String select = "select * from transaction where trn_id = '" + request.getParameter("btnupdate") + "'";
													ResultSet res = st.executeQuery(select);
													while (res.next()) {
														Integer qu = Integer.parseInt(res.getString("quantity"));
							                            qu = qu - returnquan;
							                            String update = "update transaction set quantity = '" + qu + "' where trn_id='" + request.getParameter("btnupdate") + "'";
							                            if(st.executeUpdate(update) != 0)
							                            {
							                            	out.println("ok");
							                            	String ret = "select * from tools where t_name = '" + request.getParameter("toolname").trim() + "';";
							                            	ResultSet rs = st.executeQuery(ret);
							                            	while(rs.next())
							                            	{							                            		
							                            		Integer onrent = Integer.parseInt(rs.getString("on_rent"));
							                            		Integer remain = Integer.parseInt(rs.getString("remain_quantity"));
							                            		
							                            		onrent = onrent - returnquan;
							                            		remain = remain + returnquan;
							                            		Statement s = con.createStatement();
							                            		String upt = "update tools set remain_quantity = '" + remain + "' , on_rent = '" + onrent + "' where t_name = '" + request.getParameter("toolname").trim() + "'";
							                            		if(s.executeUpdate(upt) != 0 )
							                            		{
							                            			response.sendRedirect("checkindetails.jsp");
							                            		}
							                            	}
							                            }
													}
													
												}
											}
										}
										} else {
										out.println("Not connected");
										}
										} catch (Exception e) {
										out.println(e);
										}
										%>
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