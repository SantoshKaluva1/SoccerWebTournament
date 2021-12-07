<html>
    <head>
        <title>
           Soccer Tournament Website 
        </title>
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
     </head>
    <body>
        <div class="navbar">
<div class="logo">
            <img src="Images/logo.jpg">
          </div>
            <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>            <a href="about.jsp
            "><i class="fa fa-info" aria-hidden="true"></i> About</a>
            <div class="subnav">
              <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Apply <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
                <a href="refereeRegistration.jsp"> As Referee</a>
                <a href="SponsersBid.jsp"> As Sponser</a>
              </div>
            </div> 
            <a href="FAQ.html"><i class="fa fa-question" aria-hidden="true"></i> FAQs</a>
            <a href="#"><i class="fa fa-users" aria-hidden="true"></i> Teams & Schedule</a>
            <a href="maps.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Maps</a>
            <a href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>
<% 
         Object session1 = session.getAttribute("username");
        if(session1 != null)
        {
          %>

        <div class="subnav">
          <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Welcome, <%= session.getAttribute("username") %> <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
            <a href="AccessLayeredPage.jsp">Privileged Access</a>
            <a href="jsp/logout.jsp">Logout</a>
          </div>
          </div>
        <%
        }
        else
        {
          %>
          <a href="login.html"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a>
        <%
        }
        %>           </div>

        <h1 style="color: teal;">We have faced an issue on our end, please retry placing the bid.</h1>
    </body>
</html>