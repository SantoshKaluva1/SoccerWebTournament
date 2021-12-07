<html>
    <head>
    <style>
body {
 background-image: url(css/scheduleImage.jpeg) !important;;
}
</style>
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
        %>       </div>



<h2 id="scheduleHeader"> Schedule for the tournament </h2>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>   
<%@ page import="java.text.*"%> 


<div class=totalTeams>
<button type="button" class="collapsible">Men's</button>
<div class="content">

<%


for (int i=8;i<=19;i++)
{
  String currentAgeGroup = String.valueOf(i);
  
  ArrayList<String> ListTeam = new ArrayList<String>();
  List<String> refereeNames = new ArrayList<String>();

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName from user where Approved='True' and UserName!='akhil' and Gender='male' and AgeGroup=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,currentAgeGroup);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
ListTeam.add(rs.getString("UserName"));
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

%>
<button type="button" class="collapsible">Age Category: <%= currentAgeGroup %> </button>
<div class="content">

<%

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select firstname from referee where approved='True';";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
refereeNames.add(rs.getString("firstname"));
}
}
catch(Exception e)
{
    out.println(e);
}
finally
{}

int refSize=refereeNames.size();


if (ListTeam.size() % 2 != 0)
   {
       ListTeam.add("Bye");
   }

   int numDays = ListTeam.size()+1;
   int halfSize = ListTeam.size() / 2;

   List<String> teams = new ArrayList<String>();

   for(String j: ListTeam)
   {
	   teams.add(j);
   }

   if(teams.size()>0)
   {
   teams.remove(0);
   }

  int teamsSize = teams.size();
  String dt = "2021-12-30";  // Start date
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  Calendar c = Calendar.getInstance();
  c.setTime(sdf.parse(dt));
  c.add(Calendar.DATE, 1);  // number of days to add
  dt = sdf.format(c.getTime());
  int fieldcount=1;
  int refcount=0;
   for (int day = 0; day < numDays && teams.size()>0; day++)
   {
    c.setTime(sdf.parse(dt));
    c.add(Calendar.DATE, 1);  // number of days to add
    dt = sdf.format(c.getTime());
       %>
       <h3 id="dayHeader"> Date: <%= dt %> </h3>
       <table id="teams">
       <tr>
           <th>Team </th>
           <th>Team</th>
           <th>Location </th>
           <th>Referee </th>
        </tr>

    <%
       int teamIdx = day % teamsSize;
        %>
         <tr>
            <td><%= teams.get(teamIdx)%></td>  
            <td><%= ListTeam.get(0)%></td>
            <td>Field :<%= fieldcount %></td>
            <td><%= refereeNames.get(refcount) %></td>
        <tr>

      <%
      fieldcount+=1;
      refcount+=1;
      if(refcount==refSize)
      {
        refcount=0;
      }
      if(fieldcount==12)
      {
        fieldcount=1;
      }
       for (int idx = 1; idx < halfSize; idx++)
       {               
           int firstTeam = (day + idx) % teamsSize;
           int secondTeam = (day  + teamsSize - idx) % teamsSize;
           %>
           <tr>
           <td><%= teams.get(firstTeam)%></td>
            <td><%= teams.get(secondTeam)%></td>
            <td>Field :<%= fieldcount %></td>
            <td><%= refereeNames.get(refcount) %></td>
            </tr>
            <%
      fieldcount+=1;
      if(fieldcount==11)
      {
        fieldcount=1;
      }
      refcount+=1;
      if(refcount==refSize)
      {
        refcount=0;
      }
       }
       %>
       </table>
       <%
   }

%>
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


try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName from user where Approved='True' and UserName!='akhil' and Gender='female' and AgeGroup=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,currentAgeGroup);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
ListTeam.add(rs.getString("UserName"));
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

%>
<button type="button" class="collapsible">Age Category: <%= currentAgeGroup %> </button>
<div class="content">

<%
if (ListTeam.size() % 2 != 0)
   {
       ListTeam.add("Bye");
   }

   int numDays = ListTeam.size()+1;
   int halfSize = ListTeam.size() / 2;

   List<String> teams = new ArrayList<String>();

   for(String j: ListTeam)
   {
	   teams.add(j);
   }
   if(teams.size()>0)
   teams.remove(0);

   int teamsSize = teams.size();
     String dt = "2021-12-30";  // Start date
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  Calendar c = Calendar.getInstance();
  c.setTime(sdf.parse(dt));
  c.add(Calendar.DATE, 1);  // number of days to add
  dt = sdf.format(c.getTime());
   int fieldcount=1;
   for (int day = 0; day < numDays && teams.size()>2; day++)
   {
    c.setTime(sdf.parse(dt));
    c.add(Calendar.DATE, 1);  // number of days to add
    dt = sdf.format(c.getTime());
       %>
       <h3 id="dayHeader"> Day <%= dt %> </h3>
       <table id="teams">
       <tr>
           <th>Team </th>
           <th>Team</th>
           <th>Location </th>
        </tr>

    <%
       int teamIdx = day % teamsSize;
        %>
         <tr>
            <td><%= teams.get(teamIdx)%></td>  
            <td><%= ListTeam.get(0)%></td>
        <td>Field :<%= fieldcount %></td>
        <tr>

      <%
      fieldcount+=1;
      if(fieldcount==12)
      {
        fieldcount=1;
      }
       for (int idx = 1; idx < halfSize; idx++)
       {               
           int firstTeam = (day + idx) % teamsSize;
           int secondTeam = (day  + teamsSize - idx) % teamsSize;
           %>
           <tr>
           <td><%= teams.get(firstTeam)%></td>
            <td><%= ListTeam.get(secondTeam)%></td>
           td>Field :<%= fieldcount %></td>
            </tr>
            <%
      fieldcount+=1;
      if(fieldcount==11)
      {
        fieldcount=1;
      }
       }
       %>
       </table>
       <%
   }

%>
</div>
<%
}
%>
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

