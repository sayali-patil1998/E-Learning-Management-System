<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, pojos.Tutorial"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tutorials</title>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: gray;
}

.header {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 20px 0;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	background-color: transparent;
}

.logo h1 {
	margin: 0;
}

.nav-links {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.nav-links li {
	margin-right: 20px;
}

.nav-links li:last-child {
	margin-right: 0;
}

.nav-links a {
	text-decoration: none;
	color: #fff;
	transition: color 0.3s;
}

.nav-links a:hover {
	color: #ccc;
}

.login-options a {
	text-decoration: none;
	color: #fff;
	padding: 8px 12px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.login-options a:hover {
	background-color: #555;
}

.course-section {
	padding: 40px 0;
}

.section-title {
	text-align: center;
	font-size: 28px;
	margin-bottom: 40px;
}

.carousel-img {
	max-height: 600px; /* Adjust the maximum height as needed */
	object-fit: cover;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
}

.card {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	max-width: 300px;
	padding: 20px;
}

.card h3 {
	font-size: 20px;
	color: #333;
	margin-bottom: 10px;
}

.card p {
	color: #666;
	margin-bottom: 15px;
}

.card a {
	color: #007bff;
	text-decoration: none;
}

.card a:hover {
	text-decoration: underline;
}

table {
	background-color: lightgrey;
	margin: auto;
}

.footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 20px 0;
}

.about-section {
	background-color: #f9f9f9;
	padding: 40px 0;
}

.about-content {
	max-width: 800px;
	margin: 0 auto;
	text-align: center;
}

.about-content h2 {
	font-size: 32px;
	color: #333;
	margin-bottom: 20px;
}

.about-content p {
	font-size: 18px;
	line-height: 1.6;
	color: #666;
	margin-bottom: 20px;
}

.brand-name {
	font-weight: bold;
	color: #007bff;
}
</style>
</head>
<body>
	<h1 align="center">Tutorials</h1>
	<div
		style="display: flex; flex-wrap: wrap; justify-content: space-around;">
		<%
		List<Tutorial> tutorials = (List<Tutorial>) request.getSession().getAttribute("tutorials");
		if (tutorials != null && !tutorials.isEmpty()) {
			for (Tutorial tutorial : tutorials) {
				out.println(
				"<div style='margin: 10px; padding: 20px; border: 1px solid #ccc; border-radius: 5px; width: 300px; background-color: white;'>");
				out.println("<strong>" + tutorial.getTutorialName() + "</strong><br>");
				out.println("<p>" + tutorial.getContents() + "</p>");
				out.println("</div>");
			}
		} else {
			out.println("<p>No tutorials found for this topic.</p>");
		}
		%>
	</div>
	</div>
</body>
</html>
