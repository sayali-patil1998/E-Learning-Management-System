<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("uid"));
	System.out.println("Deleted Tutorial Id= " + id);

	UserDao userDao = new UserDao();
	String msg = userDao.deleteUser(id);
	session.setAttribute("message", msg);
	response.sendRedirect("delete_user.jsp");
	%>
</body>
</html>