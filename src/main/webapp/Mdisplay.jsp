<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="java.sql.*,java.sql.*,sql.Sql" %>
<style>
table,tr,td{border:none;
		 text-align:left;
		 height:40px;
		 width:50%;}
table{margin-left:auto;
	  margin-right:auto;}
img{height:300px;
	 width:300px;}
#download{text-decoration:none;
  padding:5px 5px;
  background-color:white;
  color:green;
  border:1px solid green;
  border-radius:3px;}
#download:hover,#download:focus{color:white;background-color:green;}
</style>
<script src="home.js"></script>
</head>
<body>
<%try{
	String name=request.getParameter("name");
	
	String sql="select * from movie where name=\'"+name+"\'";
	
	Connection con=Sql.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);%>
<table>	
<%if(rs.next()){%>
<tr><td colspan='2'><img src="Image?id=<%=rs.getString("id")%>"></td></tr>
<tr><td><b>Movie Name</b></td><td>: <%=rs.getString("name") %></td></tr>
<tr><td><b>Genre</b></td><td>: <%=rs.getString("genre") %></td></tr>
<tr><td><b>Year</b></td><td>: <%=rs.getString("year") %></td></tr>
<tr><td><b>Quality</b></td><td>: <%=rs.getString("quality") %></td></tr>
<tr><td><b>Rating</b></td><td>: <%=rs.getString("rating") %></td></tr>
<tr><td><b>Download Link</b></td><td>:<a id="download" href="<%=rs.getString("link") %>" download>click here to download</a></td></tr>
<%} %>
</table>
<%}
catch(Exception e){e.printStackTrace();}%>
</body>
</html>