<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
session.setAttribute("username",username);

try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDB","root","Ramesh@52");
String sql = "select * from user where UserName=? and Password=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, password);
ResultSet rs = ps.executeQuery();
if(rs.next()) {

    String sql1 = "select SuperUser,Approved,refDir from user where UserName=? and Password=?";
    PreparedStatement ps1 = conn.prepareStatement(sql1);
    ps1.setString(1, username);
    ps1.setString(2, password);
    ResultSet rs1 = ps.executeQuery();
    String value=null;
    String appr=null;
    String refD=null;
    if(rs1.next())
    {
    value = rs1.getString("SuperUser");
    appr = rs1.getString("Approved");
    refD= rs1.getString("refDir");
    }
    if(appr.equals("False"))
    {
        response.sendRedirect("../LoginTeamNotApproved.html");
    }
    if(value!=null)
    {
        session.setAttribute("superuser","true");
    }
    else
    {
        session.setAttribute("superuser","false");
    }
    if(refD!=null)
    {
        session.setAttribute("refdir","true");
    }
    else
    {
        session.setAttribute("refdir","false");
    }
    response.sendRedirect("../AccessLayeredPage.jsp");
    //code to redirect to login page
}
else
{
    response.sendRedirect("../FailedLogin.jsp");
}
}
catch(Exception e)
{
    out.println(e);
}

%>