<%@ page import="java.sql.*"%>
<%


String z1=request.getParameter("teamName").toString();

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");

PreparedStatement ps= conn.prepareStatement("DELETE FROM user WHERE (UserName = ?);");
ps.setString(1,z1);

int x=ps.executeUpdate();
}
catch(Exception e)
{
    out.println(e);
}
%>

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
            </div>
          </div>
        <div class="subnav">
          <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> Welcome, <%= session.getAttribute("username") %> <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
            <a href="AccessLayeredPage.jsp">Privileged Access</a>
            <a href="jsp/logout.jsp">Logout</a>
          </div>
        </div> 
        </div>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<%
String c=session.getAttribute("superuser").toString();
String z=session.getAttribute("username").toString();

String teamGender="";
String teamAgeGroup="";
if(c.equals("false"))
{
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select Gender, AgeGroup from user where UserName=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,z);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
  teamGender=rs.getString("Gender");
  teamAgeGroup=rs.getString("AgeGroup");
}
}
catch(Exception e)
{
    out.println(e);
}

ArrayList<String> ListTeam = new ArrayList<String>();

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName from user where Approved='True' and UserName!='akhil' and Gender=? and AgeGroup=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,teamGender);
ps.setString(2,teamAgeGroup);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
ListTeam.add(rs.getString("UserName"));
}
}
catch(Exception e)
{
    out.println(e);
}


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
    <h2 id="scheduleHeader"> Schedule for the tournament for your team </h2>

    <%
   for (int day = 0; day < numDays; day++)
   {
       int t=day+1;
       %>
       <h3 id="dayHeader"> Day <%= t %> </h3>
       <table id="teams">
       <tr>
           <th>Team </th>
           <th>Team</th>
        </tr>

    <%
       int teamIdx = day % teamsSize;
       if(teams.get(teamIdx).equals(z) || ListTeam.get(0).equals(z))
       {
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
           if(teams.get(firstTeam).equals(z)|| teams.get(secondTeam).equals(z))
           {
           %>
           <tr>
           <td><%= teams.get(firstTeam)%></td>
            <td><%= teams.get(secondTeam)%></td>
            </tr>
            <%
       }
       }
       %>
       </table>
       <%
   }
}
else
{
  List<String> teamsNames = new ArrayList<String>();
  List<String> ageCategory = new ArrayList<String>();
  List<String> genderList = new ArrayList<String>();
  List<String> coachName = new ArrayList<String>();

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select UserName, AgeGroup, Gender, Coach from user where Approved!='True' and UserName!='akhil'";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
teamsNames.add(rs.getString("UserName"));
if(rs.getString("AgeGroup")=="19")
{
ageCategory.add("O48");
}
else
{
ageCategory.add(rs.getString("AgeGroup"));
}
genderList.add(rs.getString("Gender"));
coachName.add(rs.getString("Coach"));
}
}
catch(Exception e)
{
    out.println(e);
}
%>  

<h2 id="willingRegisterHeader"> Teams willing to Register for Tournament </h2>
<table id="teams">

tr>
<th>Team</th>
<th>Age Category</th>
<th>Gender</th>
<th>Coach</th>
<th>Approve</th>
<th>Deny</th>
</tr>

<%

for (int i=0; i<teamsNames.size();i++)
{
  %>
  <tr>
      <td><%= teamsNames.get(i) %></td>
      <td><%= ageCategory.get(i) %></td>
     <td><%= genderList.get(i) %></td>
     <td><%= coachName.get(i) %></td>
      <td> <a class="button" href="approveTeam.jsp?teamName=<%=teamsNames.get(i)%>">Approve</a> </td>
      <td> <a class="button" href="DenyTeam.jsp?teamName=<%=teamsNames.get(i)%>">Deny</a> </td>
  </tr>
<%
}
%>
</table>

<%
List<String> sponserNames = new ArrayList<String>();
List<String> sponserEmail = new ArrayList<String>();
List<String> sponserGoods = new ArrayList<String>();
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select sponser_name, sponser_mail, sponser_goods from sponser where approved IS NULL;";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
sponserNames.add(rs.getString("sponser_name"));
sponserEmail.add(rs.getString("sponser_mail"));
sponserGoods.add(rs.getString("sponser_goods"));
}
}
catch(Exception e)
{
    out.println(e);
}
%>

<h2 id="sponserHeader"> Interested Sponsers for the tournament </h2>
<table id="teams">

<tr>
<th>Sponser</th>
<th>SponserEmail</th>
<th>Goods</th>
<th>Approve</th>
<th>Deny</th>
</tr>

<%

for (int i=0;i<sponserNames.size();i++)
{
  %>
  <tr>
      <td><%= sponserNames.get(i) %></td>
      <td><%= sponserEmail.get(i) %></td>
      <td><%= sponserGoods.get(i) %></td>
      <td><a class="button" href="approveSponser.jsp?sponserEmail=<%=sponserEmail.get(i)%>">Approve</button></td>
      <td><a class="button" href="DenySponser.jsp?sponserEmail=<%=sponserEmail.get(i)%>">Deny</button></td>
  </tr>
<%
}
}
%>
</table>
  </body>
</head>
  </html>


