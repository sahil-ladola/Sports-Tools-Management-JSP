<%@ page import="java.sql.*"%>
<%
if (request.getParameter("btnLogin") != null) {
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:33060/stm";
		String username = "root";
		String password = "root";
		Connection con = DriverManager.getConnection(url, username, password);
		if (con != null) 
		{
			Statement st = con.createStatement();
			String select = "select * from login where username = '" + user +"'";
			ResultSet rs = st.executeQuery(select);
			int count = 0;
			while(rs.next())
			{
				session.setAttribute("pass", rs.getString("password"));
				count++;
			}
			if(count == 1)
			{
				String ps = session.getAttribute("pass").toString();
				if (ps.equals(pass)) 
				{
					session.setAttribute("username", user);
					session.setAttribute("password", pass);
					if (request.getParameter("remember") != null)
					{
						session.setAttribute("remember", "true");
					}
					else
					{
						session.setAttribute("remember", "false");
					}
					session.setAttribute("login", "login");
					response.sendRedirect("dashboard.jsp");
				}
				else
				{
					session.setAttribute("err", "error");
					response.sendRedirect("index.jsp");
				}
			}
			else
			{
				session.setAttribute("err", "error");
				response.sendRedirect("index.jsp");
			}
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
else
{
	response.sendRedirect("index.jsp");
}
%>