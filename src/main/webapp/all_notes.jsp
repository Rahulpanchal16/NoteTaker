<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.help.Factory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All note: Note Taker</title>
<%@ include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@ include file="navbar.jsp"%><br>
		<h1>All notes:</h1>

		<%
		Session s = Factory.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> l = q.list();
		for (Note note : l) {
		%>
		<div class="card mt-3">
			<img class="card-img-top pt-4 pl-4" style="max-width: 50px" src="images/pencil.png" alt="Card image cap">
			<div class="card-body px-4">
				<h5 class="card-title">Title: <%=note.getTitle()%></h5>
				<p class="card-text"><%= note.getContent() %></p>
				<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
				<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Edit</a>
			</div>
		</div>
		<%
		}
		s.close();
		%>
	</div>

</body>
</html>