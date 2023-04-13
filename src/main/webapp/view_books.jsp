<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.IBookDAO"%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.model.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<%
	int bid1 = Integer.parseInt(request.getParameter("bid"));
	BookDAO dao = new BookDAO(DBConnect.getConn());
	BookDtls b = dao.getBookbyid(bid1);
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Book/<%=b.getPhotoName()%>"
					style="height: 150px; width: 100px"> <br>
				<h4 class="mt-3">
					Book Name :<span class="text-info"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Narrated by: <span class="text-info"><%=b.getNarrator()%></span>
				</h4>
				<h4>
					Category: <span class="text-info"><%=b.getBookCategory()%></span>
				</h4>
				<h4>
					Description: <span class="text-info"><%=b.getDescription()%></span>
				</h4>

			</div>
			<div class="col-md-6  text-center p-5 border bg-white">

				<h4><%=b.getBookName()%></h4>
				<br>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill fa-3x"></i>
						<p>Secured Payment</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-bolt fa-3x"></i>
						<p>Instant Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-3x"></i>
						<p>30 Days Return</p>
					</div>

				</div>


				<div class="text-center p-3">
					
					<a href="CardPayment.jsp" class="btn btn-primary"><i
						class="fa-solid fa-money-bill-wave"></i>Pay Online</a>

				</div>

			</div>
		</div>
	</div>
</body>
</html>