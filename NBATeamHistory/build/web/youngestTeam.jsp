<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
 String team = request.getParameter("searchKey");
   
String database ="jdbc:mysql://localhost:3306/cst4713";
String user = "root";
String password = "";

Class.forName("com.mysql.jdbc.Driver");

Connection mycon = DriverManager.getConnection(database,user,password);

String SQLselect="select * from nbateams order by year desc limit 5";

Statement mystat = mycon.createStatement();

ResultSet results = mystat.executeQuery(SQLselect);

String sqlresult ="";
if(results.next())
{
    results.beforeFirst();
     out.println("<table align='center' border= '1'>");
        out.println("<tr><th colspan='2'>NBA Teams and Founding Year </th></tr>");
        out.println("<tr><th>Team</th><th>Year Founded</th></tr>");
    while(results.next())
    {
     
        String teamname = results.getString("teamname");
        int teamyear = results.getInt("year");
        sqlresult += "<tr><td>"+teamname+"</td><td>"+teamyear+"</td></tr> ";
    }
    out.println(sqlresult);
             out.println("</table>");

}
else
out.println("There is no such thing as an NBA team.");

%>