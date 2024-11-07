<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.AV.placement.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
    
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
<title>Companies list</title>
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
		background:linear-gradient(20deg,rgb(0, 255, 94),black);
		border: 1px solid ;
		border-radius:35px;
		padding:5px 10px;
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
		width:850px;
		height:fit-content;
		border-radius:10px;
		background-color:whitesmoke;
		box-shadow: 1px 1px 15px gray;
		overflow:hidden;
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
	  max-width:200px;
	  width: fit-content;
	  text-wrap:wrap;
	  color:black;
	}

    form{
        margin:20px;
    }
    
    form input{
    	width:20%;
    	padding:10px;
    }
    form button{
    	padding:10px 15px;
    	background:#0c4da2;
    	color:white;
    	border:none;
    	border-radius:5px;
    }
</style>
</head>
<body>
    <div class="goback"><a href="ahome.jsp">Go back</a></div>
    <div class="body">
        <div class="content">

            <h3>Here the list of companies posted job in this website</h3>
                

                <form method="post">
                    <input type="text" placeholder="Enter company name " class="sbox" name="search">
                    <button type="submit" class="search" name="submit">Search</button>
                </form>
            <table style="border-collapse: collapse;">
                <thead>
                    <tr style="text-align: center;">
                        <th>S.no</th>
                        <th>Company Name</th>
                        <th>E-mail</th>
                        <th>Posted job name</th>
                        <th>Job package</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int no=1;
                    
                    String search = request.getParameter("search");
                    String query="SELECT company_name, email, role, package  FROM recruitments ";
                    ResultSet rs = null;
                    
                    boolean bool=false;
                    if (request.getParameter("submit") != null && search != null && !search.isEmpty()) {
                        try{
                            Connection con = DbConnect.connect();
	                    	String sql = "SELECT company_name, email, role, package FROM recruitments WHERE company_name LIKE ?";
	                    	PreparedStatement pst = con.prepareStatement(sql);
	                    	pst.setString(1, "%" + search + "%");
	                    	
	                    	rs=pst.executeQuery();
	                    	bool=rs.next();
                        }
                        catch(Exception e){
                            System.out.println("error");
                        }
                        
                    }
                    
                    else{
                    	
                    	try{
                    		rs=DbConnect.fetchQ(query);
                    		bool = (rs!=null);
                    	}
                    	catch(Exception e){
                    		System.out.print("error"+e);
                    	}
                    }
                    
                    if(rs!=null){
                    	while(bool){ %>
                    		<tr >
								<td><%=no %></td>
								<td><%= rs.getString("company_name") %></td>
								<td><%= rs.getString("email")%> </td>
								<td><%= rs.getString("role")%> </td>
								<td><%= rs.getString("package")%> </td>
							</tr>
                    <%	
                    	no++;
						if(!rs.next())
							break;
						}
				 	}else{
                    %>
                    <tr>
        				<td colspan="5" style="text-align:center;padding:10px;"><%="No data found."%></td>
        			</tr>
        		<% }%>
                </tbody>

            </table>
        </div>
    </div>
</body>
</html>