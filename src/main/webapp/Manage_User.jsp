
<%@page import="com.placement.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
  //Prevent from browser back button
  
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); // this is for HTTP 1.1 to clear cache.
  
  response.setHeader("Pragma", "no-cache"); // this for HTTP 1.0 to clear cache.
  
  response.setHeader("Expires", "0"); // this for proxy server to clear cache.
  
  if(session.getAttribute("admin")!=null){
	  response.sendRedirect("alogin.html");
  }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<header>
		<img src="images/srmlogo.png" alt="SrmLogo" width="150px"
			height="50px" />
		<nav>
			<ul>
				<li><a href="#"></a></li>
				<li><a href="#">Placement Registerations</a></li>
				<li><a href="#manage_user">Manage Users</a></li>
				<li><form action="logout" method="post">
						<button type="submit">LogOut</button>
						<input type="hidden" value="1" name="Identify">
					</form></li>
			</ul>
		</nav>
	</header>
	<h1>Manager Website users here...</h1>
	<div class="" id="manage_user">
		<form method="post">
			<input type="text" placeholder="Enter name or Reg.no to search"
				class="sbox" name="search">
			<button type="submit" class="search" name="submit">Search</button>
		</form>
		<table border="1px" cellspacing="0" cellpadding="10">
			<thead>
			<caption>list of users in this Website</caption>
			<tr>
				<th>S.no</th>
				<th>Register No</th>
				<th>Name</th>
				<th>E-mail</th>
				<th>Action</th>
			</tr>
			</thead>
			<tbody>
				<%int no=1;
          String search=request.getParameter("search");
          String query="select regno,name,email from student";
          ResultSet rs=DbConnect.fetchQ(query);
          //out.println("hi "+ rs.getString(1));
          if(rs!=null){
          	while(rs!=null){ 
          %>
				<tr>
					<td><%= no %></td>
					<td><%= rs.getString("regno")%></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("email") %></td>
					<td>
						<button onclick=''>Delete</button>
					</td>
				</tr>

				<% no++;
             if(!rs.next())
            	break; 
             }
          	} 
          else
          {
          %>
				<tr>
					<td colspan="5" style="text-align: center;"><%="No one has registered yet." %></td>
				</tr>
				<%} %>
			</tbody>

		</table>
	</div>
</body>
</html>
