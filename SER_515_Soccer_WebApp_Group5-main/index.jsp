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



        <a class="active firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
        <a href="about.jsp"><i class="fa fa-info" aria-hidden="true"></i> About</a>
        <div class="subnav">
          <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Apply <i class="fa fa-caret-down"></i></button>
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
      </div>

             <h2 style=" margin-top: 20px;
    background-color: #04AA6D;
    color: white;
    width:250px;
    padding-left: 10px;
    margin-left: 40%;
    margin-bottom: 20px;"> Welcome back, <%= session.getAttribute("username") %> </h2>
        <%
        }
        else
        {
          %>
          <a href="login.html"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a>
               </div>
      </div>
        <%
        }
        %>
 

 <div class="TournamentNews">

        <h2><u>Tournament News</u></h2>
        <p>
    The tournament is about to kickstart from 1 Jan 2022, <a href="register.html">Register your TEAM today</a>
    </p>
        
      </div>
      <div class="UpcomingEvents">
        <h2><u>Upcoming Events</u></h2>
        <p class="blink">Expected schedule for registered teams is out
        <br> <a href="matchScheduling.jsp">CHECK OUT HERE</a>
    </p>
        
      </div>

   

        <div class="footer">
        <form action="SubscribedSuccessfully.html">
           
            <div class="container">
              <h3>Subscribe to get our Emails and Notifications</h3>
              
            </div>
          
            <div class="container" style="background-color:white">
              <input type="text" placeholder="Name" name="name" required>
              <input type="text" placeholder="Email address" name="mail" required>
              
            </div>
          
            <div class="container">
              <input type="submit" value="Subscribe!">
            </div>
          </form>
          </div>
    </body>
</html>