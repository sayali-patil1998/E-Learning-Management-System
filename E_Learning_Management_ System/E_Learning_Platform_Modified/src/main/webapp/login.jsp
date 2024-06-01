<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	height: 100%;
	font-family: Arial, sans-serif;
	margin: 0;
}

.bg-img {
	background-image:
		url("https://img.freepik.com/free-vector/geometric-science-education-background-vector-gradient-blue-digital-remix_53876-125993.jpg");
	min-height: 100vh;
	background-size: cover;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.container {
	position: relative;
	max-width: 300px;
	padding: 16px;
	background: rgba(255, 255, 255, 0.8);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: red;
	-webkit-text-stroke: 1px black;
	margin-bottom: 20px;
}

b {
	color: green;
	font-size: 18px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	border: 1px solid green;
	box-sizing: border-box;
}

.button {
	background-color: green;
	color: white;
	padding: 14px;
	border: none;
	cursor: pointer;
	width: 100%;
}

.button:hover {
	background-color: darkgreen;
}
</style>
</head>

<body>
	<jsp:useBean id="user" class="beans.UserBean" scope="session" />
	<jsp:useBean id="topic_list" class="beans.TopicTutorialBean"
		scope="session" />
<%
if(session.getAttribute("user") == null ){
	
}
else{
%>	
	<h4 align="center" style="color: red;">${sessionScope.user.message}</h4>
<%
}
%>

	<div class="bg-img">
		<h1>E-Learning Platform</h1>

		<form class="container" action="LoginServlet" method="post">
			<b>Email</b> <input type="text" placeholder="Enter Email"
				name="email" required> <b>Password</b> <input
				type="password" placeholder="Enter Password" name="password"
				required>

			<button type="submit" class="button">Login</button>
		</form>
	</div>
</body>

</html>
