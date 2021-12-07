<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String password1=request.getParameter("password1");
String coach=request.getParameter("coach");
String approved="False";
String genderGroup=request.getParameter("genderGroup");
String ageGroup=request.getParameter("ageGroup");

session.setAttribute("username",username);

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("insert into user(UserName,Password,Coach,Approved,Gender,AgeGroup) values(?,?,?,?,?,?);");
ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,coach);
ps.setString(4,approved);
ps.setString(5,genderGroup);
ps.setString(6,ageGroup);


int x=ps.executeUpdate();

if(x>0)
{
     response.sendRedirect("../PaymentForTeam.jsp");
}
else
{
    out.println("../RegisterFailed.jsp");
}

}
catch(Exception e)
{
    out.println(e);
}

%>
