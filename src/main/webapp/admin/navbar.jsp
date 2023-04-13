<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored ="false" %>
<div class="container-fluid p-3  " style="background-color: #728FCE">
	<div class="row">
		<div class="col-md-3 text-white">

			<div class="hh">
				<h3>
					<i class="fa-sharp fa-solid fa-headphones"></i> BOOKFM
				</h3>
			</div>


		</div>
		

		<div class="node" style="margin-top: 16px">
			<!-- change kara hai -->
			<c:if test="${not empty userobj }"><a class="nav-text btn btn-outline-dark"><i
				class="fa-solid fa-right-to-bracket"></i>${ userobj.name}</a> <a
				data-toggle="modal" data-target="#exampleModalCenter" class="nav-text btn btn-outline-dark text-black"><i
				class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</c:if>
			<c:if test="${empty userobj }"><a href="../Login.jsp" class="nav-text btn btn-outline-dark"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="../Register.jsp" class="nav-text btn btn-outline-dark text-black"><i
				class="fa-solid fa-user-plus"></i> Register</a>
			</c:if> 
		</div>
	</div>
</div>

<!-- logout modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h4>Do you want to logout ?</h4>
        <div class="text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href = "../logout"type="button" class="btn btn-primary text-white">Logout</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- end logout modal -->



<!-- 

-->

<nav class="navbar navbar-expand-lg navbar-#BCE784 bg-custom">
	<a class="navbar-brand" href="#"></a>



	<ul class="navbar-nav mr-auto">
		<li class="nav-item"><a class="nav-text nav-link" href="home.jsp"><i
				class="fa-sharp fa-solid fa-house"></i> Home<span class="sr-only">(current)</span></a>
		</li>

		</form>
</nav>