<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.model.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="com.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

</body>
<div class="container">
	<div class="row p-2">
		<div class="col-md-6">


			<div class="card bg-white">
				<div class="card-body">
					<h3 class="text-center text-success">Your Selected Item</h3>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Book Name</th>
								<th scope="col">Narrator</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
							User u = (User) session.getAttribute("userobj");

							CartDAO dao = new CartDAO(DBConnect.getConn());
							List<Cart> cart = dao.getBookByUser(u.getUser_id());
							Double totalPrice = 0.00;
							for (Cart c : cart) {
								totalPrice = c.getTotal_price();
							%>
							<tr>
								<th scope="row"><%=c.getBookName()%></th>
								<td><%=c.getNarrator()%></td>
								<td><%=c.getPrice()%></td>
								<td><a
									href="remove_book?bid=<%=c.getBook_id()%>&&uid=<%=c.getUser_id()%>"
									class="btn btn-sm btn-danger">Remove</a></td>
							</tr>
							<%
							}
							%>

							<tr>
								<td>Total Price</td>
								<td></td>
								<td></td>
								<td><%=totalPrice%></td>
							</tr>



						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center text-success">Your Details for Order</h3>
					<form action="order" method="post">
					<input type="hidden" value="${userobj.user_id}" name="id">
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text" name="username"
									class="form-control" id="inputEmail4" value=${userobj.name } required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email" name="email"
									class="form-control" id="inputPassword4"
									value=${userobj.email } required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone number</label> <input name="phone_no" type="tel" pattern="^\d{10}$" required 
                            placeholder="Enter Phone Number" name="phone_no"  title="Please enter a valid 10 digit mobile number"
									 class="form-control" id="inputEmail4"
									 required>
							</div>
						</div>

						<div class="form-group col-md-6">
							<label>Payment Mode</label> <select class="form-control" name="payment">
								<option value="noselect">----Select-----</option>
								<option value="online_payment">online payment</option>
							</select>

						</div>

						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
					</form>






				</div>

			</div>



		</div>


	</div>


</div>
</html>