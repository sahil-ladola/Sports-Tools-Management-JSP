<%@ page import="java.sql.*"%>
<%
if(request.getParameter("btnCheckout") != null)
{
try {
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:33060/stm";
	String username = "root";
	String password = "root";
	Connection con = DriverManager.getConnection(url, username, password);
	if (con != null) {
		Statement st = con.createStatement();
		if(request.getParameter("toolname") != null)
		{
			String toolname = request.getParameter("toolname").trim();
			String select = "select * from tools where t_name = '" + toolname +"'";
			ResultSet rs = st.executeQuery(select);
			Integer tid=0, remain_quantity=0 , on_rent=0;
			while (rs.next()) {
				tid = rs.getInt("tid");
				remain_quantity = rs.getInt("remain_quantity");
				on_rent = rs.getInt("on_rent");
			}
		Integer need = Integer.parseInt(request.getParameter("needquan"));
		if(need > remain_quantity)
		{
			out.println("<script>alert('Sorry!!!!!Currently out of stock......')</script>"); 
		}
		else
		{
			String insert = "INSERT INTO transaction(tid,email,quantity,status) values('" + tid + "','" + session.getAttribute("searchoutemail") + "','" + need + "', '0');";
			if(st.executeUpdate(insert) != 0)
			{
				remain_quantity = remain_quantity - need;
				on_rent = on_rent + need;
				String update = "update tools set remain_quantity = '" + remain_quantity + "' , on_rent = '" + on_rent + "' where tid = '" + tid + "'";
				if(st.executeUpdate(update) != 0)
				{
					session.removeAttribute("searchoutemail");
					out.println("<script>alert('Checkout successful')</script>");
					response.sendRedirect("dashboard.jsp");
				}
			}
		} 
	}
}
}
catch(Exception e)
{
	out.println(e);
}
} else
{
	response.sendRedirect("checkoutdetails.jsp");
}
%>