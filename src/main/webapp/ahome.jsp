<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
  //Prevent from browser back button
  
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); // this is for HTTP 1.1 to clear cache.
  
  response.setHeader("Pragma", "no-cache"); // this for HTTP 1.0 to clear cache.
  
  response.setHeader("Expires", "0"); // this for proxy server to clear cache.
  
  if(session.getAttribute("admin")==null){
	  response.sendRedirect("alogin.html");
  }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin home</title>
<link rel="stylesheet" href="css/ahome.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<h2>Admin Panel</h2>
		<nav>
			<a href="Post_Job.jsp">Post Jobs</a> <a href="Companies.jsp">Companies</a>
			<a href="Students.jsp">Students</a> <a href="Applications.jsp">Application</a>
			<label class="logout" for="sub"><svg
					xmlns="http://www.w3.org/2000/svg" height="24px"
					viewBox="0 -960 960 960" width="24px" fill="#FFFFFF">
            <path
						d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z" /></svg></label>

		</nav>
	</header>
	<form action="logout" method="post">
		<button type="submit" id="sub" hidden>Logout</button>
		<input type="hidden" value="1" name="Identify" />
	</form>
	<hr />
	<div class="body">
		<div class="content">
			<h1 id="wel">Welcome Admin</h1>
		</div>
	</div>
</body>
</html>