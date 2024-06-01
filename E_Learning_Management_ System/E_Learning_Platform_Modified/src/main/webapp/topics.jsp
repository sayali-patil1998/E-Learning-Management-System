<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, pojos.Topic"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Learning Platform</title>
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


	<header class="header">
		<nav class="navbar">
			<div class="logo">
				<h1>E-Learning Platform</h1>
			</div>
			<ul class="nav-links">
				<li><a href="#home">Home</a></li>
				<li><a href="#courses">Courses</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
			<div class="login-options">
				<a href="logout.jsp" class="logout">Logout</a>
			</div>
		</nav>
	</header>
	<h5 align="center" style="color: green;">${sessionScope.user.message}</h5>

	<h5 align="center">Hello, ${sessionScope.user.validatedUserDetails.name}</h5>

	<section class="carousel-section">
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://dnycf48t040dh.cloudfront.net/fit-in/840x473/Coding-for-Beginners---How-to-Get-Started-With-Coding.png"
						class="d-block w-100 carousel-img" alt="Image 1">
				</div>
				<div class="carousel-item">
					<img
						src="https://b2wgroup.com/wp-content/uploads/2019/07/Understanding-the-basics-of-coding-1024x536.png"
						class="d-block w-100 carousel-img" alt="Image 2">
				</div>
				<div class="carousel-item">
					<img
						src="https://www.shutterstock.com/shutterstock/photos/1395298487/display_1500/stock-photo-focused-woman-wearing-headphones-using-laptop-in-cafe-writing-notes-attractive-female-student-1395298487.jpg"
						class="d-block w-100 carousel-img" alt="Image 3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>


	<section class="course-section" id="courses">
		<h2 class="section-title">Our Courses</h2>
		<div class="card-slider">
			<div class="card-container">
				<div class="card">
					<div class="card-body">
						<h3>Core Java</h3>
						<p>Master the fundamentals of Java programming, including
							object-oriented concepts, inheritance, and exception handling.</p>
						<a href="https://www.javatpoint.com/what-is-core-java">See
							Full Course</a>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<h3>Advanced Java</h3>
						<p>Dive deeper into Java development with Servlets, JSP, JDBC,
							and frameworks like Spring and Hibernate.</p>
						<a href="https://www.geeksforgeeks.org/what-is-advanced-java/">See
							Full Course</a>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<h3>Hibernate</h3>
						<p>Explore Hibernate, a powerful ORM framework for Java, and
							learn to simplify database interactions.</p>
						<a href="https://www.javatpoint.com/hibernate-tutorial">See
							Full Course</a>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<h3>Spring</h3>
						<p>Discover the Spring framework and its features for building
							robust and scalable Java applications.</p>
						<a href="https://www.tutorialspoint.com/spring/index.htm">See
							Full Course</a>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<h3>Spring Boot</h3>
						<p>Learn Spring Boot to accelerate your application
							development with streamlined configuration and embedded servers.</p>
						<a
							href="https://www.tutorialspoint.com/spring_boot/spring_boot_introduction.htm">See
							Full Course</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section>
		<h1>Topics</h1>
		<%
		List<Topic> topics = (List<Topic>) request.getServletContext().getAttribute("topics");
		if (topics != null && !topics.isEmpty()) {
			for (Topic topic : topics) {
			out.println("<div class='card'>");
			out.println("<div class='card-body'>");
				out.println("<h3><a href='FetchTutorialsServlet?topicId=" + topic.getId() + "'>" + topic.getTopicName()
				+ "</a></h3>");
			out.println("</div>");
			out.println("</div>");
			}
		} else {
			out.println("<p>No topics found.</p>");
		}
		%>
	</section>

	<section class="about-section" id="about">
		<div class="about-content">
			<h2>About Us</h2>
			<p>
				Welcome to <span class="brand-name">E-Learning Platform</span>, your
				one-stop destination for quality online education. We are committed
				to providing a dynamic learning environment that empowers
				individuals to achieve their goals and unleash their potential.
			</p>
			<p>
				At <span class="brand-name">E-Learning Platform</span>, we offer a
				diverse range of courses covering various disciplines, including
				programming, web development, data science, business, and more.
				Whether you're a beginner looking to start your learning journey or
				a professional seeking to enhance your skills, we have something for
				everyone.
			</p>
			<p>Join our community today and embark on a transformative
				learning experience. Let's unlock your potential together!</p>
		</div>
	</section>
	<footer class="footer">
		<p>Copyright &copy; E-learning Platform. All rights reserved.</p>
	</footer>
</body>
</html>
