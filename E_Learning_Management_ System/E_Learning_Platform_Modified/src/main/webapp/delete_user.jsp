<%@page import="pojos.UserRole"%>
<%@page import="dao.UserDao"%>
<%@page import="pojos.User"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.*, pojos.Tutorial"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="links.jsp"%>
</head>
<body>

	<div class="container-fluid">
		<%@ include file="delete_alert.jsp"%>
		<a
			style="color: white; background-color: red; position: absolute; top: 1px; left: 92%"
			class="btn btn-primary" href="logout.jsp" role="button">Logout</a>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Sr. No.</th>
					<th scope="col">Tutorial Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				UserDao userDao = new UserDao();
				List<User> users = userDao.getAllUsers();
				int count = 1;
				for (User u : users) {
					if (u.getRole().equals(UserRole.CUSTOMER)) {
				%>
				<tr>
					<th scope="row"><%=count%></th>
					<td><%=u.getName()%></td>
					<td><a class="btn btn-primary"
						href="delete_user_page.jsp?uid=<%=u.getId()%>" role="button">Delete</a></td>
				</tr>
				<%
				count++;
				System.out.println(u.getId());
				}
				}
				%>
			</tbody>
		</table>

	</div>
</body>
</html>