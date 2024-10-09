<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title> Register </title>
	<link rel="stylesheet" type="text/css" href="css/psreg.css">
</head>

<body>
	<div class="container ">
		<div class="title">JOB REGISTER</div>
		<form method="post" action="jobreg" autocomplete="off" enctype="multipart/form-data">

			<div class="userdetails">

				<div class="inputbox">
					<span class="details">FULL NAME</span>
					<input type="text" name="name" value='<%= request.getAttribute("name")%>' placeholder="enter your name" disabled required>
				</div>

				<div class="inputbox">
					<span class="details"> REG.NO </span>
					<input type="text" name="regno" value='<%=request.getAttribute("regno") %>' placeholder="enter reg.no in caps " required>
				</div>

				<div class="inputbox">
					<span class="details">EMAIL </span>
					<input type="text" name="email" value="<%=request.getAttribute("email") %>" placeholder=" enter your email " required>
				</div>

				<div class="inputbox ">
					<span class="details">10th PERCENTAGE</span>
					<input type="text" name="mark10th" value="<%=request.getAttribute("X") %>" placeholder="enter 10th percentage " required>
				</div>

				<div class="inputbox">
					<span class="details">12th PERCENTAGE</span>
					<input type="text" name="mark12th" value="<%=request.getAttribute("Xll") %>" placeholder="enter 12th percentage" required>
				</div>

				<div class="inputbox">
					<span class="details">UG CGPA</span>
					<input type="text" name="ugcgpa" value="<%=request.getAttribute("ug") %>" placeholder="enter UG cgpa" required>
				</div>

				<div class="inputbox">
					<span class="details">PG CGPA</span>
					<input type="text" name="pgcgpa" value="<%=request.getAttribute("pg") %>" placeholder="enter PG cgpa">
				</div>

				<div class="inputbox">
					<span class="details"> SKILLS</span>
					<input type="text" name="skill" value="<%=request.getAttribute("skill") %>" placeholder="enter your skills" required>
				</div>

				<div class="inputbox">
					<span class="details"> ANY ARREAR</span>
					<select name="arrear">
						<option value="">you have any arrear </option>
						<option value="NO ARREAR"> NO ARREAR</option>
						<option value="1 ARREAR">1 ARREAR </option>
						<option value="2 ARREAR">2 ARREAR </option>
						<option value="3 ARREAR">3 ARREAR </option>
						<option value="ABOVE OF 3 ARREAR">ABOVE OF 3 ARREAR </option>
					</select>
				</div>

				<div class="inputbox">
					<span class="details"> COURSE</span>
					<select name="course">
						<option value=""> select your course</option>
						<option value="BIOCHEMISTRY">M.C.A (COMPUTER APPLICATIONS)</option>
						<option value="COMPUTER SCIENCE"> M.SC COMPUTER SCIENCE</option>
						<option value="ELECRONICS">ELECRONICS</option>
					</select>
				</div>

				<div class="inputbox">
					<span class="details">GENDER</span>
					<select name="gender">
						<option value="">select your gender</option>
						<option value="MALE">MALE</option>
						<option value="FEMALE">FEMALE</option>
						<option value="others">others</option>
					</select>
				</div>

				<div class="inputbox">
					<span class="details">D.O.B</span>
					<input type="date" class="date" name="dob">
				</div>

				<div class="inputbox">
					<div class="file">
						<span class="details">UPLOAD PHOTO</span>
						<input type="text" name="photo" placeholder="G-drive link of your photo" required>
					</div>
				</div>

				<div class="inputbox">
					<div class="file">
						<span class="details">UPLOAD RESUME</span>
						<input type="text" name="resume" placeholder="link of your resume in gdrive" required>
					</div>
				</div>
				<input type="hidden" name="companyid" value="<%= request.getAttribute("cid")%>">

				<div class="sub">
					<input type="submit" name="submit" value="Register">
				</div>
			</div><br>

			<div class="ad">
				<a href="SHome.jsp"><b>Go Back</b></a>
			</div>
		</form>
	</div>
</body>

</html>