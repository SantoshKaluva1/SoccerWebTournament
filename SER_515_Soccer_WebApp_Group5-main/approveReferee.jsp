<%@ page import="java.sql.*"%>
<%


String z1=request.getParameter("sponserEmail").toString();

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("UPDATE referee SET Approved = 'True' WHERE (email = ?);");
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
String rd=session.getAttribute("refdir").toString();

if(rd.equals("true"))
{
List<String> refereeNames = new ArrayList<String>();
List<String> refereeEmail = new ArrayList<String>();
List<String> refereeYOE = new ArrayList<String>();
List<String> refereeMobile = new ArrayList<String>();

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select firstname, email,yoe,mobile from referee where approved IS NULL;";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()) {
refereeNames.add(rs.getString("firstname"));
refereeEmail.add(rs.getString("email"));
refereeYOE.add(rs.getString("yoe"));
refereeMobile.add(rs.getString("mobile"));

}
}
catch(Exception e)
{
    out.println(e);
}
%>

<h2 id="sponserHeader"> Interested Referee for the tournament </h2>
<table id="teams">

<tr>
<th>Referee</th>
<th>Email</th>
<th>YOE</th>
<th>mobile</th>
<th>Approve</th>
<th>Deny</th>
</tr>

<%

for (int i=0;i<refereeNames.size();i++)
{
  %>
  <tr>
      <td><%= refereeNames.get(i) %></td>
      <td><%= refereeEmail.get(i) %></td>
      <td><%= refereeYOE.get(i) %></td>
      <td><%= refereeMobile.get(i) %></td>
      <td><a class="button" href="approveReferee.jsp?sponserEmail=<%=refereeEmail.get(i)%>">Approve</button></td>
      <td><a class="button" href="denyreferee.jsp?sponserEmail=<%=refereeEmail.get(i)%>">Deny</button></td>
  </tr>
<%
}
}
%>
</table>
  </body>
</head>
  </html>


