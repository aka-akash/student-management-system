<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Courses</title>
	<link rel="stylesheet" type="text/css" href="css/HomeCourses.css">
</head>
<body>
	<jsp:include page="HomeNavBar.jsp" />
	<div class="container">
		<div class="about">
			<table>
				<tr>
					<th>Course Name</th>
					<th>Fee</th>
					<th>Duration(Years)</th>
					<th>Description</th>
				</tr>
				<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smsproject", "root", "varsha");

				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM courses");
				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					String courseName = rs.getString("course_name");
					String fee = rs.getString("fee");
					String duration = rs.getString("duration");
					String description = rs.getString("about");

					out.println("<tr>");
					out.println("<td>" + courseName + "</td>");
					out.println("<td>" + fee + "</td>");
					out.println("<td>" + duration + "</td>");
					out.println("<td>" + description + "</td>");
					out.println("</tr>");
				}

				rs.close();
				stmt.close();
				conn.close();
				%>
			
			</table>

		</div>
		</div>
</body>
</html>