<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.model.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderDAO"%>
<%@page import="com.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		<% 
		        BookOrderDAO dao = new BookOrderDAO(DBConnect.getConn());
				List<Book_Order> blist = dao.getAllOrder();
				for(Book_Order b:blist)
				{%>
				<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getPhone_no() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getNarrator() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
				</tr>	
				<%}
			
			%>
		</tbody>
	</table>
	<div style="margin-top: 250px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>