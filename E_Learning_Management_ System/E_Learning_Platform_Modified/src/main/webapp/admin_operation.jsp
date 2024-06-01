<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<style>
body{
display: flex;
	justify-content: center;
	align-items: center;
	height: 90vh;
	width: 100%;
	background-color: lightblue;
}
.button-container {
	text-align: center;
	margin-top: 50px; /* Adjust as needed */
	border: 2px solid #000;
	border-radius: 10px;
	width: 300px;
	background-color: #fff;
}

.styled-button, .other-button {
	background-color: #007bff;
	/* Blue, common color for e-learning platforms */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
	transition: background-color 0.3s ease;
}

.other-button {
	background-color: #28a745;
	/* Green, another common color for positive action */
}

.styled-button:hover, .other-button:hover {
	background-color: #0056b3; /* Darker blue on hover */
}
.btn_cls{
display: block;
height: 150px;
width: max-contain;
}
</style>
</head>
<body>

	<div class="button-container" >
		<div class="btn_cls" style="margin-top: 60px">
			<a style="background-color: red" href="delete_user.jsp" class="styled-button">Delete User</a> 
			</div>
			<div class="btn_cls">
			<a style="background-color: red" href="show_tutorials_names_deletion.jsp" class="other-button">Delete Tutorial</a>
			</div>
			<div class="btn_cls">
			<a href="tut_form.jsp" class="other-button">Add Tutorial</a>
			</div>
	</div>

</body>
</html>
