<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
    color: black; /* Change color to your preferred color */
    text-transform: uppercase; /* Optionally, transform text to uppercase */
    font-weight: bold; /* Optionally, make the text bold */
}


.carousel-img {
	max-height: 600px; /* Adjust the maximum height as needed */
	object-fit: cover;
}

.card-container {
    display: flex;
    flex-direction: row; /* Change flex-direction to row */
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
				<a href="login.jsp" class="login">Login</a> 
				<a href="reg.jsp" class="register">Register</a>
			</div>
		</nav>
	</header>

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
		<h1 class="section-title">Our Courses</h1>
		<div class="card-slider">
			<div class="card-container">
				<div class="card" style="width: 18rem;">
					<img
						src="https://gravitysoftwareclasses.in/wp-content/uploads/2022/12/Frame-6-1.png"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Core Java</h5>
						<p class="card-text">Master the fundamentals of Java
							programming, including object-oriented concepts, inheritance, and
							exception handling.</p>
						<a href="https://www.javatpoint.com/what-is-core-java"
							class="btn btn-primary">See Full Course</a>
					</div>
				</div>

				<div class="card" style="width: 18rem;">
					<img src="https://gravitysoftwareclasses.in/wp-content/uploads/2022/12/Frame-7-1.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Advance Java</h5>
						<p class="card-text">Dive deeper into Java development with
							Servlets, JSP, JDBC, and frameworks like Spring and Hibernate.</p>
						<a href="https://www.geeksforgeeks.org/what-is-advanced-java/"
							class="btn btn-primary">See Full Course</a>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="https://miro.medium.com/v2/resize:fit:400/0*jba3dz1j64rfhl5i.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Hibernate</h5>
						<p class="card-text">Explore Hibernate, a powerful ORM framework for Java, and
							learn to simplify database interactions.</p>
						<a href="https://www.javatpoint.com/hibernate-tutorial"
							class="btn btn-primary">See Full Course</a>
					</div>
				</div>

				<div class="card" style="width: 18rem;">
					<img src="https://supundharmarathne.files.wordpress.com/2014/09/spring-2.jpg?w=640" class="card-img-top" alt="...">
					<div class="card-body">
						<h3>Spring</h3>
						<p>Discover the Spring framework and its features for building
							robust and scalable Java applications.</p>
						<a href="https://www.tutorialspoint.com/spring/index.htm" class="btn btn-primary">See
							Full Course</a>
					</div>
				</div>

				<div class="card" style="width: 18rem;">
					<img src="https://img1.daumcdn.net/thumb/R300x0/?fname=https://blog.kakaocdn.net/dn/MPDFo/btqzUQvYnga/h7CdquKFdWGQznO8grBpsK/img.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h3>Spring Boot</h3>
						<p>Learn Spring Boot to accelerate your application
							development with streamlined configuration and embedded servers.</p>
						<a href="https://www.tutorialspoint.com/spring_boot/spring_boot_introduction.htm" class ="btn btn-primary">See
							Full Course</a>
					</div>
				</div>
			</div>
		</div>
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
