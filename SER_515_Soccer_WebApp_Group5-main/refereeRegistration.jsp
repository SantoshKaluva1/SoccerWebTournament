<html>

    <head>
        <style>
body {
 background-image: url(css/refereePage.jpeg) !important;;
}
</style>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="css/homepage.css">  
     </head>
    <body>

        <div class="navbar">
<div class="logo">
            <img src="Images/logo.jpg">
          </div>
            <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>            <a href="about.jsp"><i class="fa fa-info" aria-hidden="true"></i> About</a>
            <div class="subnav">
              <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Apply <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
                <a href="refereeRegistration.jsp"> As Referee</a>
                <a href="SponsersBid.jsp"> As Sponser</a>
              </div>
            </div> 

            <div class="subnav">
              <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Teams & Schedule <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
                <a href="AllTeams.jsp">Teams</a>
                <a href="matchScheduling.jsp">Schedule</a>
                <a href="leaderBoard.jsp">Leaderboard</a>
              </div>
            </div> 

            <a href="maps.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Maps</a>
            <a href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>

            <div class="subnav">
              <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> More <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
              <a href="https://www.soccer.com/srch?query=liverpool" target="_blank">Fan Store</a>
               <a href="Gallery.jsp">Matches Gallery</a>  
         <a href="rules.html">Game Rules</a>
              <a href="Sponsers.jsp">Sponsers</a>
              <a href="TourReferee.jsp">Referees</a>


            </div>
          </div>


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
        %>          </div>


    <div class="register">
        <img src="css/icon.png" class="icon">
    <h1>Referee Registration Form</h1>
    <form action="jsp/refereeValidate.jsp" method = "post"> 
        <p>Username</p>
        <input type="text" name="username" placeholder="Pick a Username" required>
        <p>Lastname</p>
        <input type="text" name="lastname" placeholder="Enter FullName" required>
        <p>Email</p>
        <input type="text" name="email" placeholder="Enter email" required>
        <p>Mobile</p>
        <input type="text" name="mobile" placeholder="Enter mobile" required>
        <p>Years of Experience</p>
        <input type="text" name="yoe" placeholder="Enter yoe" required>
        <br>
        <br>
        
        <input type="submit" value="Register">
    </form>
  </div>
  </body>
</head>
  </html>

