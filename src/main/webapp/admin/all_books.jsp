<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.IBookDAO"%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.model.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Photo</th>
				<th scope="col">Book Name</th>
				<th scope="col">Narrator</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Book desc</th>
				<th scope="col">Action</th>
				<th scope="col">Audio</th>

			</tr>
		</thead>
		<tbody>
			<%
		BookDAO dao=new BookDAO(DBConnect.getConn());
				List <BookDtls> list = dao.getAllBooks();
				for (BookDtls b: list){
		%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../Book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getNarrator()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getDescription()%></td>
				<td><a href="edit_books.jsp?Id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a>
					<a href="../delete?Id=<%=b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>Delete</a>
				</td>
				<td><audio controls>
						<source src="../Audio/<%=b.getAudio()%>" type="audio/mpeg">
					</audio></td>









			</tr>
			<%
		}
				
		%>

		</tbody>
	</table>
	<div style="margin-top: 250px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>