<%@page import="com.AV.placement.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
 <!--     <meta http-equiv="refresh" content="9">-->
    <title>Student Home</title>
    <link rel="stylesheet" href="css/shome.css" />
  </head>
  <body>
    <% //Prevent from browser back button

        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//this is for HTTP 1.1 to clear cache.
        response.setHeader("Pragma","no-cache"); // this for HTTP 1.0 to clear cache. 
        response.setHeader("Expires", "0"); // this for proxy server to clearcache. 

        if(session.getAttribute("regno")==null){response.sendRedirect("slogin.html"); }
    %>

    <header id="header">
      <h2>Placement Student Portal</h2>
      <nav>
        <a href="sapplication.jsp">Companies Applied</a>
        <a href="Placement_Prepare.html" target="_blank">Preparation</a>
        <a href="profile.jsp">Profile</a>
        <label class="logout" for="sub"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF">
        <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg></label>
        
      </nav>
    </header>
    <form action="logout" method="post">
          <button type="submit" id="sub" hidden>Logout</button>
          <input type="hidden" value="2" name="Identify" />
        </form>
    <hr>

    <div class="body">
    <div class="body_container">
      <div id="regno">HI ${regno}</div>
      <h1 id="title">Welcome to Campus placement</h1>
      

      <div class="jobaction">
      
        <table style="border-collapse: collapse">
          <caption colspan="5" style="text-align: center">Apply here for campus recruiting opportunities</caption>
          <thead>
          <tr>
          	<th>S.no</th>
            <th>Company name</th>
            <th>Eligibility</th>
            <th>Expected Skills</th>
            <th>Job role</th>
            <th>Batch</th>
            <th>Package</th>
            <th>Action</th>
          </tr></thead>
          <tbody>
          	<%
          		int i=1;
          	
        		String query="SELECT * FROM recruitments";
        		ResultSet rs = DbConnect.fetchQ(query);
        		
        		 String sql="SELECT * from appliedcompany WHERE regno ="+(String)session.getAttribute("regno");
        		 ResultSet r =DbConnect.fetchQ(sql);
        		 
        		if(rs!=null){
        			while(rs!=null){        		
          	%>
          	
          	<tr style="text-align:center;">
          		<td><%= i %></td>
          		<td><%= rs.getString("Company_name") %></td>
          		<td><%= rs.getString("eligibility") %></td>
          		<td><%= rs.getString("skill") %></td>
          		<td><%= rs.getString("role") %></td>
          		<td><%= rs.getString("batch") %></td>
          		<td><%= rs.getString("package") %></td>
          		<td> <form action="fetchStudData" method="post">
              <input type="hidden" name="company_id" value='<%=rs.getInt("cid")%>'/>
              <input type="hidden" name="sregno" value="${regno}">
              <%
             
              //ResultSet r1;
			 	try{
		    		  if(r==null || (int)rs.getInt("cid")!=(int)r.getInt("cid")){%>
		    			  <button type="submit" id="reg" >Register</button>
		    		  <%}
		    		  else{%>
		    		  
		    			   <button type="submit" id="reg_disabled" disabled>Applied</button>
		    		  <%}
		    	}
			 	
		    	catch(Exception e){
		    		System.out.println("error \n"+e);
		    		
		    	}
              %>
            </form></td>
          	</tr>
          	
          	<%
          		   i++;
          	       if(!rs.next())
          	    		break;
        		  }
        		}
        		else{%>
        			<tr>
        				<td colspan="7" style="text-align:center;padding:10px;"><%="No companies haven't posted for recruitment."%></td>
        			</tr>
        		<% }%>
          </tbody>
        </table>
      </div>
      </div>
  </div>

  <footer>
  	<h2>Some of our recruiters</h2>
    <div class="recruiters"><center>
      <img src="images/r1.jpg" class="img1" width="1000px" height="250px" alt="company1" />
      <img src="images/r4.png" class="img2" width="1000px" height="250px" alt="company2" />
      <img src="images/r2.png" class="img3" width="1000px" height="250px" alt="company3" /></center>
    </div>
  </footer>
  </body>
</html>
