<html>
 <head>

  
  <title>Image Gallery</title>
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
      <button class="active subnavbtn"><i class="fa fa-tasks" aria-hidden="true"></i> More <i class="fa fa-caret-down"></i></button>
      <div class="subnav-content">
      <a href="https://www.soccer.com/srch?query=liverpool" target="_blank">Fan Store</a>
      <a href="Gallery.jsp">Matches Gallery</a>
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

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

  <%
  
List<String> sponserNames = new ArrayList<String>();
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select sponser_name from sponser where approved='True';";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
sponserNames.add(rs.getString("sponser_name"));
}
}
catch(Exception e)
{
    out.println(e);
}
finally
{}
%>

<h2 style="width:400px !important; margin-left:38% !important;" id="sponserHeader"> Proud Sponsers of the tournament </h2>
<table id="teams">

<tr>
<th>Sponser</th>
</tr>

<%
int count=0;
for (int i=0;i<sponserNames.size();i++)
{
    count+=1;
  %>
  <tr>
      <td><%= sponserNames.get(i) %></td>
  </tr>
<%
}
if(count==0)
{
    %>
    <tr>
      <td> Good things take time, we are still waiting for sponser </td>
  </tr>
  <%
}
%>


</table>
      
 

 
 </body>
</html>









