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
            <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>            <a class="active" href="about.jsp"><i class="fa fa-info" aria-hidden="true"></i> About</a>
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
            <a  href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>
            
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
        %>


          </div>

    <div class="hotel">






</p><h1>About the soccer website</h1>

<hr><br>


Go to our Web site at http://www.soccer.com/register.html and complete your application. Click on APPLY above. The competition is expected to be keen at our Soccer ONLY Sun Devil Intramurals, along with Cloud Park (CLD-17 fields) complexes. Bring your team or your entire Club and enjoy the best 2 day tournament in the Region. We will have multiple flights (as needed) for the Fall Classic with 4-8 teams per flight with a 3 game minimum for each team.                                       <br>                                                  <br>We will have a large number of teams that play Short-Sided games in this tournament. We have under 8, 9, 10 playing (7v7); or under 10 may opt to play (9v9), under 11, 12 playing (9v9) or under 12 may also opt to play (11v11). Under 13-14-15 teams play (11v11). We encourage all new under 8 through under 14 teams to make their soccer tournament debut at the adidas Warrior Fall Classic.                                  <br>                                       <br>WHEN: December 15-18, 2021 Where: Arizona, Tempe                                                 <br>                                       <br>FEES: u8-u9-u10 (7v7) $525; u10-u11-u12 (8v8) $575; u12-u13-u14-u15 (11v11) $625                                                  <br>                                       <br>APPLICATION DEADLINE: September 10, 2021. All applications received by the deadline will be evaluated equally in the selection process. Applications received after the deadline will automatically be placed on a waiting list. Any questions may be directed to soccorsdfc@asu.edu                                      <br>                                      <br>HOTELS: The Soccer Tournament is a stay to play tournament. A team MUST stay in a listed hotel to be accepted and participate in the tournament. The Soccer Housing Bureau (SiteSearch) has blocked rooms at the hotels listed at the best possible rates. Please click on the Find A Hotel link in the left hand column to secure your hotel rooms.                                             <br>                                       <br>Make Payment to:  Soccer Club;  ATTN: SELECTION COMMITTEE, P.O. BOX 24232, DAYTON OHIO 45424  (Please include WFC# in all correspondence)                                                <br>                                       <br>The process includes the                                        <br>1) Completion of the application form                                                  <br>2) CLICK APPLY at the top of Front Page!                                                  <br>3) After you submit the form you will receive an APPLICATION CERTIFICATE with the data that you provided (a duplicate certificate is also sent to the primary email you provided on your application). Payments may be made online via Credit Card.                                                  <br>4) Return the APPLICATION CERTIFICATE via a credit card Online during your registration or send a check made out to  Soccer Classic to the address listed on the Certificate.                                                  <br>   



<p></p>



<a href="javascript: expandtab('maintab', 0)"></a><p></p>
<script type="text/javascript">
startajaxtabs("maintab")
</script>

</div>

    
  </div>
  </body>
</head>
  </html>






