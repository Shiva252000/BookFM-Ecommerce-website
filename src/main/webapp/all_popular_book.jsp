<%@page import="com.model.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAO"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored ="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All popular releases</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
   User u=(User)session.getAttribute("userobj");
%>

<c:if test="${not empty addCart}">
	
	<div id="toast"> ${addCart} </div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	
		<c:remove var="addCart" scope="session"/>				
</c:if>


	<%@include file="all_component/navbar.jsp"%>
	<h3 class="Rtext text-center">Popular Releases</h3>
	<hr>
	<div class="container-fluid">
	  <div class="row p-3">
	       
	        <%
			BookDAO dao2 = new BookDAO(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllPopularBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-auto mx-auto">
				<div class="crd-ho card mt-4">

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
							<% if(u==null){%>
                            <a href="Login.jsp" class="btn btn-outline-dark btn-sm ml-2 mr-2">
							 <i class="fa-solid fa-cart-shopping"></i> Add Cart</a>						
						<%}else{%>
						    <a href="popular_cart?bid=<%=b.getBookId() %>&&uid=<%=u.getUser_id() %>" class="btn btn-outline-dark btn-sm ml-2 mr-2">
							 <i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
						<%}
						 %>
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-outline-dark btn-sm mr-2"> View
								Details</a>

						</div>
					</div>

				</div>
			</div>

			<%
			}
			%>
	    </div>
      </div>
</body>
</html>