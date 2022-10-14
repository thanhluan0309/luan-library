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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Home page</title>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/home.css"/>">
</head>
<style>
	nav {
	     float: left;
    width: 30%;
    height: 500px;
    background: #5e797b;
    padding: 20px;
    opacity: 0.8;
    border: solid #a0aca8;
}
.cssuploadimg {
  width: 300px;
  height: 200px;
  border: 1px solid #ccc;
}
.dropdown {
      position: relative;
    display: inline-block;
    margin-top: 67px;
    margin-left: 23px;
    font-size: 2.5rem;
    font-weight: 600;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
  width: 204px;
}

.dropdown:hover .dropdown-content {
  display: block;
}
	.title_photo {
			border-radius: 50%;
			height: 200px;
			width: 200px;
		}
		.user_photo {
			border-radius: 50%;
			height: 50px;
			width: 50px;
		}
		.customImage {
			display: flex;
			align-items: center;
			width: 41%;
		}
		.image_username {
			padding-left: 15px;
		}

		.footer_edit {
			display: flex;
		}
		.custom_edit {
			display: flex;
			justify-content: center;
		}
		#command {
			margin: 0;
		}
		.header_title {
			background-color :RGBA( 112, 128, 144, 1 ) ;
			display: flex;
			justify-content: center;
		}

		#NameRoom {
			text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
		}
		.btn1 {
		font-size: 20px;
	    background-color: Crimson;
	    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
	    }
</style>
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
		<!-- <h1 id="title"></h1> -->
		<div class="patterns">
			<svg width="100%" height="100%">
    <defs>
      <pattern id="polka-dots" x="0" y="0" width="100" height="100"
					patternUnits="userSpaceOnUse">
        <circle fill="#be9ddf" cx="25" cy="25" r="3"></circle>
      </pattern>  
        <style>
@import
	url("https://fonts.googleapis.com/css?  family=Lora:400,400i,700,700i")
	;
</style>
    </defs>      
    <rect x="0" y="0" width="100%" height="100%" fill="url(#polka-dots)"> </rect>
 <text id="title" x="50%" y="60%" text-anchor="middle">
 </text>
 </svg>
		</div>
	</header>
	<script>
		document.getElementById("title").innerHTML = localStorage.getItem("username");
	</script>
	<section>
		<nav>
				<hr />
				<c:forEach var="user" items="${listuser}">
					<form:form method="POST" action="home">
						<input type="hidden" name="UserIdPart" value="${user.getId()}" />
						<input id="UserIdx" type="hidden" name="UserIdx" />
						<input type="hidden" name="usernameLogin" />

						<button
							type="submit"
							class="btn btn-primary cssforUser customImage"
							onclick="getidUser(event)"
							data-bs-toggle="modal"
							id="showmess"
							name="usernamePart"
							value="${user.getUsername()}"
							data-bs-target="#exampleModal"
						>
							<img
								onclick="getidUser(event)"
								data-bs-toggle="modal"
								id="showmess"
								class="user_photo"
								name="usernamePart"
								alt="anhdep"
								src="${user.getImage()}"
							/>
							<span class="image_username">${user.getUsername()}</span>
						</button>
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
		<article style="display: flex;">
			<div style="display: block; margin-left: 20px" id="myDIV">
				<h2 id="NameRoom"></h2>

				<textarea disabled="disabled" rows="10" cols="50"
					class="cssforTextarea" value="" id="content"></textarea>
				<br /> 
				<br /> <input type="text" class="cssfortextchat"
					id="inputText" onclick="onclickFocus()" /> 
					<input type="button"
					value="send data" class="cssforButtonSend" onclick="sendDATA()" />
				<br />
			</div>
			<div class="dropdown">
				<span>Emoji &#128513;</span>
				<div class="dropdown-content">
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128512;">&#128512;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128516;">&#128516;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128525;">&#128525;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128151;">&#128151;</button>
				
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128514;">&#128514;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128515;">&#128515;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128516;">&#128516;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128517;">&#128517;</button>
				<button style="font-size: 1.5rem" onclick="getemoji(event)" value="&#128508;">&#128508;</button>
				</div>
			  </div>
		</article>
		<script>
			function getemoji(event) {
				console.log("getEmoji",event.target.value);
				inputText.value += event.target.value;
			}

		</script>
		<script>
			if(localStorage.getItem("NamePart") == null){
				document.getElementById("NameRoom").innerHTML = "Well come back"
			}else{
				document.getElementById("NameRoom").innerHTML ="You are chat with : " + localStorage.getItem("NamePart");
			}
			
		</script>
	</section>
	<footer>
			<div class="custom_edit">
				<div class="footer_edit">
					<form:form method="GET" action="dologout">
						<button class="btn1" onclick="Dologout()">Log out</button>
					</form:form>

					<form:form
						method="GET"
						action="editUsers"
					>
						<input
						    value="${id.id}"
							name="getiduser"
							id="getidUser"
							style="display: none"
						/>
						<button type="submit" class="btn1">Edit user</button>
					</form:form>
				</div>
			</div>
		</footer>
	<script>
		document.getElementById("getidUser").value = localStorage.getItem("Userid");
	</script>
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
        
        function onclickFocus() {
        	var text = document.getElementById('content');
            text.scrollTop = text.scrollHeight
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