<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 40px;
            color: #333;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: darkred;
        }
        p {
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Oops! Something went wrong.</h1>
        <p>Unfortunately, an unexpected error occurred. We apologize for any inconvenience this may have caused.</p>
        <% if (request.getAttribute("error") != null) { %>
            <p>Error Details: <%= request.getAttribute("error") %></p>
        <% } else { %>
            <p>No detailed error information available.</p>
        <% } %>
        <p>Please try again, or contact support if the problem persists.</p>
        <a href="homepage.jsp">Return to Home</a>
    </div>
</body>
</html>
