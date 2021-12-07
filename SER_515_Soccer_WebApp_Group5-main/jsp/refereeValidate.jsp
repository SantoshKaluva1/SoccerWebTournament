<%@ page import="java.sql.*,javax.servlet.http.Part,java.io.InputStream,java.io.FileOutputStream"%>

<%
String firstName=request.getParameter("username");
String lastName=request.getParameter("lastname");

String email=request.getParameter("email");

String mobile=request.getParameter("mobile");

String experience=request.getParameter("yoe");



try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("insert into referee(firstname,lastname,email,mobile,yoe) values(?,?,?,?,?)");

ps.setString(1,firstName);
ps.setString(2,lastName);
ps.setString(3,email);
ps.setString(4,mobile);
ps.setString(5,experience);


int x=ps.executeUpdate();

if(x>0)
{
     response.sendRedirect("../RefereeRegistrationSuccess.html");
}
else
{
    out.println("Failed");
}

}
catch(Exception e)
{
    out.println(e);
}

%>

