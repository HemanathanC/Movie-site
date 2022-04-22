<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="home.js"></script>
<style>
body{background-color:gray;
	 font-family:Times New Roman;
	 color:white;}
img{height:200px;
	 width:200px;}
a{text-decoration:none;
  color:white;}
td{padding:100px 100px;}
</style>
</head>
<%@page import="sql.Sql,java.sql.*" %>
<body>
<%try{
	String year="2021";//request.getParameter("year");
	
	Connection con=Sql.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from movie where year=\'"+year+"\'");%>
<table>
<div class='container'>
	<%while(rs.next()){%>
     <tr><td><a href="javascript:;search('<%=rs.getString("name")%>')"><img src="Image?id=<%=rs.getString("id")%>"><br>
<%=rs.getString("name")+"\t"+rs.getString("year")+"\t"+rs.getString("quality") %></a>
</td>
      <%if(rs.next()){ %>
      <td><a href="javascript:;search('<%=rs.getString("name")%>')"><img src="Image?id=<%=rs.getString("id")%>"><br>
<%=rs.getString("name")+"\t"+rs.getString("year")+"\t"+rs.getString("quality") %>	</a>
<%} %>
</td>
      <%if(rs.next()){%>
      <td><a href="javascript:;search('<%=rs.getString("name")%>')"><img src="Image?id=<%=rs.getString("id")%>"><br>
<%=rs.getString("name")+"\t"+rs.getString("year")+"\t"+rs.getString("quality") %>	</a>
</td></tr>
<%} %>
	<%}%>
</div>
</table>
<%}
catch(Exception e){e.printStackTrace();}%>
</body>
</html>