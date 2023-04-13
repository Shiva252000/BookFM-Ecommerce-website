<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.db.DBConnect"%>
<%@page import="com.model.BookDtls"%>
<%@page import="com.admin.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">

	<%
	request.getParameter("bname");
	%>

	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<%
						int Id = Integer.parseInt(request.getParameter("Id"));
						BookDAO dao = new BookDAO(DBConnect.getConn());
						BookDtls b = dao.getBookbyid(Id);
						if (b != null) {
						%>

						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Narrator</label> <input
									name="narrator" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getNarrator()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book Description</label> <input
									name="description" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getDescription()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Categories*</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>---select---</option>
									<option value="New">New Book</option>
									<option value="Popular">Popular Book</option>
									<option value="Vintage">Vintage Book</option> value="<%=b.getBookCategory()%>">
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
						<%
						} else {
						out.println("Book not found!");
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 250px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>