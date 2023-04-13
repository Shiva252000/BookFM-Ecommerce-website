<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.IBookDAO"%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.model.BookDtls"%>
<%@ page import="com.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.back-img{
	background-repeat: no-repeat;
	height: 10px;
	background-size: cover;
	background-position: center;
	align-item: center;
	text-align: center;
	clip-path: polygon(100% 0, 93% 50%, 100% 99%, 0% 100%, 7% 50%, 0% 0%);
}
</style>
<!-- 
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Delicious+Handrawn&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Alkatra&family=Delicious+Handrawn&display=swap')
	;
	

  
@import
	url('https://fonts.googleapis.com/css2?family=Alkatra&family=Delicious+Handrawn&family=Raleway:ital,wght@1,300&display=swap')
	;
</style>
-->
 
</head>
<body style="background-color: #FEFEFF; margin: 0px; padding: 0px;">


	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/one.jpeg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/two.jpeg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/three.jpeg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<div class="container-fluid mr-auto">
		<div class="container-fluid back-img"></div>
	</div>
	<hr>

	<div class="container-fluid">
	 <h3 class="Rtext text-center">New Releases</h3>
	 <br>
		<div class="row mx-auto">

			<%
			BookDAO dao = new BookDAO(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-auto mx-auto">
				<div class="crd-ho card">
					<div class="card-body text-center">
						<img alt="Responsive image" src="Book/<%=b.getPhotoName()%>"
							style="width: 140px; height: 180px" class="img-fluid">
							<br>
						<div class="text1 text-center">
							<p>
								<%=b.getBookName()%></p>
							<p>
								Narrated By:<%=b.getNarrator()%></p>
							<p>
								Price:Rs.<%=b.getPrice()%></p>
						</div>

			<div class="row1 row">

						<%
						if (u == null) {
						%>
						<a href="Login.jsp" class="btn btn-outline-dark btn-sm ml-2 mr-2">
						<i class="fa-solid fa-cart-shopping"></i> Add Cart
						</a>
						<%
						} else {
						%>
						<a
						href="new_cart?bid=<%=b.getBookId()%>&&uid=<%=u.getUser_id()%>"
						class="btn btn-outline-dark btn-sm ml-2 mr-2"> <i
						class="fa-solid fa-cart-shopping"></i> Add Cart
						</a>
						<%
						}
						%>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>"
						class="btn btn-outline-dark btn-sm mr-2"> View Details</a>
						

			</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-3 container">
			<a href="all_new_book.jsp"
				class="btn btn-outline-dark btn-md text-black"> View All </a>
		</div>

	</div>
	<hr>

	<div class="container-fluid">
		<h3 class="Rtext text-center mt-2">Popular Releases</h3>
		<br>
		<div class="row">

			<%
			BookDAO dao2 = new BookDAO(DBConnect.getConn());
			List<BookDtls> list2 = dao.getPopularBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-auto mx-auto">
				<div class="crd-ho card ">
					<div class="card-body text-center">
						<img alt="Responsive image" src="Book/<%=b.getPhotoName()%>"
							style="width: 140px; height: 180px" class="img-fluid">
						<div class="text1 text-center">
							<p>
								<%=b.getBookName()%></p>
							<p>
								Narrated By:<%=b.getNarrator()%></p>
							<p>
								Price:Rs.<%=b.getPrice()%></p>
						</div>
						<div class="row1 row">

							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-outline-dark btn-sm ml-2 mr-2">
								<i class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="popular_cart?bid=<%=b.getBookId()%>&&uid=<%=u.getUser_id()%>"
								class="btn btn-outline-dark btn-sm ml-2 mr-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-dark btn-sm mr-2"> View Details</a>
								

						</div>
					</div>

				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-3 container">
			<a href="all_popular_book.jsp"
				class="btn btn-outline-dark btn-md text-black"> View All </a>
		</div>

	</div>
     <hr>

	

	<div class="container-fluid">
		<h3 class="Rtext text-center mt-2">Vintage Releases</h3>
		<br>
		<div class="row mx-auto">


			<%
			BookDAO dao3 = new BookDAO(DBConnect.getConn());
			List<BookDtls> list3 = dao.getVintageBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-auto mx-auto">
				<div class="crd-ho card ">

					<div class="card-body text-center">

						<img alt="Responsive image" src="Book/<%=b.getPhotoName()%>"
							style="width: 140px; height: 180px" class="img-fluid">

						<div class="text1 text-center">
							<p>
								<%=b.getBookName()%></p>
							<p>
								Narrated By:<%=b.getNarrator()%></p>
							<p>
								Price:Rs.<%=b.getPrice()%></p>
						</div>

						<div class="row1 row">

							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-outline-dark btn-sm ml-2 mr-2">
								<i class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="vintage_cart?bid=<%=b.getBookId()%>&&uid=<%=u.getUser_id()%>"
								class="btn btn-outline-dark btn-sm ml-2 mr-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-dark btn-sm mr-2"> View Details</a>

						</div>
					</div>

				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-3 container">
			<a href="all_vintage_book.jsp"
				class="btn btn-outline-dark btn-md text-black"> View All </a>
		</div>

	</div>
	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>