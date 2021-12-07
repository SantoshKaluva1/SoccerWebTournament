<html>
<head>
        <title>
           Login Page 
        </title>
        <script src="scripts/maps.js"></script>
		<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsc5pXFgw3kxEz5Bbf6Pfuy4kcWLdCO1k&callback=initMap">
</script> 
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="css/homepage.css">  
     </head>

<body>
    <div class="fields">
        <h2 style="margin-top: 10px;
  margin-bottom: 5px;
background-color: #04AA6D;
width: 200px;
color: white;
margin-bottom: 20px;
padding-left: 10px;
margin-left:22%;" id="fieldOverHeader">Fields Overview</h2>
            <img style="margin-left:-65% !important;" src="css/Fields.png" alt="Fields Overview" width="800" height="600"/>
        </div>
    <div class="navbar">
        <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
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

        <a class="active" href="maps.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Maps</a>
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
        %>       </div>
    
    <div><h1 style="margin-top: 10px;
  margin-bottom: 5px;
  margin-top:80px;
background-color: #04AA6D;
width: 400px;
color: white;
padding-left: 10px;
margin-left: 40%;">Tournament Location for All Matches</h1></div>
    <div class="map" id="map"></div>
</body>
</html>