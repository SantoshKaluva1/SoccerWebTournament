<%@ page import="java.sql.*,javax.servlet.http.Part,java.io.InputStream,java.io.FileOutputStream"%>

<%
String name=request.getParameter("name");
String organisation=request.getParameter("organisation");

String email=request.getParameter("email");

String loginID=request.getParameter("loginID");




try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("insert into contact(name,organisation,email,loginID) values(?,?,?,?)");

ps.setString(1,name);
ps.setString(2,organisation);
ps.setString(3,email);
ps.setString(4,loginID);


int x=ps.executeUpdate();

if(x>0)
{
     response.sendRedirect("../ContactResponse.html");
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

