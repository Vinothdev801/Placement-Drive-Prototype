package com.placement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import com.mysql.cj.Session;

@WebServlet("/update")
public class UpdateProfile extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session= req.getSession();
		String sql="UPDATE student SET regno=?, name=?, email=?, skills=?, course=?, dob=?, photo=?, resume=? where regno='"+session.getAttribute("regno")+"'";
		
		try(Connection con = DbConnect.connect()){
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, req.getParameter("regno"));
			pst.setString(2,req.getParameter("name"));
			pst.setString(3,req.getParameter("email"));
			pst.setString(4,req.getParameter("skills"));
			pst.setString(5,req.getParameter("course"));
			pst.setString(6,req.getParameter("dob"));
			pst.setString(7, req.getParameter("photo"));
			pst.setString(8, req.getParameter("resume"));
			
			int row=pst.executeUpdate();
			
			if(row>0) {
				System.out.println(row+" Profile update successfully.");
				session.setAttribute("msg","1");
				res.sendRedirect("Profile.jsp");
			}
		}
		catch(Exception e){
			System.out.println("error occured "+e);
		}
	}

}
