<%@ page import="java.sql.*"%>
<%
String sponserName=request.getParameter("sname");
String sponserMail=request.getParameter("smail");
String sponserGoods=request.getParameter("stype");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
PreparedStatement ps= conn.prepareStatement("insert into sponser(sponser_name,sponser_mail,sponser_goods) values(?,?,?);");
ps.setString(1,sponserName);
ps.setString(2,sponserMail);
ps.setString(3,sponserGoods);

int x=ps.executeUpdate();

if(x>0)
{
     response.sendRedirect("../BidSucess.jsp");
}
else
{
    out.println("../bidsFailed.jsp");
}

}
catch(Exception e)
{
    out.println(e);
}

%>
