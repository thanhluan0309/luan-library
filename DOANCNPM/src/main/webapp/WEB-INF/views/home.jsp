<%@page import="stackjava.com.DAO.messagedao"%>
<%@page import="stackjava.com.Entity.participants"%>
<%@page import="stackjava.com.Service.participantsImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>.

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="stackjava.com.Service.messageImpl"%>
<%@page import="stackjava.com.Entity.message"%>

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
	height: 500px; /* only for demonstration, should be removed */
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
	height: 500px; /* only for demonstration, should be removed */
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
.cssforUser {
	background-color: #d5e4e4;
    width: 90px;
    height: 73px;
    border-radius: 33px;
    font-size: 1.2rem;
    padding: 15px;
	cursor: pointer;
	transition: width 2s;
}
.cssforUser:hover {
	width: 300px;
}
.cssforTextarea {
	font-size: 1.5rem;
}
.cssfortextchat {
	width: 266px;
    height: 41px;
}
.cssforButtonSend {
	background-color: #2e2ee2;
    padding: 9px;
    color: white;
    font-size: inherit;
    font-weight: 600;
    cursor: pointer;
}
.cssforButtonSend:hover {
	opacity: 0.7;
}
</style>
</head>
<body>
	<script>
	var temp="${thongbao}";
	var websocket = new WebSocket("ws://deploysocket.herokuapp.com");
	if(temp =="chuaco"){
	$( document ).ready(function() {
		console.log( "ready!","${thongbao}" );
		async function postData(url = '', data={}) {
				const response = await fetch(url, {
					method: 'POST', // *GET, POST, PUT, DELETE, etc.
					mode: 'cors', // no-cors, *cors, same-origin
					cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
					credentials: 'same-origin', // include, *same-origin, omit
					headers: {
					'Content-Type': 'application/json'
					},
					redirect: 'follow', 
					referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
					body: JSON.stringify(data) 
				});
				return response.json(); // parses JSON response into native JavaScript objects
		}
		const data ={
			message:"--Start to chat--",
			room:"${chat.getRoomId()}",
			user: localStorage.getItem("Userid")
		}
		postData('https://deploywebsocket.herokuapp.com/webchat/message', data)
						.then((data) => {
							console.log(data); // JSON data parsed by `data.json()` call
						});
						const data2 ={
				room:"${chat.getRoomId()}",
			}			
	})
	}else{
	
		var websocket = new WebSocket("ws://deploysocket.herokuapp.com");
		websocket.onopen = function(message){
            processOpen(message);
        }
		function processOpen(message){
			const data ={
				room:"${chat.getRoomId()}",
			}
            content.value = "";
      	    var	 mes;
			  async function getData(url = '', data) {
					const response = await fetch(url, {
						method: 'POST', // *GET, POST, PUT, DELETE, etc.
						mode: 'cors', // no-cors, *cors, same-origin
						cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
						credentials: 'same-origin', // include, *same-origin, omit
						headers: {
						'Content-Type': 'application/json'
						},
						redirect: 'follow', 
						referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
						body: JSON.stringify(data) 
					});
					return response.json(); // parses JSON response into native JavaScript objects
					}
					getData('https://deploywebsocket.herokuapp.com/webchat/message/getMess', data)
					.then((data) => {
							console.log("getMess",data.GetMessage.message);
							var mes=data.GetMessage.message
							if(typeof websocket != "undefined" && websocket.readyState == websocket.OPEN){
								websocket.send(mes);
							}
						}); 			
        }
	}
</script>
	
	<header>
		<h1 id="title">

		</h1>
	</header>
	<script>
		document.getElementById("title").innerHTML = localStorage.getItem("username");
	</script>
	<section>
		<nav>
			<c:forEach var="user" items="${listuser}">
				<form:form method="POST" action="home">
					<input type="hidden" name="UserIdPart" value="${user.getId()}" />
					<input id="UserIdx" type="hidden" name="UserIdx" />
					<input type="hidden" name="usernameLogin" />
					<button type="submit" class="btn btn-primary cssforUser"
					 	onclick="getidUser(event)" data-bs-toggle="modal" id="showmess"
						name="usernamePart" value="${user.getUsername()}"
						data-bs-target="#exampleModal">${user.getUsername()}</button>
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
		<script>
			function getidUser(event) {
				localStorage.setItem("NamePart",event.target.value) 
			}
		</script>
		<article>
			<div style="display: block" id="myDIV">
				<h2 id="NameRoom"></h2>
				<textarea rows="10" cols="50" class="cssforTextarea" value="" id="content"></textarea>
				<br /> <br />
				<input type="text" class="cssfortextchat" id="inputText" /> 
				<input type="button"
				
					value="send data" class="cssforButtonSend" onclick="sendDATA()" /> <br />
			</div>
		</article>
		
		<script>
			var textarea = document.getElementById('content');
				textarea.scrollTop = textarea.scrollHeight;

			if(localStorage.getItem("NamePart") == null){
				document.getElementById("NameRoom").innerHTML = "Well come back"
			}else{
				document.getElementById("NameRoom").innerHTML ="you are chat with : " + localStorage.getItem("NamePart");
			}
			
		</script>
	</section>
	<footer>
		<form:form method="GET" action="dologout">
					<button onclick="Dologout()">Log out</button>
		</form:form>
	</footer>
	<script>
		function Dologout() {
			localStorage.clear();
		}

	</script>
	
	<script>
        var username = localStorage.getItem("username")
        var websocket = new WebSocket("ws://deploysocket.herokuapp.com");

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
			content.value = "";
      	  var	 mes = ""
            if(typeof websocket != "undefined" && websocket.readyState == websocket.OPEN){
            	;   	
                websocket.send(mes)
            }
						
        }
        function processMessage(message){
             content.value += message.data+"\n";
			const data ={
				message:content.value,
				room:"${chat.getRoomId()}",
			}
			async function updateMess(url = '', data) {
					const response = await fetch(url, {
						method: 'PUT', // *GET, POST, PUT, DELETE, etc.
						mode: 'cors', // no-cors, *cors, same-origin
						cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
						credentials: 'same-origin', // include, *same-origin, omit
						headers: {
						'Content-Type': 'application/json'
						},
						redirect: 'follow', 
						referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
						body: JSON.stringify(data) 
					});
					return response.json(); // parses JSON response into native JavaScript objects
					}
					updateMess('https://deploywebsocket.herokuapp.com/webchat/message/', data)
					.then((data) => {
							console.log("Mess update",data);
						}); 
        }
        function onerror(message){
            content.value += "Loi xay ra voi" + message
        }   
        function processClose(message){
            content.value += localStorage.getItem("username") +"Da roi phong"

        }
        function sendDATA(){
			var text = document.getElementById('content');
            text.scrollTop = text.scrollHeight;
			const d = new Date().toLocaleString().replace(",","").replace(/:.. /," ");
            var mes =d+" "+ localStorage.getItem("username")+":"+inputText.value;
            if(typeof websocket != "undefined" && websocket.readyState == websocket.OPEN){
				websocket.send(mes)
                inputText.value="";
            }
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