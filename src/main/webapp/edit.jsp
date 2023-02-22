<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.help.Factory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0"></div>
		<%@ include file="navbar.jsp"%><br>
		<h1>this is edit page</h1>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = Factory.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<form action="UpdateServlet" method="post">
		
		<input type="hidden" value="<%= note.getId() %>" name="noteId">
		
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title"
					required="required" type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value=<%=note.getTitle()%>>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter here" class="form-control" style="height: 100px"><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>

			</div>
		</form>
</body>
</html>