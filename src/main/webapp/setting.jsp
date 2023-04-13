<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decortation: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>


</head>
<body style="background-color: #FEFEFF;">
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp" />
	</c:if>


	<%@include file="all_component/navbar.jsp"%>

	<div class="container">

		<h3 class="text-center">Hello,${userobj.name}</h3>


		<div class="row p-5">
			<div class="col-md-6">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h4>Sell Vintage Book</h4>
						</div>

					</div>


				</a>

			</div>


			<div class="col-md-6">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-sharp fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>

					</div>


				</a>

			</div>



			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-sharp fa-solid fa-box fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>

					</div>


				</a>

			</div>


			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>

					</div>


				</a>

			</div>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>