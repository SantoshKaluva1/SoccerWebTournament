<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("name");
String password=request.getParameter("mail");



try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("insert into user(UserName,Password) values(?,?);");
ps.setString(1,username);
ps.setString(2,password);

int x=ps.executeUpdate();

if(x>0)
{
     response.sendRedirect("../SubscribedSuccessfully.html");
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
