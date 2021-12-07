<html>

    <head>
        <title>
           Login Page 
        </title>
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
            <a class="active" href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>
            
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

    <div class="hotel">
    <h1>Requesting/Finding Hotels for the 2021 Soccer Tournament</h1>
    <p>Your team is required to book hotel rooms using the hotels only listed below to participate in the Classic. Teams not staying at one or more of these properties, will not be considered for acceptance to the tournament.

While you are free to select any hotel property you wish, you will be asked to VERIFY your rooming arrangements upon acceptance AND when you register your team on Friday night.
</p>

<div style="height: 30px; width:400px;padding-top:5px;"><a class="form-submit-button" style="text-decoration:none;" href="https://hotels.sitesearchllc.net/group-event?id=50850" target="_blank">Go to Hotel Booking</a></div>

<strong>When you click on the Hotel Booking button above, you will be redirected to a third-party hotel booking service and will no longer be on the official Soccer Tournament web site. Any transactions conducted on that site are between you and the hotel booking service.</strong>
<p>If you have any questions regarding your rooms or the procedure, please contact the <a href="Contact.html">housing bureau</a>.
    
  </div>
  </body>
</head>
  </html>

