<%@page  import="java.sql.*" %>
<%@page import ="jakarta.servlet.*" %>
<%@page import ="jakarta.servlet.http.*" %>

<html>
 <body>

 <%
 String username=request.getParameter("username");
String password=request.getParameter("password");

try
 {
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","AshiTiwari","2001");
PreparedStatement ps=con.prepareStatement("select * from oaa_userinfo where username=? and password=?");
ps.setString(1,username);
ps.setString(2,password);



	 ResultSet rs=ps.executeQuery();
	 if (rs.next())
		   {
              
			  RequestDispatcher rd1=request.getRequestDispatcher("Home.jsp");

			  rd1.include(request,response);

		   }

else
{
		out.print("<h1 align=center>Invalid Username or Password</h1>");
		out.flush();
              RequestDispatcher rd1=request.getRequestDispatcher("Home.jsp");// Login Modal will be open
			  rd1.include(request,response);

}

 }

 catch(Exception e)
	{ 
		out.print(e);
	}

%>
  
 </body>
</html>