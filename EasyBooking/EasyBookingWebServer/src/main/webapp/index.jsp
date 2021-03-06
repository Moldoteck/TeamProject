<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="css/indexstyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper-utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper-utils.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper-utils.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper-utils.min.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.min.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper-utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper-utils.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper-utils.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper-utils.min.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.min.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper-utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper-utils.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper-utils.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper-utils.min.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.js.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js.map"></script>

<script>
	function jump(h) {
		var url = location.href; //Save down the URL without hash.
		location.href = "#" + h; //Go to the target element.
		history.replaceState(null, null, url); //Don't like hashes. Changing it back.
	};
</script>
</head>
<%
	String userId = null;

	// Verifică dacă este o sesiune nouă
	// Dacă este prima dată de la deschiderea browser-ului când se accesează pagina
	if (session.isNew()) {
		session.setAttribute("userId", userId);
	}

	userId = (String) session.getAttribute("userId");
%>

<body onload='jump("results")'>

	<nav
		class="navbar navbar-expand-lg navbar-expand-xs navbar-expand-md navbar-expand-sm fixed-top ">

		<a class="navbar-brand" href="index.jsp"><img
			src="images/home.png" width="40" height="40"></a>


		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-4">

				<%
					if (userId != null) {
				%>
				<li class="nav-item">
					<div class="navbar" style="display: inline;">

						<li><img style="margin-left: 0px; padding-left: 0px;"
							src="images/user.png" alt="user img" width="50" height="50"></li>
						<a id="user_details" class="nav-link" href="userDetails.jsp">
							<%
								out.print(session.getAttribute("userId"));
							%>
						</a> 
						<a class="nav-link" data-value="become_a_host" href="addHome.jsp">Become
							a host</a>
						<form action="myBookingsServlet" method="get"
							enctype="multipart/form-data">
							<button class=" btn nav-link btn-link">My Bookings</button>
						</form>
						<form action="LogOutServlet" method="get"
							enctype="multipart/form-data">
							<button class=" btn nav-link btn-link">Log Out</button>
						</form>
					</div>
				</li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link " data-value="login"
					href="login.jsp">Log in</a></li>
				<li class="nav-item"><a class="nav-link " data-value="signup"
					href="register.jsp">Sign Up</a></li>
				<%
					}
				%>
				</li>
			</ul>

		</div>

	</nav>

	<header class="header ">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<form action="SearchServlet" method="post"
			enctype="multipart/form-data">

			<div class="overlay"></div>
			<div class="container" style="text-align: center;">
				<div class="row">
					<div class="col-md-6">
						<div id="custom-search-input" style="text-align: center;">

							<div class="input-group col-md-12">
								<input type="text" class="form-control input-lg"
									placeholder="Search" name="search" id="search" />
								<div class="input-group-btn">
									<button class="btn btn-info btn-lg" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</header>

	<%
		if (session.getAttribute("searchResult") != null) {
	%><a name="results"></a>
	<br />
	<br />
	<%
		out.print(session.getAttribute("searchResult"));

		}
	%>

	<!-- Team section -->
	<div class="team" id="team">
		<div class="container">
			<h1 class="text-center">Our Team</h1>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 item">
					<img src="images/gina.jpg" class="img-fluid" alt="team">
					<div class="des">Ungureanu Elena-Georgiana</div>
					<span class="text-muted">Team Member</span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 item">
					<img src="images/magda.jpg" class="img-fluid" alt="team">
					<div class="des">B&#259;rbieru Magda</div>
					<span class="text-muted">Team Member</span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 item">
					<img src="images/carmencita.jpg" class="img-fluid" alt="team">
					<div class="des">Bogli&#537; Carmen</div>
					<span class="text-muted">Team Member</span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 item">
					<img src="images/cristi.jpg" class="img-fluid" alt="team">
					<div class="des">P&#259;dureac Cristian</div>
					<span class="text-muted">Team Member</span>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-12 item"
					style="width: 800px; margin: 0 auto;">
					<img src="images/ramona.jpg" class="img-fluid" alt="team">
					<div class="des">Bodron Ramona-Elena</div>
					<span class="text-muted">Team Leader</span>
				</div>
			</div>
		</div>
	</div>


	<!-- add Javasscript file from js file -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src='js/main.js'></script>
</body>
</html>