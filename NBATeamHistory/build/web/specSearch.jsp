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

String SQLselect="select * from nbateams where teamname like '" + 
                    team + "'";

Statement mystat = mycon.createStatement();

ResultSet results = mystat.executeQuery(SQLselect);

String sqlresult ="";
if(results.next())
{
    results.beforeFirst();
    while(results.next())
    {
        
        String teamname = results.getString("teamname");
        int teamyear = results.getInt("year");
        sqlresult += teamname + ": " + teamyear;
    }
    out.println(sqlresult);
}
else
out.println("There is no team by that name.");



%>