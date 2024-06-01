<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="dao.TutorialDao" %>
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
	int id = Integer.parseInt(request.getParameter("tid"));
	System.out.println("Deleted Tutorial Id= " + id);
	TutorialDao tutDao = new TutorialDao();
	String msg=tutDao.deleteTutorial(id);
	System.out.println(msg);
	session.setAttribute("message", msg);
	response.sendRedirect("show_tutorials_names_deletion.jsp");
	%>

</body>
</html>