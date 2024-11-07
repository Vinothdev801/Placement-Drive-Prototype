<%@page import="java.sql.ResultSet"%>
<%@page import="com.AV.placement.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% //Prevent from browser back button

        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//this is for HTTP 1.1 to clear cache.
        response.setHeader("Pragma","no-cache"); // this for HTTP 1.0 to clear cache. 
        response.setHeader("Expires", "0"); // this for proxy server to clearcache.
        		
        

        if(session.getAttribute("regno")==null){response.sendRedirect("slogin.html"); }
        
        
        
	        String query="Select * from student where regno='"+session.getAttribute("regno")+"'";
	        ResultSet rs=null;
	        
	        
	        
	        try{
	        	Connection con=DbConnect.connect();
		        PreparedStatement pst = con.prepareStatement(query);
				rs = pst.executeQuery();
				
	        }
	        catch(Exception e){
	        	System.out.println(" fetch error occured in profile page"+e);
	        }
	         
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
    <div class="container">
        <div class="content">
        
            <form action="update" method="post">
            <div class="title"><h2>Profile</h2></div>
            
             <%if(session.getAttribute("msg")=="1"){ %> <div class="update"><p> Profile updated successfully.</p></div><%} %>
            <div class="form">
			
            <div class="label">
                <label>Name</label>
                <label>Reg No</label>
                <label>E-Mail</label>
                <label>D.O.B</label>
                <label>Course</label>
                <label>Skills</label>
                <label>Photo link</label>
                <label>Resume link</label>
            </div>

            <div class="input"><% if(rs.next()){ %>
                <input type="text" name="name" value="<%=rs.getString("name")%>">
                <input type="text" name="regno" value="<%=rs.getString("regno")%>">
                <input type="email" name="email" value="<%=rs.getString("email")%>">
                <input type="date" name="dob" value="<%=rs.getString("dob")%>">

                <select name="course">
                    <option value="<%=rs.getString("course")%>"> select your course</option>
                    <option value="MCA">M.C.A (COMPUTER APPLICATIONS)</option>
                    <option value="COMPUTER SCIENCE"> M.SC COMPUTER SCIENCE</option>
                    <option value="ELECRONICS">ELECRONICS</option>
                </select>
                
                <input type="text" name="skills" value="<%=rs.getString("skills")%> ">
                <input type="url" name="photo" value="<%=rs.getString("photo")%>"placeholder="give current photo G-drive link">
                <input type="url" name="resume" value="<%=rs.getString("resume")%>" placeholder="updated resume link">
            <%} %></div></div>
            <button type="submit">Update</button>
        </form>
        
        </div>
    </div>
</body>
</html>