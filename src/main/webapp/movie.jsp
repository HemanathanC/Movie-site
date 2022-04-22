<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="home.js"></script>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
body{background-color:gray;
	 font-family:Times New Roman;
	 color:white;}
.container-fluid{font-size:50px;
				 height:70px;
				 text-align:center;}
a{font-size:17px;
  color:white;
  width:100%;}
a:hover,a:focus{color:black;
				background-color:white;
				transition:0.6s}
.dropdown-menu > a:hover{color:white;
						background-color:black;
						transition:0.6s}
#head{font-size:28px;}
.btn{color:white;font-size:20px;font-weight:bold;}
.btn-dark:hover,.btn-dark:focus{color:black;background-color:white;}
</style>
<script>
function upload(){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			document.getElementById("dis").innerHTML=xhttp.responseText;
		}
	}
	xhttp.open("GET","Upload.html",true);
	xhttp.send();
}
</script>
</head>
<%@page import="java.io.*,java.sql.*,sql.Sql" %>
<body>
<%try{
	Connection con=Sql.getcon();
	String sql="select * from user";
	if(request.getAttribute("name").equals("admin")){
		sql="select * from admin";
	}
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	rs.next();
%>
<div class='container'><br>
<div class="container-fluid bg-dark font-weight-bold">STUPIDMOVIES</div><br>
<nav class='navbar navbar-expand bg-dark py-0'><h4><b style="font-size:45px">W</b>elcome <%=rs.getString("name")%></h4><button class='btn btn-dark ml-auto' onclick="logout()">Logout</button></nav><br>
<nav class="navbar navbar-expand-lg  bg-dark">
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="javascript:;home()">Home</a>
      </li>
     <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Series
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="javascript:;">Marvel Series</a>
        <a class="dropdown-item" href="javascript:;">DC Series</a>
        <a class="dropdown-item" href="javascript:;">All Series</a>
      </div>
      </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Movies
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="javascript:;movie_g('action')">Action</a>
        <a class="dropdown-item" href="javascript:;movie_g('fantasy')">Fantasy</a>
        <a class="dropdown-item" href="javascript:;movie_g('horror')">Horror</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Year
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="javascript:;movie_y(2019)">2019</a>
        <a class="dropdown-item" href="javascript:;movie_y(2020)">2020</a>
        <a class="dropdown-item" href="javascript:;movie_y(2021)">2021</a>
        <a class="dropdown-item" href="javascript:;movie_y(2022)">2022</a>
      </div>
    </li>
    <%if(request.getAttribute("name").equals("admin")){ %>
    <li class="nav-item">
       <a class="nav-link" href="javascript:;upload()">Upload Movie</a>
    </li><%} %>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="Mdisplay.jsp">
      <input class="form-control mr-sm-2" type="text" name="name" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick="">Search</button>
    </form>
  </div>
</nav>
</div><br>
<div id="dis"></div>
<br>
<%}catch(Exception e){e.printStackTrace();}%>
</body>
</html>
