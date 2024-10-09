package com.AV.placement;

import javax.servlet.annotation.MultipartConfig;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@MultipartConfig
@WebServlet("/stud_reg")
public class StudReg extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		PrintWriter out=res.getWriter();
		
		String name,regno,email,pass,skill,arrear,course, gender, dob,photo,resume;
		int mark10th,mark12th,ugcgpa,pgccgpa;
		
		name=req.getParameter("name");
		regno=req.getParameter("regno");
		email=req.getParameter("email");
		pass=req.getParameter("pass");
		mark10th=Integer.parseInt(req.getParameter("mark10th"));
		mark12th=Integer.parseInt(req.getParameter("mark12th"));
		ugcgpa=Integer.parseInt(req.getParameter("ugcgpa"));
		pgccgpa=Integer.parseInt(req.getParameter("pgcgpa"));
		skill=req.getParameter("skill");
		arrear=req.getParameter("arrear");
		course=req.getParameter("course");
		gender=req.getParameter("gender");
		dob=req.getParameter("dob");
		photo=req.getParameter("photo");
		resume=req.getParameter("resume");
		
		String sql="insert into `student`values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Connection con=DbConnect.connect();
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,regno );
			pst.setString(2,name);
			pst.setString(3,email);
			pst.setString(4,pass);
			pst.setInt(5,mark10th);
			pst.setInt(6,mark12th);
			pst.setInt(7,ugcgpa);
			pst.setInt(8,pgccgpa);
			pst.setString(9,skill);
			pst.setString(10,arrear);
			pst.setString(11,course);
			pst.setString(12,gender);
			pst.setString(13, dob);
			pst.setString(14, photo);
			pst.setString(15, resume);
			int row=pst.executeUpdate();
			
			if(row>0) {
				out.println("<p>Click <a href='slogin.html'>here</a> to login.</p>");;
				System.out.println(row+" Records inserted successfully....");
			}
			
		} catch (Exception e) {
			out.println("error in registering...");
			System.out.println(e);

		}

	}
}
