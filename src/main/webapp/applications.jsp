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
<title>applied students list</title>
<style>

</style>
</head>
<body>
	<h2>Students applied for placements</h2>

	<table style="border-collapse: collapse;" cellpadding="20px" >
		<thead>
			<tr>
				<td>S.no</td>
				<td>Reg No</td>
				<td>Name</td>
				<td>Course</td>
				<td>Company applied</td>
			</tr>
		</thead>
		
		<tbody>
		<% 
		int i=1;
		String sql="select * from ";
		
		%>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</body>
</html>