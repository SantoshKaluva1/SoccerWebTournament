
<html>
 <head>

  
  <title>Image Gallery</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/homepage.css">
  <style type="text/css">

#gallery {
   line-height:0;
   -webkit-column-count:5; /* split it into 5 columns */
   -webkit-column-gap:5px; /* give it a 5px gap between columns */
   -moz-column-count:5;
   -moz-column-gap:5px;
   column-count:5;
   column-gap:5px;
}

#gallery img {
   width: 100% !important;
   height: auto !important;
   margin-bottom:5px; /* to match column gap */
}

  </style>
</head>
<body>

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

    <a href="maps.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Maps</a>
    <a href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>

    <div class="subnav">
      <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> More <i class="fa fa-caret-down"></i></button>
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
      
 
  
  <h1 style="margin-top: 10px;
  margin-bottom: 5px;
background-color: #04AA6D;
width: 500px;
color: white;
margin-bottom: 20px;
padding-left: 10px;
margin-left: 35%;">Welcome to Matches Gallery!!</h1>


<div id="gallery">
  
   <img src="Images/Image1.jpg">
   <img src="Images/image2.jpg">
   <img src="Images/image3.jpg">
   <img src="Images/image4.jpg">
   <img src="Images/image5.jpg">
   <img src="Images/image6.jpg">
   <img src="Images/image7.jpg">
   <img src="Images/image8.jpg">
   <img src="Images/image9.jpg">
   <img src="Images/image10.jpg">
   <img src="Images/image11.jpg">
   <img src="Images/image12.jpg">
   <img src="Images/image13.jpg">
   <img src="Images/image14.jpg">
  </div>
 
 </body>
</html>









