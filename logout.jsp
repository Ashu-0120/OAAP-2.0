
<%

           session.setAttribute("no_of_question","0");
		   session.setAttribute("question_count","0");
		   session.setAttribute("correct_question","0");
		   session.setAttribute("difficulty","1");
           session.setAttribute("mark","0");
           session.setAttribute("count_easy","1");
           session.setAttribute("count_medium","1");
           session.setAttribute("count_hard","1");
           session.setAttribute("username",null);
		   session.setAttribute("login","");
		   session.setAttribute("logout_status","true");
		 

%>
<jsp:forward page="Home.jsp"/>