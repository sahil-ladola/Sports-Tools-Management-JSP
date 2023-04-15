<%@ page import="java.sql.*"%>
<%
if (request.getParameter("btnRegister") != null) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:33060/stm";
		String username = "root";
		String password = "root";
		Connection con = DriverManager.getConnection(url, username, password);
		if (con != null) {
	Statement st = con.createStatement();
	String select = "select * from customer where email = '" + request.getParameter("txtEmail")+"'";
	ResultSet rs = st.executeQuery(select);
	int count = 0;
	while(rs.next())
	{
		count++;
	}
	if(count==1)
	{
		out.println("<script>alert('User already exists')</script>");
		response.sendRedirect("register.jsp");
	}
	else
	{
		if(request.getParameter("gender").equals("1"))
		{
			session.setAttribute("gender", "gender");
			/* session.setAttribute("fname", request.getParameter("txtFname"));
			session.setAttribute("lname", request.getParameter("txtLname"));
			session.setAttribute("address", request.getParameter("txtAddress"));
			session.setAttribute("landmark", request.getParameter("txtLandmark"));
			session.setAttribute("area", request.getParameter("txtArea"));
			session.setAttribute("postal", request.getParameter("txtPostalCode"));
			session.setAttribute("contact", request.getParameter("txtMobileNum"));
			session.setAttribute("email", request.getParameter("txtEmail")); */
			response.sendRedirect("register.jsp");
		}
		else
		{
			String query = "insert into customer (fname,lname,address,landmark,area,postalcode,gender,contactno,email) values('" + request.getParameter("txtFname") + "','" + request.getParameter("txtLname") + "','" + request.getParameter("txtAddress") + "','" + request.getParameter("txtLandmark") + "','" + request.getParameter("txtArea") + "','" + request.getParameter("txtPostalCode") + "','" + request.getParameter("gender") + "','" + request.getParameter("txtMobileNum") + "','" + request.getParameter("txtEmail") + "');";
			Statement in = con.createStatement();
			if(in.executeUpdate(query) != 0)
			{
				out.println("<script>alert('Registered successfully!!!!!')</script>");
				response.sendRedirect("dashboard.jsp");
			}
			else
			{
				out.println("<script>alert('Something went wrong , Try again!!!!!')</script>");
			}
		}
	}
		}
	} catch (Exception e) {
		out.println(e);
	}
} else {
	response.sendRedirect("register.jsp");
}
%>