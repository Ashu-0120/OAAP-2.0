<%@page import="java.sql.*" %> <%@page import="oaapDao.oaapUserDao" %> <%@page
import="oaapDao.UserInfoJavaBean" %>

<html>
  <body>
    <% String username=request.getParameter("username"); String
    password=request.getParameter("password"); try { UserInfoJavaBean uijb=new
    UserInfoJavaBean(); oaapUserDao oud=new oaapUserDao();
    uijb=oud.oaapUserValidate(username,password);
    System.out.println("oooojaaanaaaaa"+uijb.getStatus());
    if(uijb.getStatus()==1){ String userid=String.valueOf(uijb.getId());
    session.setAttribute("question_counter","1");
    session.setAttribute("sub_question_counter","0");
    session.setAttribute("correct_question","0");
    session.setAttribute("difficulty","1"); session.setAttribute("mark","0");
    session.setAttribute("count_easy","0");
    session.setAttribute("count_medium","0");
    session.setAttribute("count_hard","0");
    session.setAttribute("correct_count_easy","0");
    session.setAttribute("correct_count_medium","0");
    session.setAttribute("correct_count_hard","0");
    session.setAttribute("username",username);
    session.setAttribute("name",uijb.getName());
    session.setAttribute("uid",userid); session.setAttribute("login","login");
    session.setAttribute("login_status","true");
    session.setAttribute("start_time","0");
    session.setAttribute("time_taken","0");
    System.out.println("AAOOOKHELEN="+(String)session.getAttribute("correct_count_easy"));
    System.out.println("AAOOOKHELEN="+(String)session.getAttribute("correct_count_medium"));
    System.out.println("AAOOOKHELEN="+(String)session.getAttribute("correct_count_hard"));
    %>

    <jsp:forward page="Home.jsp" />
    <% } else { session.setAttribute("login_status","false"); %>
    <jsp:include page="Home.jsp" />
    <% } } catch(Exception e) { out.print(e); } %>
  </body>
</html>
