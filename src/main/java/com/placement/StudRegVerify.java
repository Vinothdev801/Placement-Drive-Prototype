package com.placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/sregverify")
public class StudRegVerify extends HttpServlet {
	public  void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		PrintWriter out = res.getWriter();
		String sql="select regno from student where regno=?";
		
		try {
			Connection con = DbConnect.connect();
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, req.getParameter("regno"));
			ResultSet result=pst.executeQuery();
			
		    if(result.next()) {
			    System.out.println("Already having account with the given register no..");
				req.getRequestDispatcher("Slogin.html").forward(req, res);// page redirection along with request, response object.
			}
		    else {
		    	req.getRequestDispatcher("stud_reg").forward(req, res);
		    	}
			} catch (Exception e) {
				System.out.println(e);
			}
	}
}
