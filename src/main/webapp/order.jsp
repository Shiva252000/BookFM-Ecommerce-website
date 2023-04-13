<%@page import="com.model.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderDAO"%>
<%@page import="com.model.User"%>
<%@page import="com.model.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">

		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-3s">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Narrator</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Audio Book</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderDAO dao = new BookOrderDAO(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getNarrator() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
					<td><audio controls>
						<source src="./Audio/<%=b.getAudio()%>" type="audio/mpeg">
					</audio></td>

				</tr>
				<%
				}
				%>




			</tbody>
		</table>


	</div>


</body>
</html>