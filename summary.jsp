<%@page import="java.sql.*" %> <%@page import="oaapDao.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no,maximum-scale=1, user-scalable=0"
    />

    <!--Jquery CDN(Content Delivery Networks) links-->

    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <!--Google Icons Link-->

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <!---JQUERY LINK-->

    <!-- Bootstrap CSS -->
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <!---JQUERY LINK-->

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous"
    />

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
      integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
      integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
      crossorigin="anonymous"
    ></script>

    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <!--Link for Icons-->

    <link
      href="https://fonts.googleapis.com/css?family=Dosis"
      rel="stylesheet"
    />

    <link rel="stylesheet" type="text/css" href="summary.css" />

    <script src="summary.js"></script>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <script type="text/javascript">
      //$(window).on('load',function(){
      //     $('#subject_accuracy_modal').modal('show');
      //});
    </script>
  </head>
  <body>
    <%   
    oaapUserDao oud=new oaapUserDao(); 
    String uid=(String)session.getAttribute("uid"); 
    float correct_count_easy=Float.valueOf((String)session.getAttribute("correct_count_easy"));
    float correct_count_medium=Float.valueOf((String)session.getAttribute("correct_count_medium"));
    float correct_count_hard=Float.valueOf((String)session.getAttribute("correct_count_hard"));
    String count_easy=(String)session.getAttribute("count_easy");
    String count_medium=(String)session.getAttribute("count_medium");
    String count_hard=(String)session.getAttribute("count_hard");
    float notattempted=15-((Integer.parseInt(count_easy)-3)+Integer.parseInt(count_medium)+Integer.parseInt(count_hard));
    double percentile=(Double.valueOf((String)session.getAttribute("mark"))/45.0)*95.0;
    String result="";
    float accuracy_score=(float)((correct_count_easy*1.0)+(correct_count_medium*2.0)+(correct_count_hard*4.0));
    accuracy_score =(float)((accuracy_score/45.0)*95.0);
    System.out.println("accuracyscore="+accuracy_score);
    accuracy_score=(accuracy_score+oud.oaapFetchSubjectAccuracy((String)session.getAttribute("subject"),uid))/2;
    System.out.println("accuracyscore="+accuracy_score); int
    status=oud.oaapInsertSubjectAccuracy((String)session.getAttribute("subject"),uid,accuracy_score);
    System.out.println("Correct_count_easy"+correct_count_easy);
    System.out.println("Correct_count_medium"+correct_count_medium);
    System.out.println("Correct_count_hard"+correct_count_hard);
    //long endTime=System.currentTimeMillis();
    //long averageTimeTaken=(Long.parseLong((String)session.getAttribute("time_taken")))/15000;
    //System.out.println("AverageTimeTaken="+averageTimeTaken);
    //System.out.println(endTime);
    //System.out.println("StartTime="+(totalTimeTaken-endTime));
    if(percentile>=90.0&&percentile<=100.0){ result="Outstanding"; } else
    if(percentile>=80.0&&percentile<90.0){ result="Excellent"; } else
    if(percentile>=70.0&&percentile<80.0){ result="Very Good"; } else
    if(percentile>=60.0&&percentile<70.0){ result="Good"; } else
    if(percentile>=50.0&&percentile<60.0){ result="Fair"; } else
    if(percentile>=40.0&&percentile<50.0){ result="Average"; } else
    if(percentile>=30.0&&percentile<40.0){ result="Pass"; } else
    if(percentile<30.0){ result="Fail"; } %>
    <!------------------MODAL FOR Acuuracy Level ----------------------
<div class="modal fade" id="subject_accuracy_modal" >
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Accuracy Level</h4>
<a href="#" data-dismiss="modal"><i class="fa fa-close"></i></a>
        
      </div>

      <div class="modal-body">
<!-------------------------------------LOGIN------------------------------------>

    <!----------------------------LOGIN LOGIC-------------------------------------------->

    <!--<div class="row" id="progressive_struc"><!--Progressbar Structure-
      <div class="row" id="progressbar"><!--Progressbar Dynamic
     <p id="level">Novice</p><!--Difficulty Level
     <p id="percentcount">0</p><!--Accuracy Percentage
   </div>
   </div>

          <div class="row" id="progressive_struc" style="margin-top: 100px;"><!--Progressbar Structure
      <div class="row" id="progressbar"><!--Progressbar Dynamic
     <p id="level">Novice</p><!--Difficulty Level
     <p id="percentcount">0</p><!--Accuracy Percentage
   </div>
   </div>




<button  onclick="easy_inc()">Easy</button>
<button  onclick="medium_inc()">Medium</button>
<button  onclick="hard_inc()">Hard</button>


      </div>
      
      <div class="modal-footer">

       

      </div>

      
      
    </div>
  </div>
</div>
 <!----------------MODAL FOR Accuracy level ---------------------------->

    <div class="container-fluid" style="">
      <div class="row">
        <!---MAIN DIV-->
        <div class="col" id="summary_main">
          <div class="row">
            <div class="col" id="main_header">
              <h1
                style="text-align: center; padding-right: 30vw"
                id="main_title"
              >
                S U M M A R Y
              </h1>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Name</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"
                ><%= (String)session.getAttribute("name")%></label
              >
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Subject</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"
                ><%=(String)session.getAttribute("subject")%></label
              >
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Correct</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"
                ><%=(int)(correct_count_easy+correct_count_medium+correct_count_hard)%></label
              >
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Incorrect</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"
                ><%=15-(int)(correct_count_easy+correct_count_medium+correct_count_hard)%></label
              >
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Not Attempted</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=(int)notattempted%></label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Easy Question Solved</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=(Integer.parseInt(count_easy)-3)%></label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Medium Question Solved</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=count_medium%></label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Hard Question Solved</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=count_hard%></label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Percentile</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=percentile%>%</label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Remarks</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=result%></label>
            </div>
          </div>

          <div class="row">
            <div class="col" id="main_body">
              <label id="body_label">Subject-Accuracy</label>
            </div>
            <div class="" id="vertical_line"></div>
            <div class="col" id="main_body">
              <label id="body_label_R"><%=accuracy_score%>%</label>
            </div>
          </div>

          <form action="Home.jsp">
            <button
              class="btn btn-success"
              style="
                margin-top: 10px;
                margin-left: 450px;
                height: 60px;
                width: 200px;
              "
            >
              Return to Home
            </button>
          </form>
        </div>
      </div>
    </div>
  </body>
  <% %>
</html>
