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
        <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
        <a href="about.jsp"><i class="fa fa-info" aria-hidden="true"></i> About</a>
        <div class="subnav">
          <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Apply <i class="fa fa-caret-down"></i></button>
          <div class="subnav-content">
            <a href="refereeRegistration.jsp"> As Referee</a>
            <a href="SponsersBid.jsp"> As Sponser</a>
          </div>
        </div> 
        <a href="FAQ.html"><i class="fa fa-question" aria-hidden="true"></i> FAQs</a>
        <<div class="subnav">
            <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Teams & Schedule <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
              <a href="AllTeams.jsp">Teams</a>
              <a href="matchScheduling.jsp">Schedule</a>
              <a href="leaderBoard.jsp">Leaderboard</a>
            </div>
          </div> 
        <a href="maps.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Maps</a>
       <a href="HotelBooking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Book Hotel</a>
        <a href="login.html"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a>
      </div>


<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%
ArrayList<String> ListTeam = new ArrayList<String>();
ListTeam.add("CSK");
ListTeam.add("RCB");
ListTeam.add("SRH");
ListTeam.add("MI");

if (ListTeam.size() % 2 != 0)
   {
       ListTeam.add("Bye");
   }

   int numDays = ListTeam.size()+1;
   int halfSize = ListTeam.size() / 2;

   List<String> teams = new ArrayList<String>();

   for(String i: ListTeam)
   {
	   teams.add(i);
   }
   teams.remove(0);

   int teamsSize = teams.size();
   
    %>
    <h2 id="scheduleHeader"> Schedule for the tournament </h2>

    <%
   for (int day = 0; day < numDays; day++)
   {
       int t=day+1;
       %>
       <h3 id="dayHeader"> Day <%= t %> </h3>
       <table id="teams">
       <tr>
           <th>Team VS </th>
           <th>Team</th>
        </tr>

    <%
       int teamIdx = day % teamsSize;
       int count=0;
       if(teams.get(teamIdx).equals("RCB") || ListTeam.get(0).equals("RCB"))
       {
         count+=1;
        %>
         <tr>
            <td><%= teams.get(teamIdx)%></td>  
            <td><%= ListTeam.get(0)%></td>
        <tr>
      <% } %>

      <%
       for (int idx = 1; idx < halfSize; idx++)
       {               
           int firstTeam = (day + idx) % teamsSize;
           int secondTeam = (day  + teamsSize - idx) % teamsSize;
           if(teams.get(firstTeam).equals("RCB")|| ListTeam.get(secondTeam).equals("RCB"))
           {
             count+=1;
           %>
           <tr>
           <td><%= teams.get(firstTeam)%></td>
            <td><%= ListTeam.get(secondTeam)%></td>
            </tr>
            <%
       }
       }
       %>
       </table>
       <%
   }
%>



</body>
</head>
  </html>
