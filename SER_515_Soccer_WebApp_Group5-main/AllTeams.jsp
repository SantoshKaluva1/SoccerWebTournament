<html>
    <head>
    <style>
body {
 background-image: url(css/teams.jpeg) !important;;
}
</style>
        <title>
           Login Page 
        </title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/homepage.css">  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
     </head>
    <body>
    <div class="navbar">
        <a class="firstele" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
        <a href="about.jsp
        "><i class="fa fa-info" aria-hidden="true"></i> About</a>
        <div class="subnav">
          <button class="subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Apply <i class="fa fa-caret-down"></i></button>
          <div class="subnav-content">
            <a href="refereeRegistration.jsp"> As Referee</a>
            <a href="SponsersBid.jsp"> As Sponser</a>
          </div>
        </div> 
        
       <div class="subnav">
            <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Teams & Schedule <i class="fa fa-caret-down"></i></button>
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
        %>      </div>

<h2 id="teamsTourHeader"> Teams for the tournament </h2>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>


<div class=totalTeams>
<button type="button" class="collapsible">Men's</button>
<div class="content">

<%
for (int i=8;i<=19;i++)
{
  String currentAgeGroup = String.valueOf(i);
  
  ArrayList<String> ListTeam = new ArrayList<String>();
  ArrayList<String> CoachList = new ArrayList<String>();


try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName, Coach from user where Approved='True' and UserName!='akhil' and Gender='male' and AgeGroup=? ";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,currentAgeGroup);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
ListTeam.add(rs.getString("UserName"));
CoachList.add(rs.getString("Coach"));
}
if(i==19)
{
  currentAgeGroup="48+";
}
}
catch(Exception e)
{
    out.println(e);
}
finally
{

}
%>


  <button type="button" class="collapsible">Age Category: <%= currentAgeGroup %> </button>
  <div class="content">
     <table id="teams">
  <tr>
    <th>Team</th>
    <th>Coach</th>
  </tr>

  <%

  for(int j=0;j<CoachList.size();j++)
  {
    %>
  <tr>
    <td><%= ListTeam.get(j) %></td>
    <td><%= CoachList.get(j) %></td>
  </tr>
  <%
  }
  %>
  </table>
  </div>
<%
}
%>
</div>


<button type="button" class="collapsible">Women's</button>
<div class="content">

<%
for (int i=8;i<=19;i++)
{
  
  String currentAgeGroup = String.valueOf(i);
  
  ArrayList<String> ListTeam = new ArrayList<String>();
  ArrayList<String> CoachList = new ArrayList<String>();


try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName, Coach from user where Approved='True' and UserName!='akhil' and Gender='female' and AgeGroup=? ";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,currentAgeGroup);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
ListTeam.add(rs.getString("UserName"));
CoachList.add(rs.getString("Coach"));
}
if(i==19)
{
  currentAgeGroup="48+";
}
}
catch(Exception e)
{
    out.println(e);
}
finally
{

}
%>


  <button type="button" class="collapsible">Age Category: <%= currentAgeGroup %> </button>
  <div class="content">
     <table id="teams">
  <tr>
    <th>Team</th>
    <th>Coach</th>
  </tr>

  <%

  for(int j=0;j<CoachList.size();j++)
  {
    %>
  <tr>
    <td><%= ListTeam.get(j) %></td>
    <td><%= CoachList.get(j) %></td>
  </tr>
  <%
  }
  %>
  </table>
  </div>
<%
}
%>
</div>


</div>


<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active1");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>



</body>
</head>
  </html>

