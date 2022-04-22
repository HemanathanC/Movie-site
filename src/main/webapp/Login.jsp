<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
fieldset{
	background-color:lemonchiffon;
	border:2px groove;
	width:350px;
	}
legend{align:center;}
</style>
<script>
function myfun()
{
   var x=document.getElementById("pass");
   if(x.type==="password"){
	   x.type="text";
   }
   else{
	   x.type="password"
   }
}
function msg(){
	<%if(request.getAttribute("msg")!=null){%>
	var msg=<%=request.getAttribute("msg")%>;
	alert(msg);<%}%>
}
</script>
</head>
<body onload="msg()">
		<center>
			<fieldset>
			<legend>Login</legend><br>
				<form action="Validate" method="post">
					<center>Enter username and password to view details</center><br/><br/>
					Username&nbsp;:&nbsp;<input type="text" name="username" required><br/><br/>
					Password&nbsp;:&nbsp;<input type="password" name="pwd" id="pass" max="10"><br/><br/>
					<input type="checkbox" onclick="myfun()">Show Password<br/><br/>
					<input type="submit" value="Login">
				</form>
			<p>If you are not register , click here to <a href="Register.html">Register</a></p>
			</fieldset>
		</center>
	</body>
</html>