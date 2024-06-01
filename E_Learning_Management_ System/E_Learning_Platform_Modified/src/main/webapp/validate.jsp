<%@page import="beans.UserBean"%>
<%@page import="org.hibernate.cfg.*, org.hibernate.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Validation Result</title>
</head>
<body>
	<%-- Invoke ALL MATCHING setters of JB --%>
	<jsp:setProperty property="*" name="user" />
	<%-- Invoke B.L method of JB w/o java code --%>
<%-- session.getAttribute("user").authenticateUser() --%>
<%-- <h4>Navigational outcome: ${sessionScope.user.authenticateUser()}</h4> --%>
<%-- <jsp:forward page="${sessionScope.user.authenticateUser()}.jsp" /> --%>
<%-- WC: RD rd = request.getRD(session.getAttribute("user").authenticateUser().concat(".jsp"). --%>
<%-- rd.forward(request, response) --%>
<%-- CP II  --%>
<%-- response.sendRedirect(response.encodeRedirectURL("${sessionScope.user.authenticateUser()}.jsp"))  --%>
<%-- <c:redirect/> also does the URL rewriting  --%>
	<%
	/* String username = request.getParameter("username");
	String password = request.getParameter("password");
	 */

	UserBean userBean = (UserBean) session.getAttribute("user");
	// Perform validation here (e.g., checking against a database)

	response.sendRedirect(response.encodeRedirectURL(userBean.authenticateUser().concat(".jsp")));
	%>
</body>
</html>
