<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.AV.placement.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="9"> -->
<title>My Application</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<style>
	*{
		font-family: "Montserrat", sans-serif;
	}
	.goback{
		text-align:center;
		margin: 30px auto;
		
	}
	.goback a{
		text-decoration:none;
		color:white;
		background:linear-gradient(20deg,orange,red);
		border: 1px solid ;
		border-radius:35px;
		padding:5px 10px;
	}
	.body{
		  margin-top:50px;
		  display: flex;
		  justify-content:center;
		  align-items: center;

   }
	.content{
		margin:20px;
		text-align:center;
		
	}
	table{
		display:inline-block;
		justify-content:space-between;
		align-items:center;
		text-align:center;
		width:650px;
		height:fit-content;
		border-radius:10px;
		background-color:whitesmoke;
		box-shadow: 1px 1px 15px gray;
	}
	table tr th{
		padding:20px;
		width:150px;
	}
	table thead{
		background-color:rgb(58, 58, 58);
		color:white;
	}
	table tbody tr td{
	  padding:10px;
	  max-width:160px;
	  width: fit-content;
	  text-wrap:wrap;
	  color:black;
	}
	
</style>
</head>
<body>
	<div class="goback"><a href="SHome.jsp">Go Back</a></div>
	<div class="body">
	<div class="content">
		
		
		<table style="border-collapse: collapse">
			<h3>Here the list of companies that you have Applied will be displayed here </h3>
			<thead>
				<tr style="text-align:center;">
					<th>S.no</th>
					<th>Company Name</th>
					<th>Role</th>
					<th>Status</th>
				</tr>
			</thead> 
			<tbody>
			 <%
		    	String sql="SELECT recruitments.cid, recruitments.company_name, recruitments.role, appliedcompany.cid, appliedcompany.regno  FROM recruitments  LEFT JOIN appliedcompany  ON recruitments.cid = appliedcompany.cid  WHERE appliedcompany.regno ='"+(String)session.getAttribute("regno")+"'";
		    	ResultSet rs=null;
			 	try{
			 		rs=DbConnect.fetchQ(sql);  
		    	}
			 	
		    	catch(Exception e){
		    		System.out.println("error \n"+e);
		    		
		    	}
			 	
			 	if(rs!=null){
	    	    	System.out.println("data Retrived.");
					int i=1;
					while(rs!=null){
			%>
				<tr >
					<td><%=i %></td>
					<td><%= rs.getString("Company_name") %></td>
					<td><%= rs.getString("role")%> </td>
					<td>Registered</td>
				</tr>
				
				<%
					i++;
					if(!rs.next())
						break;
					}
				 }else{%>
				 <tr>
        				<td colspan="4" style="text-align:center;padding:10px;"><%="You didn’t register for the companies."%></td>
        			</tr>
        		<% }%>
			</tbody>
		</table>
	</div></div>
	
</body>
</html>
    <% //Prevent from browser back button

        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//this is for HTTP 1.1 to clear cache.
        response.setHeader("Pragma","no-cache"); // this for HTTP 1.0 to clear cache. 
        response.setHeader("Expires", "0"); // this for proxy server to clearcache. 

        if(session.getAttribute("regno")==null){response.sendRedirect("slogin.html"); }
        
    %>
    
    
    
    
    