<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("err") != null)
	{
		out.println("<script>alert('Invalid Credential!');</script>");
		session.removeAttribute("err");
	}
    String username = null;
	String password = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            }
            else if(cookie.getName().equals("password")) {
                password = cookie.getValue();
              }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunSports | Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar bg-white">
        <div class="container-fluid">
            <h3 class="navbar-brand ml-5 pl-3">FunSports</h3>
            <div class="d-flex">
            	<a class="text-decoration-none text-secondary nav-link mr-5 pr-4" href="home.jsp">Home</a>
            </div>
        </div>
    </nav>
	<div class="container">
		<div class="row justify-content-center mt-5">
			<div class="col-md-12 col-lg-10">
				<div class="wrap d-md-flex">
					<div class="img" style="background-image: url(images/login.jpg);">
					</div>
					<div class="login-wrap p-4 p-md-5">
						<div class="d-flex">
							<div class="w-100">
								<h3 class="mb-4 border-bottom">FunSports Sign In</h3>
							</div>
						</div>
						<form class="signin-form" action="logincheck.jsp">
							<div class="form-group mb-3">
								<label class="label" for="txtUsername">Username</label> <input
									type="text" placeholder="Username" value="<%= username %>" class="form-control" pattern="[A-Za-z]+" required="required"
									name="username" ID="txtUsername">
							</div>

							<div class="form-group mb-3">
								<label class="label" for="txtPassword">Password</label> <input
									type="password" placeholder="Password" value="<%= password %>" class="form-control" required="required"
									name="password" ID="txtPassword">
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50 text-left">
									<label class="checkbox-wrap checkbox-secondary mb-0">Remember
										Me <input type="checkbox" name="remember" checked> <span
										class="checkmark"></span>
									</label>
								</div>
							</div>
							<div class="form-group">
								<input type="submit" ID="btnLogin" name="btnLogin" value="Sign In"
									class="form-control btn rounded submit px-3"
									Style="background-color: orangered; color: white;">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>