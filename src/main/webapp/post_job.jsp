<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% //Prevent from browser back button

        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//this is for HTTP 1.1 to clear cache.
        response.setHeader("Pragma","no-cache"); // this for HTTP 1.0 to clear cache. 
        response.setHeader("Expires", "0"); // this for proxy server to clearcache.
        
        if(session.getAttribute("admin")==null){
      	  response.sendRedirect("alogin.html");
        }
    %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post jobs</title>
    <style>
        body{
            background-image: url(images/jobpost.png);
            background-size: calc(100vw) calc(100vh);
  		    background-position: center;
            color:solid black;
        }
       .container{
        display: flex;
        align-items: center;
        justify-content: center;
        
       }
       .container .content{
        /* border:4px solid blueviolet; */
        width: 550px;
        height: fit-content;
        background:whitesmoke;
        border-radius:5px;
        align-items:center;
        position:relative;
       }

       form label{
        padding: 10px;
       }

       form input{
        display: block;
        block-size: 25px;
        padding:15px;
        width: 300px;
        margin: 4px 10px 20px 30px;
        border:1px solid black;
        border-radius:5px;
        
       &:focus{
        outline: none;
       }
      }

       form textarea{
        margin: 4px 10px 20px 30px;
        &:focus{
        	outline: none;
       	}
      }
       form button{
        margin-left: 240px;
        padding: 10px 20px;
        
       }
      form{
       	margin-left:100px;
       }
       .header{
       	margin-left:50px;
       }
       #goback{
       position:relative;
       	margin-left:100px;
       	top:-40;
       	width: 100px;
       }
       #goback a{
       	text-decoration:none;
       }
       #submit{
       	cursor:pointer;
       	transition: .5s ease;
       	&:hover{
       		color:white;
       		background: black;
       	}
       }
       
       #msg{
       position: relative;
       top:-50;
       font-size:18px;
       left: 80;    	
       }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <div class="header">
                <h2>Job details </h2>
            </div>
            <form action="postjob" method="post" autocomplete="off">
                <label>Company name</label>
                <input type="text" name="company_name" required>
                
                <label>Company Email</label>
                <input type="text" name="company_email" required>

                <label>Job role</label>
                <input type="text" name="job_role" required>

                <label>Elibility</label> <br>
                <textarea name="eligible" id="eligible" cols="40" rows="5"></textarea><br>

                <label>Skills required</label>
                <input type="text" name="skills" placeholder="enter mulitple skills with ',' seperator" required>
                
                <label>Batch</label>
                <input type="text" name="batch" required>

                <label>Hiring package</label>
                <input type="text" name="package" placeholder="hiring package in LPA" required> 
              
                <button id="submit" type="submit">Post Job</button> 
                
                
            </form>
            <div id="goback"><a href="ahome.jsp">Go back</a></div>
            
            <p id="msg">
                <% 
                
                if(request.getAttribute("msg")=="true"){
                	 out.println("Job posted successfully.");
                }
                	
                if(request.getAttribute("msg")=="false"){
                	out.println("Something went wrong. Try again later.");
                }
                
                if(request.getAttribute("msg")=="already"){
                	out.println("Already registered.");
                }
                
                %></p>
        </div>
    </div>
</body>
</html>