<%@page  import="java.sql.*" %>
<%@page  import="oaapDao.UserInfoJavaBean" %>
<%@page  import="oaapDao.oaapUserDao" %>
<html>
<body>
<%

  String name=request.getParameter("register_name");
  String username=request.getParameter("register_username");
  String password=request.getParameter("register_password");
  String email=request.getParameter("register_email");
 String phone=request.getParameter("register_phone");

oaapUserDao oud=new oaapUserDao();

int status=oud.oaapUserInfo(name,username,password,email,phone);

System.out.println(status);
if(status==1){

session.setAttribute("reg_status","true");

%>
<jsp:include page="Home.jsp"/>
<%
}

%>
  </body>
  </html>