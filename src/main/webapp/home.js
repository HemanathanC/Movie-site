function logout(){
	    if(confirm("Are you sure you want to Logout?")){		
			location.href="Login.jsp";
		}
}
function home(){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			document.getElementById("dis").innerHTML=xhttp.responseText;
		}
	}
	xhttp.open("GET","home.jsp",true);
	xhttp.send();
}
function search(value){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			document.getElementById("dis").innerHTML=xhttp.responseText;
		}
	}
	xhttp.open("GET","Mdisplay.jsp?name="+value,true);
	xhttp.send();
}
function movie_g(value){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			document.getElementById("dis").innerHTML=xhttp.responseText;
		}
	}
	xhttp.open("GET","Mdisplay_genre.jsp?genre="+value,true);
	xhttp.send();
}
function movie_y(value){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(xhttp.readyState==4 && xhttp.status==200){
			document.getElementById("dis").innerHTML=xhttp.responseText;
		}
	}
	xhttp.open("GET","Mdisplay_year.jsp?year="+value,true);
	xhttp.send();
}