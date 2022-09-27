<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>.

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="Style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Home page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 30%;
	height: 300px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 70%;
	background-color: #f1f1f1;
	height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}
</style>
</head>
<body>
	
	
	<header>
		<h2>Cities</h2>
	</header>
	<section>
		<nav>
			<c:forEach var="user" items="${listuser}">
				<form:form method="POST" action="home">
					<input type="hidden" name="UserIdPart" value="${user.getId()}" />
					<input id="UserIdx"  type="hidden" name="UserIdx"  />
					<input type="hidden" name="usernameLogin"  />
						<button type="submit" class="btn btn-primary"
						onclick="getidUser(event)" data-bs-toggle="modal"
						id="showmess" name="usernamePart" value="${user.getUsername()}" data-bs-target="#exampleModal">${user.getUsername()}</button>
					<br />	
				</form:form>
			</c:forEach>
		</nav>
		<script>
			document.getElementsByName('UserIdx').forEach(function(ele, idx) {
				ele.value = localStorage.getItem("Userid");
			})
			document.getElementsByName('usernameLogin').forEach(function(ele, idx) {
				ele.value = localStorage.getItem("username");
			})
		</script>
		<article>
			<div >
				<h1>Test Websocket</h1>
				<input type="text" id="inputText" /> <input type="button"
					value="send data" onclick="sendDATA()" /> <br />
				<textarea rows="10" cols="50" value="asdasdasdasd" id="content"></textarea>
				<br /> <br />
			</div>
		</article>
		
	</section>
	<footer>
		<p>Footer</p>
	</footer>
	<script>
	    function getidUser(event) {
	      console.log("id",event.target.value); 
	    }
	</script>
	<script>
        var username = localStorage.getItem("username")
        var websocket = new WebSocket("ws://localhost:8181");

        websocket.onmessage=function(message){
            processMessage(message);
        }
        websocket.onopen = function(message){
            processOpen(message);
        }
        websocket.onclose = function(message){
            processClose(message);
        }
        websocket.onerror = function(message){
            processError(message);
        }
        //
        function processOpen(message){
            content.value += "Server is connect\n";
            var mes = "${chat.getChat()}";
            if(typeof websocket != "undefined" && websocket.readyState == websocket.OPEN){
                websocket.send(mes)
            }
        }
        function processMessage(message){
            content.value += message.data+"\n";
        }
        function onerror(message){
            content.value += "Loi xay ra voi" + message
        }   
        function processClose(message){
            content.value += username +"Da roi phong"

        }
        function sendDATA(){
        	const d = new Date().toLocaleString().replace(",","").replace(/:.. /," ");
            $("#mySpan").show();
            var mes =d+" "+ username+":"+inputText.value;
            if(typeof websocket != "undefined" && websocket.readyState == websocket.OPEN){
                websocket.send(mes)
                inputText.value="";
            }
            
        }
 	</script>
	<script>
	 function getData(){
         return fetch("http://localhost:8182/webchat/room").then(function (response) {
            if (!response.ok) {
                throw Error(response.statusText);
            }
            else {
                return response.json();
            }
        }).then(function (data) {
             content2.value = data.room[0]._id +"____"+ data.room[0].name;
             userID.value = data.room[0]._id;
             password.value = data.room[0].name;
        }).catch(function (error) {
            return error;
        })
        }
	
	
     </script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>