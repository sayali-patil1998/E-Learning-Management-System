<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, pojos.Topic"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel - e-Learning Platform</title>
<%@ include file="links.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
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

h1 {
	text-align: center;
	color: red;
}

form {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

fieldset {
	border: none;
	padding: 0;
	margin: 0;
}

legend {
	font-weight: bold;
	color: #555;
}

label {
	display: block;
	margin-bottom: 10px;
}

select, input[type="text"], input[type="date"] {
	width: calc(100% - 12px);
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="bg-img">
		<h1>Admin Panel</h1>
		<a style="color: red; position: absolute; top: 20px; left: 92%" class="btn btn-primary" href="logout.jsp" role="button">Logout</a>
		<form action="AddTutorialServlet" method="post">
			<fieldset>
				<legend>Add New Tutorial</legend>
				<%@ include file="alert.jsp"%>
				<label for="title">Choose Subject:</label> <select id="title"
					name="subjects">
					<%-- Dynamically populate topics here --%>
					<%
					List<Topic> topics = (List<Topic>) request.getServletContext().getAttribute("topics");
					if (topics != null) {
						for (Topic topic : topics) {
							//String selected = (request.getAttribute("title") != null && request.getAttribute("title").equals(topic.getTopicName())) ? "selected" : "";
							out.println("<option value='" + topic.getTopicName() + "'>" + topic.getTopicName() + "</option>");

						}
					}
					%>
				</select> <label for="tutName">Tutorial Name:</label> <input type="text"
					id="topic" name="tutName" required> <label for="tutAuthor">Author
					Name:</label> <input type="text" id="author" name="tutAuthor" required>
				<label for="pubDate">Date of Publication:</label> <input type="date"
					id="date" name="pubDate" required> <label for="contents">Contents:</label>
				<textarea rows="5" cols="45" name="contents" required></textarea>
				<input type="submit" value="Add Topic"> 

			</fieldset>
		</form>
	</div>
</body>
</html>
